<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application.json");
    require_once "../../config/DB.php";
    require_once "../../model/stories.php";    

    $read = Stories::findCategoryInStories();    

    echo json_encode($read);
?>