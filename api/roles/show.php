<?php 
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application.json");
    require_once "../../config/DB.php";
    require_once "../../model/roles.php";

    $checkId = null;
    if(isset($_GET["id"])) {
        $checkId = $_GET["id"] ?? "";
    }
    
    $param = [
        'id' => $checkId,
    ];

    // link test
    // http://localhost/manga-comic-be/api/users/show.php?id=3
    $show = Role::show($param);    

    echo json_encode($show);
