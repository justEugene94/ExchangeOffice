<?php

include 'config.php';

header("Content-Type: text/html; charset='utf-8'");

function __autoload($file){
    if(file_exists('Controllers/' . $file . '.php')){
        require_once 'Controllers/' . $file . '.php';
    }
    else {
        require_once 'Models/' . $file . '.php';
    }
}

$request_uri = explode('?', $_SERVER['REQUEST_URI'], 2);

switch ($request_uri[0]) {

    case "/":
        $init = new IndexController();
        echo $init->getCourse();
        break;

    case "/add":
        $init = new PurchasesController();
        echo $init->store();
        break;

    case "/get-coefficients":
        $init = new CoefficientsController();
        echo $init->index();
        break;

    case "/add-coefficient":
        $init = new CoefficientsController();
        echo $init->store();
        break;

}