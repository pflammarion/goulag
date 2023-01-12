<?php
require 'system/config.php';
/**
 * Error and Exception handling
 */
error_reporting(E_ALL);
set_error_handler('Core\Error::errorHandler');
set_exception_handler('Core\Error::exceptionHandler');


/**
 * Routing
 */
$router = new Router();

$controller = $router->getController();
$method = $router->getMethod();
$param = $router->getParam();

$router->dispatch($_SERVER['QUERY_STRING']);