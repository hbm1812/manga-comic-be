<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application.json");
header("Access-Control-Allow-Methods: DELETE");
header("Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Method, Authorization, X-Requested-With");

require_once "../../config/DB.php";
require_once "../../model/comments.php";

$data = json_decode(file_get_contents("php://input"));

const SERVER = "http:" . DIRECTORY_SEPARATOR . DIRECTORY_SEPARATOR . "localhost" . DIRECTORY_SEPARATOR . "manga-comic-be" . DIRECTORY_SEPARATOR;
const IMAGE_PATH = ".." . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR;
const AVATAR_PATH = "assets" . DIRECTORY_SEPARATOR . "images" . DIRECTORY_SEPARATOR . "comments" . DIRECTORY_SEPARATOR;

if (isset($_POST["id"])) {
    // xóa reply
    $sql = "SELECT * FROM comment WHERE parent_id = :parent_id";

    $findReply = DB::execute($sql, [
        'parent_id' => $_POST["id"],
    ]);

    foreach ($findReply as $value) {
        // echo "value     ";
        // print_r($value["thumbnail"]);
        $getThumbnail = $value["thumbnail"];
        $getLinkThumbnailReply = implode(DIRECTORY_SEPARATOR, array_slice(explode(DIRECTORY_SEPARATOR, $getThumbnail), 4));        

        if (!empty($value["thumbnail"])) {
            // Xoá file cũ
            if (file_exists(IMAGE_PATH . $getLinkThumbnailReply)) {
                unlink(IMAGE_PATH . $getLinkThumbnailReply);
            }
        }
    }

    $sql = "DELETE FROM comment WHERE parent_id=:parent_id";

    $deleteReply = DB::execute($sql, [
        'parent_id' => $_POST["id"],
    ]);

    // xóa comment
    $param = [
        'id' => $_POST["id"] ?? -1,
    ];
    $comments = Comments::find($param);

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


    $param = [
        'id' => $_POST["id"] ?? -1,
    ];

    $delete = Comments::delete($param);
}