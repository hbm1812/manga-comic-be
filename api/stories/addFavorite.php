<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application.json");
    require_once "../../config/DB.php";
    require_once "../../model/stories.php";

    // $sql = "select * from users";
    // $data = DB::execute($sql);

    $param=[
        "user_id" => $_POST["user_id"] ?? "",
        "stories_id" => $_POST["stories_id"] ?? ""
    ];

    $create = Stories::addFavorites($param);    

    echo json_encode($create);
?>