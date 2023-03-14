<?php
    header("Access-Control-Allow-Origin: *");
    require_once "./config/DB.php";
    $sql = "select * from users";

    $data = DB::execute($sql);

    echo json_encode($data);
?>