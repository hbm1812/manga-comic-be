<?php 
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application.json");
    require_once "../../config/DB.php";
    require_once "../../model/stories.php";

    $checkKeyword = null;
    if(isset($_GET["keyword"])) {
        $checkKeyword = $_GET["keyword"] ?? "";
    }
    
    $param = [
        'keyword' => $checkKeyword,
    ];

    // link test
    // http://localhost/manga-comic-be/api/stories/show.php?id=3
    $show = Stories::findStory($param);    

    echo json_encode($show);
