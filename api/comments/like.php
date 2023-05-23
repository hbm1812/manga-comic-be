<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application.json");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Method, Authorization, X-Requested-With");

require_once "../../config/DB.php";
require_once "../../model/comments.php";

const SERVER = "http:" . DIRECTORY_SEPARATOR . DIRECTORY_SEPARATOR . "localhost" . DIRECTORY_SEPARATOR . "manga-comic-be" . DIRECTORY_SEPARATOR;

$response = [];

if (empty($_POST['user_id'])) {
    $response = [
        'status' => "failure",
        'message' => "Not logged in"
    ];
    
    echo json_encode($response);
    die;
}
if(empty($_POST['comment_id'])) {
    $response = [
        'status' => "failure",
        'message' => "Comment ID not provided"
    ];

    echo json_encode($response);
    die;
}

$param = [
    'user_id' => $_POST["user_id"] ?? null,
    'comment_id' => $_POST["comment_id"] ?? null,
];

$result = Comments::like($param);

if (!$result) {
    $response = [
        'status' => "failure",
        'message' => "Already liked this comment"
    ];

    echo json_encode($response);
    die;
}

$response = [
    'status' => "success",
    'message' => "OK"
];
echo json_encode($response);
