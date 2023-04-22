<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application.json");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Method, Authorization, X-Requested-With");

require_once "../../config/DB.php";
require_once "../../model/users.php";

// $data = json_decode(file_get_contents("php://input"));
// $sql = `INSERT INTO users SET username= "huyRegis", email="huy123@gmail.com", password="123456"`;
// $param = [
//     'name' => $_POST["name"] ?? "",
//     'email' => $_POST["email"] ?? "",
//     'username' => $_POST["username"] ?? "",
//     'password' => $_POST["password"] ?? "",
//     'phone' => $_POST["phone"] ?? "",
//     'role_id' => $_POST["role_id"] ?? "",
//     'avatar' => $getFileName ?? null
// ];

// // $create = User::create($param);
// $create = DB::execute($sql, $param);