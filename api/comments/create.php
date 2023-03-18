<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application.json");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Method, Authorization, X-Requested-With");

require_once "../../config/DB.php";
require_once "../../model/comments.php";

const SERVER = "http:" . DIRECTORY_SEPARATOR . DIRECTORY_SEPARATOR . "localhost" . DIRECTORY_SEPARATOR . "manga-comic-be" . DIRECTORY_SEPARATOR;
const IMAGE_PATH = ".." . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR;
const THUMBNAIL_PATH = "assets" . DIRECTORY_SEPARATOR . "images" . DIRECTORY_SEPARATOR . "comments" . DIRECTORY_SEPARATOR;

if (isset($_POST['user_id'])) {
    // test đc trường hợp có text with image && only image 
    // only text hỏng
    if($_POST['thumbnail'] === "") {
        $param = [
            'user_id' => $_POST["user_id"] ?? null,
            'news_id' => $_POST["news_id"] ?? null,
            'story_id' => $_POST["story_id"] ?? null,
            'parent_id' => $_POST["parent_id"] ?? null,
            'thumbnail' => $getFileName ?? null,
            // 'thumbnail' => $_POST["thumbnail"],
            'content' => $_POST["content"] ?? null,
        ];
    
        $create = Comments::create($param);

        echo json_encode($create);
        die;
    }

    $formData = array_merge(array(), $_POST);
    $formData = array_merge($formData, $_FILES);
    if ($formData["thumbnail"]["size"] !== 0) {
        $file = $formData["thumbnail"];
        $extension = current(array_slice(explode(".", $file["name"]), -1));
        $fileName = THUMBNAIL_PATH . uniqid() . "." . $extension;
        move_uploaded_file($file["tmp_name"], IMAGE_PATH . $fileName);

        $getFileName = SERVER . $fileName;
    }


    $param = [
        'user_id' => $_POST["user_id"] ?? null,
        'news_id' => $_POST["news_id"] ?? null,
        'story_id' => $_POST["story_id"] ?? null,
        'parent_id' => $_POST["parent_id"] ?? null,
        'thumbnail' => $getFileName ?? null,
        // 'thumbnail' => $_POST["thumbnail"],
        'content' => $_POST["content"] ?? null,
    ];

    $create = Comments::create($param);
}

echo json_encode($create);
