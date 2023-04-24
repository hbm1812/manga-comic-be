<?php
class Stories
{
    // read data 
    static public function read()
    {
        // $sql = "SELECT `stories`.*, `status`.`name` AS `status_name` FROM `stories`, `status` WHERE `status`.`id` = `stories`.`status_id` ";

        // truyện phải có chapter mới hiện ra            
        $sql = "SELECT `stories`.*, `status`.`name` AS `status_name`, COUNT(`chapter`.`keyword`) AS `chapter_lastest`, `author`.`name` AS `author_name`, `author`.`alias` AS `author_alias` 
            FROM `stories`, `status`, `chapter`, `author` 
            WHERE `status`.`id` = `stories`.`status_id` AND `stories`.`id` = `chapter`.`story_id` AND `stories`.`author_id` = `author`.`id`
            GROUP BY `chapter`.`keyword` 
            ORDER BY `stories`.`id` ASC
        ";
        $result = DB::execute($sql);

        return $result;
    }

    static public function readStoriesHot()
    {
        // $sql = "SELECT `stories`.*, `status`.`name` AS `status_name` FROM `stories`, `status` WHERE `status`.`id` = `stories`.`status_id` ";

        // truyện phải có chapter mới hiện ra            
        $sql = "SELECT `stories`.*, `status`.`name` AS `status_name`, COUNT(`chapter`.`keyword`) AS `chapter_lastest` 
            FROM `stories`, `status`, `chapter` 
            WHERE `status`.`id` = `stories`.`status_id` AND `stories`.`id` = `chapter`.`story_id` 
            GROUP BY `chapter`.`keyword` 
            ORDER BY `stories`.`id` ASC
            LIMIT 5
        ";
        $result = DB::execute($sql);

        return $result;
    }

    // AND `stories`.`id` = 1 
    // SELECT `genres`.* FROM `genres` WHERE `story_genres`.`genres_id` = `genres`.`id` AND `story_genres`.`story_id` = `stories`.`id`
    static public function getAllCategory($data = [])
    {
        $sql = "SELECT * FROM `genres`";

        $result = DB::execute($sql, $data);

        return $result;
    }

    static public function findCategoryInStories($data = [])
    {
        $sql = "SELECT `genres`.*, `stories`.`id` AS `story_id`
            FROM `genres`, `story_genres`, `stories`
            WHERE `story_genres`.`genres_id` = `genres`.`id` AND `story_genres`.`story_id` = `stories`.`id`
        ";

        $result = DB::execute($sql, $data);

        return $result;
    }

    // find stories 
    static public function findStory($data = [])
    {
        // $sql = "SELECT `stories`.*, `status`.`name` AS `status_name` FROM `stories`, `status` WHERE `status`.`id` = `stories`.`status_id` ";

        // truyện phải có chapter mới hiện ra
        // tìm theo key  
        $sql = "SELECT `stories`.*, `status`.`name` AS `status_name`, COUNT(`chapter`.`keyword`) AS `chapter_lastest`, `author`.`name` AS `author_name`, `author`.`alias` AS `author_alias` 
            FROM `stories`, `status`, `chapter`, `author` 
            WHERE `status`.`id` = `stories`.`status_id` AND `stories`.`id` = `chapter`.`story_id` AND `stories`.`author_id` = `author`.`id` AND `stories`.`keyword`=:keyword
            GROUP BY `chapter`.`keyword` 
            ORDER BY `stories`.`id` ASC
        ";
        $result = DB::execute($sql, $data);

        return $result;
    }

