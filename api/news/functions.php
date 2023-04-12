<?php
require_once __DIR__ . "../../../../manga-comic-be/config/DB.php";
class News_functions{
    public function selectall($sql){
        $result=DB::execute($sql);
        return $result;
    }

    public function selectone($id){
        $sql='SELECT * FROM news WHERE id='.$id;
        $result=DB::execute($sql);
        return $result;
    }

    function numrow($sql){
        $row=DB::execute($sql);
        return $row;
    }

    function update($table,$data,$where){
        $sql='';
        foreach($data as $key => $value){
            $sql .=", $key = '".$value."'";
        }
        $sql='UPDATE '.$table. ' SET '.trim($sql, ',').' WHERE ' .$where;
        DB::execute($sql);
    }

    function insert($table, $data){
            $field_list='';
            $value_list='';
            foreach($data as $key => $value){
                $field_list .=",$key";
                $value_list .=",'".$value."'";
            }
            $sql='INSERT INTO '.$table.'('.trim($field_list, ',').') VALUES ('.trim($value_list, ',').')';
            DB::execute($sql);
        }
        
    function delete($table,$where){
            $sql="DELETE FROM $table WHERE $where";
            DB::execute($sql);
        }

        
}
