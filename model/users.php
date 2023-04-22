<?php
    class User{                
        // read data 
        static public function read(){
            // $sql = "SELECT * FROM users";
            $sql = "SELECT users.*, roles.name as `role_name` FROM users, roles WHERE users.role_id = roles.id";

            $result = DB::execute($sql);

            return $result;
        }

        static public function show($data = []){
            $sql = "SELECT * FROM users WHERE id=:id";

            $result = DB::execute($sql, $data);

            return $result;
        }
        // login show username and password 
        static public function login($data = []){
            $sql = "SELECT * FROM users WHERE username=:username AND password=:password";

            $result = DB::execute($sql, $data);

            return $result;
        }

        static public function create($data = []){
            $sql = "INSERT INTO users SET name=:name, username=:username, email=:email, role_id=:role_id, password=:password, phone=:phone, avatar=:avatar";
            $result = DB::execute($sql, $data);
            return $result;
        }

        static public function update($data = []){
            $sql = "UPDATE users SET name=:name, username=:username, email=:email, role_id=:role_id, password=:password, phone=:phone, avatar=:avatar WHERE id=:id";
            $result = DB::execute($sql, $data);
            return $result;
        }

        static public function delete($data = []){
            $sql = "DELETE FROM users WHERE id=:id";
            $result = DB::execute($sql, $data);
            return $result;
        }
        
    }
?>