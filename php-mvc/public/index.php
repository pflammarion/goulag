<?php

use app\controllers\AuthController;
use core\Application;
use app\controllers\HomeController;

defined('ENVIRONMENT') or define('ENVIRONMENT', 'development');
defined('PROTOCOL') or define('PROTOCOL', isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off' ? 'https://' : 'http://');
defined('PATH_TO_HOST') or define('PATH_TO_HOST', PROTOCOL . $_SERVER['HTTP_HOST'] . '/');
defined('BASE_URL') or define('BASE_URL', PATH_TO_HOST . dirname($_SERVER['PHP_SELF']) . '/'); // root path
defined('BASE_URL_ASSETS') or define('BASE_URL_ASSETS', BASE_URL . 'assets/');
defined('USE_DATABASE') or define('USE_DATABASE', false);

if (ENVIRONMENT == 'development') { // dev environment, display all errors
    error_reporting(-1); // E_ALL
    ini_set('display_errors', 1);
} else { // prod environment, hide all errors
    error_reporting(0);
    ini_set('display_errors', 0);
}

// autoloader to use classes using namespace instead of require or include
spl_autoload_register(function ($class) {
    $class = str_replace('\\', '/', $class);
    if (file_exists("../$class.php")) {
        require_once "../$class.php";
    }
});

$dbConfig = [
    'hostname' => 'localhost',
    'username' => 'root',
    'password' => 'password',
    'database' => ''
];

$app = new Application($dbConfig);

$app->router->get('/', [HomeController::class, 'index']);
$app->router->get('/login', [AuthController::class, 'login']);
$app->router->post('/login', [AuthController::class, 'login']);
$app->router->get('/register', [AuthController::class, 'register']);
$app->router->post('/register', [AuthController::class, 'register']);
$app->router->get('/faq', [HomeController::class, 'faq']);

$app->run();
