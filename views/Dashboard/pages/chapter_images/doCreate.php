<?php

    $Addchapter_id=$_GET['id'];


    require_once "../../../../config/DB.php";
    // chọn ảnh từ file và đẩy lên web
    const IMAGE_PATH = ".." . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR;
    const CHAPTER_PATH =  "img" . DIRECTORY_SEPARATOR . "chapter" . DIRECTORY_SEPARATOR;
    $formData = array_merge(array(), $_POST);
    $formData = array_merge($formData, $_FILES);
    echo $Addchapter_id;
    
    if ($formData["image"]["size"] !== 0) {
        $file = $formData["image"];
        $extension = current(array_slice(explode(".", $file["name"]), -1));
        $fileName = CHAPTER_PATH . uniqid().".".$extension;
        move_uploaded_file($file["tmp_name"], IMAGE_PATH . $fileName);
    }

    // Lưu dữ liệu
    $data = [        
        "image" => $fileName ?? null,
        "Addchapter_id" => $Addchapter_id,

    ];

    $sql = "INSERT INTO `chapter_images`( `thumbnail`, `chapter_id`) VALUES ( :image,  :Addchapter_id) ";
    DB::execute($sql, $data);

    header("Location: http://localhost/manga-comic-be/views/Dashboard/index.php");
