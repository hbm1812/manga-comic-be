<?php
    class Role{                
        // read data 
        static public function read(){
            $sql = "SELECT * FROM `roles`";

            $result = DB::execute($sql);

            return $result;
        }

        static public function show($data = []){
            $sql = "SELECT * FROM `roles` WHERE id=:id";

            $result = DB::execute($sql, $data);

            return $result;
        }

        static public function create($data = []){
            $sql = "INSERT INTO `roles` SET name=:name";
            $result = DB::execute($sql, $data);
            return $result;
        }

        static public function update($data = []){
            $sql = "UPDATE `roles` SET name=:name WHERE id=:id";
            $result = DB::execute($sql, $data);
            return $result;
        }

        static public function delete($data = []){
            $sql = "DELETE FROM `roles` WHERE id=:id";
            $result = DB::execute($sql, $data);
            return $result;
        }
        
    }
?>