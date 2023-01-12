<?php

namespace core;

use core\Controller;
use core\Router;
use core\View;

class Application
{
    public static Application $app;
    public Router $router;
    public View $view;
    public ?Controller $controller = null;
    public Database $db;

    public function __construct($dbConfig) // string $dirname, array $config
    {
        self::$app = $this;
        $this->router = new Router();
        $this->view = new View();
        $this->db = new Database($dbConfig);
    }

    public function run(): void
    {
        echo $this->router->resolve();
    }
}