    // find stories with name less 5 stories 
    // find stories 
    static public function findStoriesLessWithName($data = [])
    {
        // $sql = "SELECT `stories`.*, `status`.`name` AS `status_name` FROM `stories`, `status` WHERE `status`.`id` = `stories`.`status_id` ";

        // `stories`.`name`=:name
        // truyện phải có chapter mới hiện ra
        // tìm theo key  
        $sql = "SELECT `stories`.*, `status`.`name` AS `status_name`, COUNT(`chapter`.`keyword`) AS `chapter_lastest`, `author`.`name` AS `author_name`, `author`.`alias` AS `author_alias` 
            FROM `stories`, `status`, `chapter`, `author` 
            WHERE `status`.`id` = `stories`.`status_id` AND `stories`.`id` = `chapter`.`story_id` AND `stories`.`author_id` = `author`.`id` AND `stories`.`name` LIKE '%:name%'
            GROUP BY `chapter`.`keyword` 
            ORDER BY `stories`.`id` ASC
        ";

        // $sql = "SELECT `stories`.*, `status`.`name` AS `status_name`, COUNT(`chapter`.`keyword`) AS `chapter_lastest`, `author`.`name` AS `author_name`, `author`.`alias` AS `author_alias` FROM `stories`, `status`, `chapter`, `author` WHERE `status`.`id` = `stories`.`status_id` AND `stories`.`id` = `chapter`.`story_id` AND `stories`.`author_id` = `author`.`id` AND `stories`.`name` LIKE '%:name%' GROUP BY `chapter`.`keyword` ORDER BY `stories`.`id` ASC;";
        $result = DB::execute($sql, $data);

        return $result;
    }

    // get chapter
    static public function getChapter($data = [])
    {          
        $sql = "SELECT * FROM `chapter` WHERE `chapter`.`keyword` =:keyword ";
        $result = DB::execute($sql, $data);

        return $result;
    }
    // get chapter with image
    static public function findChapterWithThumbnail($data = [])
    {          
        $sql = "SELECT * FROM `chapter_images` WHERE `chapter_images`.`chapter_id` =:chapter_id ";
        $result = DB::execute($sql, $data);

        return $result;
    }

    // get languages in chapter with keyword 
    static public function getLanguagesInChapter($data = [])
    {         
        $sql = "SELECT DISTINCT `chapter`.`languages` FROM `chapter` WHERE `chapter`.`keyword` =:keyword ";
        $result = DB::execute($sql, $data);

        return $result;
    }

    // get status stories
    static public function getStatus($data = [])
    {
        $sql = "SELECT * FROM `status`";

        $result = DB::execute($sql, $data);

        return $result;
    }

    // Get view 
    static public function getViews()
    {
        $sql = "SELECT * FROM `view`";
        $result = DB::execute($sql);

        return $result;
    }

    static public function addViews($data = [])
    {
        $sql = "INSERT INTO `view` SET `user_id`=:user_id, `stories_id`=:stories_id";
        $result = DB::execute($sql, $data);
        return $result;
    }

    static public function getFavorites()
    {
        $sql = "SELECT * FROM `favorite`";
        $result = DB::execute($sql);

        return $result;
    }

    static public function addFavorites($data = [])
    {
        $sql = "INSERT INTO `favorite` SET `user_id`=:user_id, `stories_id`=:stories_id";
        $result = DB::execute($sql, $data);
        return $result;
    }

    // get stories genres 
    static public function getStoryGenres($data = [])
    {
        $sql = "SELECT * FROM `story_genres`";
        $result = DB::execute($sql, $data);

        return $result;
    }

    // get character in story
    static public function getCharacter($data = [])
    {
        $sql = "SELECT * FROM `character` WHERE `story_id`=:story_id";
        $result = DB::execute($sql, $data);
        return $result;
    }



    // base
    // static public function show($data = [])
    // {
    //     $sql = "SELECT * FROM users WHERE id=:id";

    //     $result = DB::execute($sql, $data);

    //     return $result;
    // }

    // static public function create($data = [])
    // {
    //     $sql = "INSERT INTO users SET name=:name, username=:username, email=:email, role_id=:role_id, password=:password, phone=:phone, avatar=:avatar";
    //     $result = DB::execute($sql, $data);
    //     return $result;
    // }

    // static public function update($data = [])
    // {
    //     $sql = "UPDATE users SET name=:name, username=:username, email=:email, role_id=:role_id, password=:password, phone=:phone, avatar=:avatar WHERE id=:id";
    //     $result = DB::execute($sql, $data);
    //     return $result;
    // }

    // static public function delete($data = [])
    // {
    //     $sql = "DELETE FROM users WHERE id=:id";
    //     $result = DB::execute($sql, $data);
    //     return $result;
    // }
}
