<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application.json");
    require_once "../../config/DB.php";
    require_once "../../model/stories.php";

    $checkStoryId = null;
    if (isset($_GET["story_id"])) {
        $checkStoryId = $_GET["story_id"] ?? "";
    }

    $param = [
        'story_id' => $checkStoryId,
    ];

    $read = Stories::getCharacter($param);    

    echo json_encode($read);
?>