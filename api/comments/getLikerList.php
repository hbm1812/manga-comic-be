<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application.json");
    require_once "../../config/DB.php";
    require_once "../../model/comments.php";    

    // if (empty($_GET["comment_id"])) {
    //     echo json_encode([]);
    //     die;
    // }
    // $param = [
    //     'comment_id' => $_GET["comment_id"] ?? null,
    // ];
    $read = Comments::getLikerList();    

    echo json_encode($read);
?>