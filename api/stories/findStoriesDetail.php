<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application.json");
require_once "../../config/DB.php";
require_once "../../model/stories.php";

$nameStatus = $_GET["name_status"] ?? "";
$nameCate = $_GET["name_cate"] ?? "";

$param = [
    'name_status' => $nameStatus,
    'name_cate' => $nameCate,
];

// backup
// $sql = "SELECT `stories`.*, `status`.`name` AS `status_name`, COUNT(`chapter`.`keyword`) AS `chapter_lastest`, `author`.`name` AS `author_name`, `author`.`alias` AS `author_alias`, `genres`.`name` 
//         FROM `stories`, `status`, `chapter`, `author`, `genres`, `story_genres` 
//         WHERE `status`.`id` = `stories`.`status_id` AND `stories`.`id` = `chapter`.`story_id` AND `stories`.`author_id` = `author`.`id` AND `story_genres`.`story_id` = `stories`.`id` AND `story_genres`.`genres_id` = `genres`.`id` AND `status`.`name` = :name_status AND `genres`.`name` = :name_cate
//         GROUP BY `chapter`.`keyword` 
//         ORDER BY `stories`.`id` ASC
//     ";


// $sql = "SELECT `stories`.*, `status`.`name` AS `status_name`, COUNT(`chapter`.`keyword`) AS `chapter_lastest`, `author`.`name` AS `author_name`, `author`.`alias` AS `author_alias`
//     FROM `stories`, `status`, `chapter`, `author`, `genres`, `story_genres` 
//     WHERE `status`.`id` = `stories`.`status_id` AND `stories`.`id` = `chapter`.`story_id` AND `stories`.`author_id` = `author`.`id` AND `story_genres`.`story_id` = `stories`.`id` AND `story_genres`.`genres_id` = `genres`.`id` AND `status`.`name` = :name_status
//     GROUP BY `chapter`.`keyword` 
//     ORDER BY `stories`.`id` ASC
// ";

$sql = "SELECT `stories`.*, `status`.`name` AS `status_name`, COUNT(`chapter`.`keyword`) AS `chapter_lastest`, `author`.`name` AS `author_name`, `author`.`alias` AS `author_alias`, `genres`.`name` AS `genres_name`
        FROM `stories`, `status`, `chapter`, `author`, `genres`, `story_genres` 
        WHERE `status`.`id` = `stories`.`status_id` AND `stories`.`id` = `chapter`.`story_id` AND `stories`.`author_id` = `author`.`id` AND `story_genres`.`story_id` = `stories`.`id` AND `story_genres`.`genres_id` = `genres`.`id` AND `status`.`name` LIKE CONCAT( '%', :name_status, '%') AND `genres`.`name` LIKE CONCAT( '%', :name_cate, '%')
        GROUP BY `chapter`.`keyword` 
        ORDER BY `stories`.`id` ASC;
    ";

$read = DB::execute($sql, $param);

$getViews = Stories::getViews();
$getFavorites = Stories::getFavorites();

$newdata = array();
foreach ($read as $value) {
    $countViews = 0;
    $countFavorites = 0;

    foreach ($getViews as $valueView) {
        // var_dump($valueViews["stories_id"]);
        if ($value["id"] == $valueView["stories_id"]) {
            $countViews += 1;
        }
    }

    foreach ($getFavorites as $valueFavorite) {
        // var_dump($valueViews["stories_id"]);
        if ($value["id"] == $valueFavorite["stories_id"]) {
            $countFavorites += 1;
        }
    }

    $value["count_views"] = $countViews;
    $value["count_favorites"] = $countFavorites;
    array_push($newdata, $value);
}

echo json_encode($newdata);
