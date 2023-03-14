<?php
    header("Access-Control-Allow-Origin: *");
    require_once "../../config/DB.php";
    require_once "../../model/news.php";

    $data = News::read();

    echo json_encode($data);
?>