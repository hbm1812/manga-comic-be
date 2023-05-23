<?php
    class Comments{                
        // read data 
        static public function read(){
            $sql = "SELECT comment.*, users.name, users.avatar AS `user_avatar` FROM comment, users WHERE users.id = comment.user_id";

            $result = DB::execute($sql);

            return $result;
        }   
        
        static public function show($data = []){
            $sql = "SELECT comment.*, users.name, users.avatar AS `user_avatar` FROM comment, users WHERE users.id = comment.user_id AND (comment.news_id = :news_id OR comment.`story_id`=:story_id)";

            $result = DB::execute($sql, $data);

            return $result;
        }  

        static public function create($data = []){
            $sql = "INSERT INTO comment SET `user_id`=:user_id, `news_id`=:news_id, `story_id`=:story_id, `parent_id`=:parent_id, `thumbnail`=:thumbnail, `content`=:content";
            $result = DB::execute($sql, $data);
            return $result;
        }

        static public function update($data = []){
            $sql = "UPDATE comment SET `user_id`=:user_id, `news_id`=:news_id, `story_id`=:story_id, `parent_id`=:parent_id, `thumbnail`=:thumbnail, `content`=:content WHERE `id`=:id";
            $result = DB::execute($sql, $data);
            return $result;
        }

        static public function delete($data = []){
            $sql = "DELETE FROM comment WHERE id=:id";
            $result = DB::execute($sql, $data);
            return $result;
        }

        static public function find($data = []){
            $sql = "SELECT * FROM comment WHERE id=:id";

            $result = DB::execute($sql, $data);

            return $result;
        }
        
        static public function getLikerList($data = []) {
            $sql = "SELECT * FROM comment_like WHERE comment_id = :comment_id";

            $result = DB::execute($sql, $data);

            return $result;
        }
        
        static public function like($data = []) {
            $sql = "SELECT * FROM comment_like WHERE comment_id = :comment_id AND liker_id = :user_id";
            $result = DB::execute($sql, $data);

            if (!empty($result)) {
                return false;
            } 

            $sql = "INSERT INTO comment_like(liker_id, comment_id) VALUES (:user_id, :comment_id)";
            try {
                DB::execute($sql, $data);
            } catch (\Throwable $th) {
                return false;
            }
            
            return true;
        }

        static public function unlike($data = []) {
            $sql = "SELECT * FROM comment_like WHERE comment_id = :comment_id AND liker_id = :user_id";
            $result = DB::execute($sql, $data);

            if (empty($result)) {
                return false;
            } 

            $sql = "DELETE FROM comment_like WHERE liker_id = :user_id AND comment_id = :comment_id";
            try {
                DB::execute($sql, $data);
            } catch (\Throwable $th) {
                return false;
            }
            
            return true;
        }
    }
?>