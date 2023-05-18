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


const SERVER = "http:" . DIRECTORY_SEPARATOR . DIRECTORY_SEPARATOR . "localhost" . DIRECTORY_SEPARATOR . "manga-comic-be" . DIRECTORY_SEPARATOR;
const IMAGE_PATH = ".." . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR;
const AVATAR_PATH = "assets" . DIRECTORY_SEPARATOR . "images" . DIRECTORY_SEPARATOR . "avatarUser" . DIRECTORY_SEPARATOR;

$message = array();

if (isset($_POST['username'])) {
    $readUser = User::showUsername([
        'username' => $_POST['username'],
    ]);
    if (!empty($readUser)) {
        array_push($message, "fail");
        echo json_encode($message);
        return;
    }

    $formData = array_merge(array(), $_POST);
    $param = [
        'name' => $_POST["username"] ?? "",
        'email' => $_POST["email"] ?? "",
        'username' => $_POST["username"] ?? "",
        'password' => $_POST["password"] ?? "",
        'phone' => "",
        'role_id' => 2,
        'avatar' => null
    ];

    $create = User::create($param);
}
array_push($message, "success");
echo json_encode($message);
