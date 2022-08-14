<?php

// Check if session is not started, then start it
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

$GLOBALS["config"] = array(
    "mysql" => array(
        'host'=>'phpmyfrost.tk/phpmyadmin',
        'username'=>'root',
        'password'=>'rrjrdr1233A!',
        'db'=>'chat'
    ),
    "remember"=> array(
        'cookie_name'=>'hash',
        'cookie_expiry'=>604800
    ),
    "session"=>array(
        'session_name'=>'user',
        "token_name" => "token",
        "tokens"=>array(
            "register"=>"register",
            "login"=>"login",
            "reset-pasword"=>"reset-pasword",
            "share-post"=>"share-post",
            "saveEdits"=>"saveEdits",
            "logout"=>"logout"
        )
    ),
    "root"=> array(
        'path'=>'https://void47.pages.dev/',
    )
);