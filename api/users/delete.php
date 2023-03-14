<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application.json");
header("Access-Control-Allow-Methods: DELETE");
header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Method, Authorization, X-Requested-With");

require_once "../../config/DB.php";
require_once "../../model/users.php";

$data = json_decode(file_get_contents("php://input"));

const SERVER = "http:" . DIRECTORY_SEPARATOR . DIRECTORY_SEPARATOR . "localhost" . DIRECTORY_SEPARATOR . "manga-comic-be" . DIRECTORY_SEPARATOR;
const IMAGE_PATH = ".." . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR;
const AVATAR_PATH = "assets" . DIRECTORY_SEPARATOR . "images" . DIRECTORY_SEPARATOR . "avatarUser" . DIRECTORY_SEPARATOR;

if (isset($_POST['id'])) {

    $param = [
        'id' => $_POST["id"] ?? -1,
    ];
    $users = User::show($param);
    $user = array();
    if (!empty($users)) {
        $user = array_merge(array(), $users[0]);

        $getAvatar = $user["avatar"];
        $getLinkAvatar = implode(DIRECTORY_SEPARATOR, array_slice(explode(DIRECTORY_SEPARATOR, $getAvatar), 4));

    }

    if (!empty($user["avatar"])) {
        // Xoá file cũ
        if (file_exists(IMAGE_PATH . $getLinkAvatar)) {
            unlink(IMAGE_PATH . $getLinkAvatar);
        }
    }
    
    $param = [
        'id' => $_POST["id"] ?? -1,
    ];

    $delete = User::delete($param);
}
