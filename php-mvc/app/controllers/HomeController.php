<?php

namespace app\controllers;

use core\Application;
use core\Controller;
use app\models\HomeModel;

/** Handle functionality for home page. */
class HomeController extends Controller
{
    public function index(): string
    {
        $homeModel = new HomeModel();
        $data = array(
            'title' => 'Accueil',
            'page' => $homeModel->getPageText()
        );
        return $this->render('home', $data);
    }

    public function faq(): string
    {
        $homeModel = new HomeModel();
        $data = array(
            'title' => 'FAQ',
            'faq' => $homeModel->getFAQ()
        );
        return $this->render('faq', $data);
    }

}
