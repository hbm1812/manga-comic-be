<?php 
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application.json");
    require_once "../../config/DB.php";
    require_once "../../model/news.php";

    $checkId = null;
    if(isset($_GET["id"])) {
        $checkId = $_GET["id"] ?? "";
    }
    
    $param = [
        'id' => $checkId,
    ];

    // link test
    // http://localhost/manga-comic-be/api/news/showNewDetail.php?id=4
    $show = News::showNewDetail($param);    

    echo json_encode($show);
