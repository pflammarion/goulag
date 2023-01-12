<?php

namespace app\models;

use core\Application;
use core\Database;
use core\Model;

class HomeModel extends Model
{
    public function getPageText(): array
    {
        // get page text from database or code
        return USE_DATABASE ? $this->getTextFromDB() : $this->getTextFromCode();
    }

    public function getTextFromDB(): array
    {
        $db = Application::$app->db;
        $db->table('cow');
        $db->join('left', 'cowFk', 'cow.id = cowFk.id');
        $db->where('cowFk', '1');
        $db->orderBy('Cow');
        $db->fetch(Database::PDO_FETCH_MULTI);

        $templateLinks = $db->runSelectQuery('cow as c', 'cowFK.*');

        $page = ['info' => [], 'links' => []];

        foreach ($templateLinks as $link) {
            $page['info'] = $link;
            $page['links'][] = $link;
        }

        return $page;
    }

    public function getTextFromCode(): array
    {
        return [
            'info' => [
                'title' => 'Home',
                'subtitle' => 'simple PHP MVC framework.',
                'description' => 'This is my PHP MVC framework',
            ],
            'links' => [
                [
                    'link_title' => 'qsdf',
                    'link_url' => 'd',
                ],
            ]
        ];
    }

    public function getFAQ(): array
    {
        $db = Application::$app->db;
        $db->table('faq');
        $db->fetch(Database::PDO_FETCH_MULTI);
        return $db->runSelectQuery();
    }
}
