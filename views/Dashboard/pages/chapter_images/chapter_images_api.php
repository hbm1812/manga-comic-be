<?php header('Content-Type: application/json; charset=utf-8'); ?>
 
<?php
    

    $METHOD_GET_ALL = 1;
    $METHOD_GET_ONE = 2;
    $METHOD_UPDATE=3;
    $METHOD_ADD= 4;
    $METHOD_DELETE= 5;
    $METHOD_GET_ALL_WITH_CHAPTER_ID= 6;
 
    include_once '../../../../api/functions.php';
 
    $db = new functions();

 

 
    // for test from web browser
    $method = $_GET['method'];


    if($method == $METHOD_GET_ALL) {
        $sql = "SELECT * FROM chapter_images ";
        $result = $db->selectall($sql);
    }
    if($method == $METHOD_GET_ALL_WITH_CHAPTER_ID) {
        $id=$_GET['id'];
        $result = $db->selectallwithchapterid('chapter_images',$id);
    }

    if($method == $METHOD_GET_ONE) {
        $id=$_GET['id'];
        $result = $db->selectone('chapter_images',$id);
    }

    if($method == $METHOD_UPDATE){
        $data = array();
        $data['thumbnail'] = $_POST['thumbnail'];
        $data['chapter_id'] = $_POST['chapter_id'];

        $where='id='.$_POST['id'];
        $rs = $db->update('chapter_images', $data,$where);
        if($rs){
            $result['update'] = true;
        }else{
            $result['update'] = false;
        }
    }
 
    if($method == $METHOD_ADD){
        $data = array();
        $data['thumbnail'] = $_POST['thumbnail'];
        $data['chapter_id'] = $_POST['chapter_id'];
     
 
        $rs = $db->insert('chapter_images', $data);
        if($rs){
            $result['add'] = true;
        }else{
            $result['add'] = false;
        }
    }

    
    if($method == $METHOD_DELETE){
        $where='id='.$_POST['id'];
        $rs = $db->delete('chapter_images',$where);
        if($rs){
            $result['delete'] = true;
        }else{
            $result['delete'] = false;
        }
    }
       
    $json = json_encode($result, JSON_PRETTY_PRINT); 
    $json = json_encode($result); // use on hostinger
    print_r($json);
?>


    