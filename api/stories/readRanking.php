<?php
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application.json");
    require_once "../../config/DB.php";
    require_once "../../model/stories.php";

    // $sql = "select * from users";
    // $data = DB::execute($sql);

    $read = Stories::read();
    $getViews = Stories::getViews(); 
    $getFavorites = Stories::getFavorites();       

    $newdata = array();
    foreach ($read as $value) {
        $countViews = 0;
        $countFavorites = 0;

        foreach ($getViews as $valueView) {
            // var_dump($valueViews["stories_id"]);
            if($value["id"] == $valueView["stories_id"]) {
                $countViews += 1;
            }
        }

        foreach ($getFavorites as $valueFavorite) {
            // var_dump($valueViews["stories_id"]);
            if($value["id"] == $valueFavorite["stories_id"]) {
                $countFavorites += 1;
            }
        }
        
        $value["count_views"] = $countViews;
        $value["count_favorites"] = $countFavorites;
        array_push($newdata, $value);
    }

    usort($newdata, function($a, $b) {
        return ($b['count_views'] - $a['count_views']);
    });

    echo json_encode($newdata);
?>