<?php header('Content-Type: application/json; charset=utf-8'); ?>
 
<?php
    

    $METHOD_GET_ALL = 1;
    $METHOD_GET_ONE = 2;
    $METHOD_UPDATE=3;
    $METHOD_ADD= 4;
    $METHOD_DELETE= 5;
    $METHOD_GET_ALL_ID_STORY= 6;
 
    include_once '../../../../api/functions.php';
 
    $db = new functions();

 

 
    // for test from web browser
    $method = $_GET['method'];


    if($method == $METHOD_GET_ALL) {
        $sql = "SELECT * FROM story_genres ";
        $result = $db->selectall($sql);
    }
    if($method == $METHOD_GET_ALL_ID_STORY) {
        $id=$_GET['id'];
        $result = $db->selectallstoryid('story_genres',$id);
    }

    if($method == $METHOD_GET_ONE) {
        $id=$_GET['id'];
        $result = $db->selectone('story_genres',$id);
    }

    // if($method == $METHOD_UPDATE){
    //     $data = array();
    //     $data['keyword'] = $_POST['keyword'];
    //     $data['name'] = $_POST['name'];
    //     $data['story_id'] = $_POST['story_id'];
    //     $data['languages'] = $_POST['languages'];
    //     $data['country'] = $_POST['country'];
    //     $where='id='.$_POST['id'];
    //     $rs = $db->update('story_genres', $data,$where);
    //     if($rs){
    //         $result['update'] = true;
    //     }else{
    //         $result['update'] = false;
    //     }
    // }
 
    if($method == $METHOD_ADD){
        $data = array();
        $data['story_id'] = $_POST['story_id'];
        $data['genres_id'] = $_POST['genres_id'];

        $rs = $db->insert('story_genres', $data);
        if($rs){
            $result['add'] = true;
        }else{
            $result['add'] = false;
        }
    }

    
    if($method == $METHOD_DELETE){
        $where='id='.$_POST['id'];
        $rs = $db->delete('story_genres',$where);
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


    