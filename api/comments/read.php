<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application.json");
    require_once "../../config/DB.php";
    require_once "../../model/comments.php";    

    $read = Comments::read();    

    echo json_encode($read);
?>