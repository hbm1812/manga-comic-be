<?php
    header("Access-Control-Allow-Origin: *");
    require_once "../../config/DB.php";
    $sql = "select * from users";
    const IMAGE_PATH = ".." . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR;

    $data = DB::execute($sql);

    $strDataAva = $data[0]["avatar"];

    $testAva = explode(DIRECTORY_SEPARATOR, $strDataAva);

    $arraySlide = array_slice($testAva, 4);

    $dataRespon = current($arraySlide);

    $convertArray = implode(DIRECTORY_SEPARATOR, $arraySlide);
    $full = implode(DIRECTORY_SEPARATOR, array_slice(explode(DIRECTORY_SEPARATOR, $strDataAva), 4));

    // var_dump($data[0]["avatar"]);
    $user = array_merge(array(), $data[0]);
    // var_dump($user["avatar"]);

    // if (!empty($user["avatar"])) {
    //     echo "tồn tại avatar";
    //     // Xoá file cũ
    //     // if (file_exists(IMAGE_PATH . $data["avatar"])) {
    //     //     echo "tồn tại link";
    //     //     unlink(IMAGE_PATH . $data["avatar"]);
    //     // }
    //     // var_dump($full);
    //     // die;
    // } else {
    //     echo "không tồn tại avatar";
    // }    

    // echo json_encode($data);
?>