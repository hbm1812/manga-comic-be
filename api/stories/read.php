<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application.json");
    require_once "../../config/DB.php";
    require_once "../../model/stories.php";

    // $sql = "select * from users";
    // $data = DB::execute($sql);

    $read = Stories::read();    

    echo json_encode($read);
?>