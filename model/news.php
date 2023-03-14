<?php
    class News{                
        // read data 
        static public function read(){
            $sql = "SELECT news.*, category_news.name AS `name_category`, category_news.keyword AS `key_category` FROM news, category_news WHERE news.category_news_id = category_news.id ORDER BY news.id DESC";

            $result = DB::execute($sql);

            return $result;
        }

        static public function showNewDetail($data = []){
            $sql = "SELECT news.*, category_news.name AS `name_category`, category_news.keyword AS `key_category` FROM news, category_news WHERE news.category_news_id = category_news.id AND news.id=:id";

            $result = DB::execute($sql, $data);

            return $result;
        }

        static public function showNewLastest($data = []){
            // show 3 tin mới nhất
            $sql = "SELECT news.*, category_news.name AS `name_category`, category_news.keyword AS `key_category` FROM news, category_news WHERE news.category_news_id = category_news.id ORDER BY news.id DESC LIMIT 3;";

            $result = DB::execute($sql, $data);

            return $result;
        }

        // static public function create($data = []){
        //     $sql = "INSERT INTO users SET name=:name, username=:username, email=:email, role_id=:role_id, password=:password, phone=:phone, avatar=:avatar";
        //     $result = DB::execute($sql, $data);
        //     return $result;
        // }

        // static public function update($data = []){
        //     $sql = "UPDATE users SET name=:name, username=:username, email=:email, role_id=:role_id, password=:password, phone=:phone, avatar=:avatar WHERE id=:id";
        //     $result = DB::execute($sql, $data);
        //     return $result;
        // }

        // static public function delete($data = []){
        //     $sql = "DELETE FROM users WHERE id=:id";
        //     $result = DB::execute($sql, $data);
        //     return $result;
        // }
        
    }
?>