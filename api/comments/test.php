<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application.json");
require_once "../../config/DB.php";
require_once "../../model/comments.php";

$sql = "SELECT * FROM comment WHERE parent_id = 120";

$show = DB::execute($sql);

foreach ($show as $value) {
    echo "value     ";
    print_r($value["thumbnail"]);

    $comment = array();
    if (!empty($comments)) {
        $comment = array_merge(array(), $comments[0]);

        $getThumbnail = $comment["thumbnail"];
        $getLinkThumbnail = implode(DIRECTORY_SEPARATOR, array_slice(explode(DIRECTORY_SEPARATOR, $getThumbnail), 4));
    }

    if (!empty($comment["thumbnail"])) {
        // Xoá file cũ
        if (file_exists(IMAGE_PATH . $getLinkThumbnail)) {
            unlink(IMAGE_PATH . $getLinkThumbnail);
        }
    }
}
die;

echo json_encode($show);

    // test truyền nhiều GET http://localhost/manga-comic-be/api/comments/show.php?news_id=9&parent_id=10
    // echo json_encode($show);
