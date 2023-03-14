<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application.json");
header("Access-Control-Allow-Methods: PUT");
header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Method, Authorization, X-Requested-With");

require_once "../../config/DB.php";
require_once "../../model/comments.php";

$data = json_decode(file_get_contents("php://input"));

const SERVER = "http:". DIRECTORY_SEPARATOR . DIRECTORY_SEPARATOR . "localhost" . DIRECTORY_SEPARATOR . "manga-comic-be" . DIRECTORY_SEPARATOR;
const IMAGE_PATH = ".." . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR;
const THUMBNAIL_PATH = "assets" . DIRECTORY_SEPARATOR . "images" . DIRECTORY_SEPARATOR . "comments" . DIRECTORY_SEPARATOR;

// check id parent
$sql = "SELECT comment.*, users.name, users.avatar AS `user_avatar` FROM comment, users WHERE users.id = comment.user_id AND comment.id = :id";
$find = DB::execute($sql, [
    'id' => $_POST["id"],
]);

$getParentId;
if ($find[0]["parent_id"] === null) {
    $getParentId = null;
} else {
    $getParentId = $find[0]["parent_id"];
}

echo json_encode($getParentId);

if (isset($_POST['id'])) {

    // test only text 
    if($_POST['thumbnail'] === "") {
        $param = [
            'id' => $_POST["id"] ?? -1,
            'user_id' => $_POST["user_id"] ?? null,
            'news_id' => $_POST["news_id"] ?? null,
            'parent_id' => $getParentId,
            'thumbnail' => $_POST["thumbnail"] ?? null,
            'content' => $_POST["content"] ?? null,
        ];
    
        $update = Comments::update($param);

        echo json_encode($update);
        die;
    }


    $formData = array_merge(array(), $_POST);
    $formData = array_merge($formData, $_FILES);    

    $param = [
        'id' => $_POST["id"] ?? -1,
    ];
    $comments = Comments::find($param);
    $comment = array();
    
    if ($formData["thumbnail"]["size"] !== 0) {
        $file = $formData["thumbnail"];        
        $extension = current(array_slice(explode(".", $file["name"]), -1));        
        $fileName = THUMBNAIL_PATH . uniqid().".".$extension;
        move_uploaded_file($file["tmp_name"], IMAGE_PATH . $fileName);

        $getFileName = SERVER . $fileName;
    }
    
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



    $param = [
        'id' => $_POST["id"] ?? -1,
        'user_id' => $_POST["user_id"] ?? null,
        'news_id' => $_POST["news_id"] ?? null,
        'parent_id' => $getParentId,
        'thumbnail' => $getFileName ?? null,
        'content' => $_POST["content"] ?? null,
    ];

    $update = Comments::update($param);
}







if (isset($_POST['id'])) {    
    

    $param = [
        // 'username' => $data->username || $_POST["username"],
        // 'email' => $data->email || $_POST["email"],
        // 'role' => $data->role || $_POST["role"],
        // 'password' => $data->password || $_POST["password"]
        
        'id' => $_POST["id"] ?? -1,
        'name' => $_POST["name"] ?? "",
        'email' => $_POST["email"] ?? "",
        'username' => $_POST["username"] ?? "",
        'password' => $_POST["password"] ?? "",
        'phone' => $_POST["phone"] ?? "",
        'role_id' => $_POST["role_id"] ?? "",
        'avatar' => $getFileName ?? null
    ];

    $update = User::update($param);    

}
