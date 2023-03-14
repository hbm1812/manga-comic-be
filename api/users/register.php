<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application.json");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Method, Authorization, X-Requested-With");

require_once "../../config/DB.php";
require_once "../../model/users.php";

$data = json_decode(file_get_contents("php://input"));

$data = User::read();

if($data) {
    
} else {
    $respon["data"] = array(
        "status" => "invalid"
    );

    echo json_encode($respon);
}

if(isset($data) && isset($_POST["username"])) {
    $param = [];    
    foreach($data as $value) {
        echo "Value:". $value["username"];
        if(isset($_POST["username"])) {
            if($value["username"] !== $_POST["username"]) {
                $param = [
                    'email' => $_POST["email"] ?? "",
                    'username' => $_POST["username"] ?? "",
                    'password' => $_POST["password"] ?? "",        
                ];

                $respon["data"] = array(
                    "status" => "valid"
                );            
                echo json_encode($respon);
            }
        } else {
            $respon["data"] = array(
                "status" => "invalid"
            );

            echo json_encode($respon);
        }
    }        
    $create = User::create($param);
}