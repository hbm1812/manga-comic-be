<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application.json");
    require_once "../../config/DB.php";
    require_once "../../model/stories.php";

    $checkName = null;
    if(isset($_GET["name"])) {
        $checkName = $_GET["name"] ?? "";        
    }
    
    $param = [
        'name' => $checkName,
    ];

    // lag :v
    $sql = "SELECT `stories`.*, `status`.`name` AS `status_name`, COUNT(`chapter`.`keyword`) AS `chapter_lastest`, `author`.`name` AS `author_name`, `author`.`alias` AS `author_alias` 
            FROM `stories`, `status`, `chapter`, `author` 
            WHERE `status`.`id` = `stories`.`status_id` AND `stories`.`id` = `chapter`.`story_id` AND `stories`.`author_id` = `author`.`id` AND 
            " .
            " `stories`.`name` LIKE '%". $_GET["name"] . "%' "
            . "
            GROUP BY `chapter`.`keyword` 
            ORDER BY `stories`.`id` ASC
        ";

    // var_dump($sql);
    // die;
    // link test
    // http://localhost/manga-comic-be/api/stories/findStoriesWithNameLess.php?name=86%20-%20Eighty%20Six
    // $show = Stories::findStoriesLessWithName($param);
    $show = DB::execute($sql);    

    // var_dump($show);
    // die;

    echo json_encode($show);
