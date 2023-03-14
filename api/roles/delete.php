<?php 
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application.json");
    header("Access-Control-Allow-Methods: DELETE");
    header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Method, Authorization, X-Requested-With");

    require_once "../../config/DB.php";
    require_once "../../model/roles.php";

    // $checkId = null;
    // if(isset($_GET["id"])) {
    //     $checkId = $_GET["id"];
    // }

    $data = json_decode(file_get_contents("php://input"));
    
    $param = [
        // 'id' => $data->id,
        
        'id' => $_POST["id"] ?? "",
    ];

    $delete = Role::delete($param);    
    

