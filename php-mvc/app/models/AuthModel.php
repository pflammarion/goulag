<?php

namespace app\models;

use core\Application;
use core\Database;
use core\Model;

class AuthModel extends Model
{
    public function register(array $user): int
    {
        $db = Application::$app->db;
        $db->table('user');
        return $db->runInsertQuery($user);
    }
}
