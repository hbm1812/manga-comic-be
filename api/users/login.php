<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application.json");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Method, Authorization, X-Requested-With");

require_once "../../config/DB.php";
require_once "../../model/users.php";

$username = $_POST["username"];
$password = $_POST["password"];

$send = array();
$token = "fail";
$read = User::read();

foreach ($read as $value) {
    if($value["username"] === $username && $value["password"] === $password) {
        $token = "success";
        $value["token"] = $token;
        array_push($send, $value);
    }
}

echo json_encode($send);
