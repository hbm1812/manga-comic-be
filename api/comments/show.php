<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application.json");
    require_once "../../config/DB.php";
    require_once "../../model/comments.php";    

    $checkId = null;
    $checkIdStory = null;
    if(isset($_GET["news_id"])) {
        $checkId = $_GET["news_id"] ?? "";
    } 
    
    if(isset($_GET["story_id"])) {
        $checkIdStory = $_GET["story_id"] ?? "";
    }

    // story_id
    $param = [
        'news_id' => $checkId,
        'story_id' => $checkIdStory,
    ];
    $show = Comments::show($param);

    echo json_encode($show);

    // test truyền nhiều GET http://localhost/manga-comic-be/api/comments/show.php?news_id=9&parent_id=10
    // echo json_encode($show);
?>