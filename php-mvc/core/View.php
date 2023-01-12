<?php

namespace core;

use core\Model;

class View
{
    public function renderView($view, array $params): array|bool|string
    {
        $layoutName = 'main';
        if (Application::$app->controller) {
            $layoutName = Application::$app->controller->layout;
        }

        extract($params);
        ob_start();
        include_once __DIR__ . "/../app/views/$layoutName.php";
        return str_replace('{{content}}', $this->renderViewOnly($view, $params), ob_get_clean());
    }

    public function renderViewOnly($view, array $params): bool|string
    {
        extract($params); // convert array key/values to individual php variables for the view
        ob_start();
        include_once __DIR__ . "/../app/views/$view.php";
        return ob_get_clean();
    }

    public function escapeHtml(string $string): string
    {
        return htmlentities($string, ENT_QUOTES, 'UTF-8');
    }
}
