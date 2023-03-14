<?php 
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application.json");
    header("Access-Control-Allow-Methods: POST");
    header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Method, Authorization, X-Requested-With");

    require_once "../../config/DB.php";
    require_once "../../model/roles.php";

    // $checkId = null;
    // if(isset($_GET["id"])) {
    //     $checkId = $_GET["id"];
    // }

    $data = json_decode(file_get_contents("php://input"));
    
    $param = [
        // test lấy qua postman
        // 'username' => $data->username || $_POST["username"],
        // 'email' => $data->email || $_POST["email"],
        // 'role' => $data->role || $_POST["role"],
        // 'password' => $data->password || $_POST["password"]        

        'name' => $_POST["name"] ?? ""
    ];

    // var_dump($_POST);
    // die;

    $create = Role::create($param);    
    

