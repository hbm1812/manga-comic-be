<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application.json");
    require_once "../../config/DB.php";
    require_once "../../model/stories.php";

    $checkChapter_id = null;
    if (isset($_GET["chapter_id"])) {
        $checkChapter_id = $_GET["chapter_id"] ?? "";
    }

    $param = [
        'chapter_id' => $checkChapter_id,
    ];

    // test
    // http://localhost/manga-comic-be/api/stories/findChapterImage.php?chapter_id=1
    $read = Stories::findChapterWithThumbnail($param);    

    echo json_encode($read);
?>