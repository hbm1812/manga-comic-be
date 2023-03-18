<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application.json");
    require_once "../../config/DB.php";
    require_once "../../model/stories.php";

    $checkKeyword = null;
    if (isset($_GET["keyword"])) {
        $checkKeyword = $_GET["keyword"] ?? "";
    }

    $param = [
        'keyword' => $checkKeyword,
    ];

    $read = Stories::getChapter($param);

    $newdata = array();
    foreach ($read as $value) {
        // handle name end get number chapter
        $getStrName = $value["name"];
        $convertToArray = explode(" ", $getStrName);
        $getNumberChapter = array_pop($convertToArray);
        
        // assign number chapter to chapter index :V
        $value["chapter_index"] = $getNumberChapter;
        array_push($newdata, $value);
    }
    echo json_encode($newdata);

    // die;
    // echo json_encode($read);
