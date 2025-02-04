<?php

session_start();

class DB
{
    static private $connection;

    CONST DB_TYPE = "mysql";
    CONST DB_HOST = "localhost";
    CONST DB_NAME = "manga_comic";
    CONST USER_NAME = "root";
    CONST USER_PASSWORD = "";


    static public function getConnection(){        
        if(static::$connection == null)
        {

            try{
                static::$connection = new PDO(
                    self::DB_TYPE.":host=".self::DB_HOST. ";dbname=" .self::DB_NAME,
                    self::USER_NAME, 
                    self::USER_PASSWORD
                );

                // echo "kết nối thành công";
            } catch(Exception $exception){
                throw new Exception("connection fail");
            }
        }
        return static::$connection;
    }

    static public function execute($sql, $data = [])
    {
        $statement = DB::getConnection()->prepare($sql);
        $statement->setFetchMode(PDO::FETCH_ASSOC);

        try {
            $statement->execute($data);
        } catch (\Throwable $th) {
            $statement->debugDumpParams();
            throw $th;
        }
        $result =[];

        while($item = $statement->fetch()) {
            $result[]=$item; 
        }
        return $result;  
    }
}
