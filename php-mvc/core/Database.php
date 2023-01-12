<?php

namespace core;

use PDO;
use PDOException;

/**
 * Handles communication with the database.
 * SQL injections are prevented by using prepared statements.
 */
class Database
{
    /** Fetch multiple rows */
    public const PDO_FETCH_MULTI = 'multi';

    /** Fetch a single associative array */
    public const PDO_FETCH_SINGLE = 'single';

    /** Get the affected row count */
    public const PDO_GET_ROW_COUNT = 'count';

    /** Database connection PDO */
    private PDO $_conn;
    private array $_executeParams;
    private string $_fetchType;
    private string $_sql;
    private string $_tableName;
    private array $_where;
    private array $_join;
    private array $_orderBy;

    /**
     * Setup connection to database and initialize.
     *
     * @param array $database Database credentials.
     */
    public function __construct(array $database)
    {
        try { // open PDO connection to the database
            $this->_conn = new PDO("mysql:host={$database['hostname']};dbname={$database['database']}", $database['username'], $database['password']);
            $this->_conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // set PDO to return errors
            $this->_initialize();
        } catch (PDOException $e) { // if database connection failed
            die($e->getMessage());
        }
    }

    private function _initialize(): void
    {
        $this->_sql = '';
        $this->_tableName = '';
        $this->_executeParams = [];
        $this->_join = [];
        $this->_where = [];
        $this->_orderBy = [];
        $this->_fetchType = '';
    }

    public function table(string $tableName): void
    {
        $this->_tableName = $tableName;
    }

    /**
     * Set a join for use when running the query.
     *
     * @param string $type Type of join (left, right, etc).
     * @param string $tableString Name of the table for joining.
     * @param string $onString ON string for the join.
     * @return void
     */
    public function join(string $type, string $tableString, string $onString): void
    {
        $this->_join[] = [
            'type' => $type,
            'table' => $tableString,
            'on' => $onString
        ];
    }

    /**
     * @param string $column
     * @param string $value
     * @param string $type Accepts 'AND', or 'OR'. Default empty
     * @return void
     */
    public function where(string $column, string $value, string $type = ''): void
    {
        $this->_where[] = [
            'column' => $column,
            'value' => $value,
            'type' => $type
        ];
    }

    /** Set order by for use when running the query (ASC/DESC). */
    public function orderBy(string $column, string $direction = 'ASC'): void
    {
        $this->_orderBy[] = ['column' => $column, 'direction' => $direction];
    }

    /** Set the fetch type the PDO result with use. */
    public function fetch(string $fetchType): void
    {
        $this->_fetchType = $fetchType;
    }

    private function _buildJoin(): void
    {
        if (!$this->_join) {
            return;
        }

        foreach ($this->_join as $join) {
            $this->_sql .= ' ' . strtoupper($join['type']) . " JOIN {$join['table']} ON ( {$join['on']} )";
        }
    }

    private function _buildWhere(): void
    {
        if (!$this->_where) {
            return;
        }

        $this->_sql .= ' WHERE';
        foreach ($this->_where as $where) {
            $columnVariableName = ':' . str_replace('.', '', $where['column']);

            // add where column/value to sql statement
            $this->_sql .= " {$where['type']} {$where['column']} = $columnVariableName";

            // map where vars to values to be used on execution
            $this->_executeParams[$columnVariableName] = $where['value'];
        }
    }

    private function _buildOrderBy(): void
    {
        if ($this->_orderBy) {
            $orderBys = [];
            foreach ($this->_orderBy as $order) {
                $orderBys[] = "{$order['column']} {$order['direction']}";
            }
            $this->_sql .= ' ORDER BY ' . implode(', ', $orderBys); // add order by to sql string
        }
    }

    /**
     * @param array $insertData Array keys must be the name of the columns in the database table.
     * @return integer ID of the inserted row.
     */
    public function runInsertQuery(array $insertData): int
    {
//      e.g. INSERT INTO `users` (`username`, `email`, `password`) VALUES (:username, :email, :password)
        $this->_sql = "INSERT INTO $this->_tableName (" . implode(',', array_keys($insertData)) . ') VALUES (:' . implode(', :', array_keys($insertData)) . ')';

        foreach ($insertData as $column => $value) { // add to prepared statements
            $this->_executeParams[':' . $column] = $value;
        }
        return $this->_runQuery();
    }

    /**
     * Building a SELECT query requires fetch( Database::PDO_FETCH_SINGLE | Database::PDO_FETCH_MULTI )
     */
    public function runSelectQuery(string ...$columns): array
    {
        $select = $columns ? implode(',', $columns) : '*';
        $this->_sql = "SELECT $select FROM $this->_tableName";
        $this->_buildJoin();
        $this->_buildWhere();
        $this->_buildOrderBy();
        return $this->_runQuery();
    }

    /**
     * @param array $updateData Array keys are the column names.
     * @return int
     */
    public function runUpdateQuery(array $updateData): int
    {
        $setSql = '';
        $rowCount = 1;
        $this->_fetchType = Database::PDO_GET_ROW_COUNT;

        foreach ($updateData as $column => $value) {
            // add column and column variable to set sql
            $setSql .= "$column = :$column" . ($rowCount != count($updateData) && ', ');

            // @todo allow multiple identical prepared statements keys
            $this->_executeParams[':' . $column] = $value;
            $rowCount++;
        }
        $this->_sql = "UPDATE $this->_tableName SET $setSql";
        $this->_buildWhere();
        return $this->_runQuery();
    }

    public function runDeleteQuery(): int
    {
        $this->_fetchType = Database::PDO_GET_ROW_COUNT;
        $this->_sql = "DELETE FROM $this->_tableName";
        $this->_buildWhere();
        return $this->_runQuery();
    }

    /**
     * @param string $sql String of the sql to execute. This should contain variables in place of the values.
     * @param array $params Array of the params. The keys should be the :variables in the $sql string.
     * @return array|int
     */
    public function runCustomQuery(string $sql, array $params = []): int|array
    {
        $this->_sql = $sql;
        $this->_executeParams = $params;

        return $this->_runQuery();
    }

    private function _runQuery(): array|int
    {
        $pdo = $this->_conn->prepare($this->_sql);

        $pdo->setFetchMode(PDO::FETCH_ASSOC); // set to fetch an array

        $pdo->execute($this->_executeParams); // execute the query with the prepared statements

        if (Database::PDO_FETCH_SINGLE == $this->_fetchType) { // fetching single array
            $result = $pdo->fetch();
        } elseif (Database::PDO_FETCH_MULTI == $this->_fetchType) { // fetch multidimensional array
            $result = $pdo->fetchAll();
        } elseif (Database::PDO_GET_ROW_COUNT == $this->_fetchType) { // fetch last insert id
            $result = $pdo->rowCount();
        } else {
            $result = $this->_conn->lastInsertId(); // return last inserted row id
        }
        $this->_initialize();
        return $result;
    }
}
