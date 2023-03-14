<?php
    class Comments{                
        // read data 
        static public function read(){
            $sql = "SELECT comment.*, users.name, users.avatar AS `user_avatar` FROM comment, users WHERE users.id = comment.user_id";

            $result = DB::execute($sql);

            return $result;
        }   
        
        static public function show($data = []){
            $sql = "SELECT comment.*, users.name, users.avatar AS `user_avatar` FROM comment, users WHERE users.id = comment.user_id AND comment.news_id = :news_id";

            $result = DB::execute($sql, $data);

            return $result;
        }  

        static public function create($data = []){
            $sql = "INSERT INTO comment SET `user_id`=:user_id, `news_id`=:news_id, `parent_id`=:parent_id, `thumbnail`=:thumbnail, `content`=:content";
            $result = DB::execute($sql, $data);
            return $result;
        }

        static public function update($data = []){
            $sql = "UPDATE comment SET `user_id`=:user_id, `news_id`=:news_id, `parent_id`=:parent_id, `thumbnail`=:thumbnail, `content`=:content WHERE `id`=:id";
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
        
    }
?>