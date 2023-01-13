<?php

namespace core;

class Router
{
    private array $_params;

    private array $_routes = [];

    public function __construct()
    {
        // check for base folder
        $_SERVER['REQUEST_URI'] = !str_contains($_SERVER['REQUEST_URI'], basename(dirname(__DIR__))) ? '/' . basename(dirname(__DIR__)) . $_SERVER['REQUEST_URI'] : $_SERVER['REQUEST_URI'];

        // update request uri base to be the current folder only, ex: baseurl/?test=1&test2=2
        $_SERVER['REQUEST_URI'] = strstr($_SERVER['REQUEST_URI'], basename(dirname(__DIR__)));

        // explode on ? for any uri variables, ex: test=1&test2=2
        $requestUriVariables = explode('?', $_SERVER['REQUEST_URI']);

        // set server query string to variables if they are found after the first "?"
        $_SERVER['QUERY_STRING'] = $requestUriVariables[1] ?? '';

        // set php $_GET array to every variable found in the query string
        parse_str($_SERVER['QUERY_STRING'], $_GET);

        // explode uri on slash to get pieces
        $uriStringPieces = array_filter(explode('/', $_SERVER['REQUEST_URI']));

        foreach ($uriStringPieces as $key => &$mvcPathPiece) {
            $mvcPathPiecePieces = explode('?', $mvcPathPiece); // explode piece on "?" in case we have params
            $mvcPathPiece = $mvcPathPiecePieces[0]; // update piece so the params are removed from url
        }
        unset($mvcPathPiece);

        // re-key and remove empty array values
        $uriStringPieces = array_values(array_filter($uriStringPieces));

        // save all other variables to the params
        $this->_params = $uriStringPieces;
    }

    public function get(string $path, $callback): void
    {
        $this->_routes['get'][$path] = $callback;
    }

    public function post(string $path, $callback): void
    {
        $this->_routes['post'][$path] = $callback;
    }

    public function resolve()
    {
        $method = strtolower($_SERVER['REQUEST_METHOD']);
        if(isset($_SERVER['REQUEST_URI'])){
            $string = $_SERVER['REQUEST_URI'];
            $parts = explode("/", $string);
            $parts = array_slice($parts, 1);
            $path = implode("", $parts);
        }
        else $path = '/';
        $callback = $this->_routes[$method][$path] ?? false;
        if (!$callback) {
            http_response_code(404);
            return $this->renderView('404', ['title' => '404']);
        }
        if (is_string($callback)) {
            return $this->renderView($callback);
        } elseif (is_array($callback)) {
            $callback[0] = new $callback[0]();
        }
        return call_user_func($callback, $this->_params);
    }

    public function renderView($view, $params = []): array|bool|string
    {
        return Application::$app->view->renderView($view, $params);
    }

    public function redirect($url): void
    {
        header("Location: $url");
    }

    public function getMethod(): string
    {
        return strtolower($_SERVER['REQUEST_METHOD']);
    }
}
