<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application.json");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Method, Authorization, X-Requested-With");

require_once "../../config/DB.php";
require_once "../../model/users.php";

// $checkId = null;
// if(isset($_GET["id"])) {
//     $checkId = $_GET["id"];
// }

$data = json_decode(file_get_contents("php://input"));

// if(isset($_FILES["avatar"])) {
//     var_dump($_FILES["avatar"]);
//     die;
// }


const SERVER = "http:" . DIRECTORY_SEPARATOR . DIRECTORY_SEPARATOR . "localhost" . DIRECTORY_SEPARATOR . "manga-comic-be" . DIRECTORY_SEPARATOR;
const IMAGE_PATH = ".." . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR;
const AVATAR_PATH = "assets" . DIRECTORY_SEPARATOR . "images" . DIRECTORY_SEPARATOR . "avatarUser" . DIRECTORY_SEPARATOR;

if (isset($_POST['username'])) {
    $formData = array_merge(array(), $_POST);
    $formData = array_merge($formData, $_FILES);

    if ($formData["avatar"]["size"] !== 0) {
        $file = $formData["avatar"];
        $extension = current(array_slice(explode(".", $file["name"]), -1));
        $fileName = AVATAR_PATH . uniqid() . "." . $extension;
        move_uploaded_file($file["tmp_name"], IMAGE_PATH . $fileName);

        $getFileName = SERVER . $fileName;
    }



    $param = [
        // 'username' => $data->username || $_POST["username"],
        // 'email' => $data->email || $_POST["email"],
        // 'role' => $data->role || $_POST["role"],
        // 'password' => $data->password || $_POST["password"]

        'name' => $_POST["name"] ?? "",
        'email' => $_POST["email"] ?? "",
        'username' => $_POST["username"] ?? "",
        'password' => $_POST["password"] ?? "",
        'phone' => $_POST["phone"] ?? "",
        'role_id' => $_POST["role_id"] ?? "",
        'avatar' => $getFileName ?? null
    ];

    $create = User::create($param);
}
