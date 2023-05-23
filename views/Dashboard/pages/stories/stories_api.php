<?php header('Content-Type: application/json; charset=utf-8'); ?>
 
<?php
    

    $METHOD_GET_ALL = 1;
    $METHOD_GET_ONE = 2;
    $METHOD_UPDATE=3;
    $METHOD_ADD= 4;
    $METHOD_DELETE= 5;
 
    include_once '../../../../api/functions.php';
 
    $db = new functions();

 

 
    // for test from web browser
    $method = $_GET['method'];


    if($method == $METHOD_GET_ALL) {
        $sql = "SELECT * FROM stories ";
        $result = $db->selectall($sql);
    }

    if($method == $METHOD_GET_ONE) {
        $id=$_GET['id'];
        $result = $db->selectone('stories',$id);
    }

    if($method == $METHOD_UPDATE){
        $data = array();
        $data['keyword'] = $_POST['keyword'];
        $data['name'] = $_POST['name'];
        $data['name_romanji'] = $_POST['name_romanji'];
        // $data['name_english'] = $_POST['name_english'];
        $data['name_japan'] = $_POST['name_japan'];
        $data['thumbnail'] = $_POST['thumbnail'];
        $data['background'] = $_POST['background'];
        $data['descr'] = $_POST['descr'];
        $data['status_id'] = $_POST['status_id'];
        $data['author_id'] = $_POST['author_id'];
        $where='id='.$_POST['id'];
        $rs = $db->update('stories', $data,$where);
        if($rs){
            $result['update'] = true;
        }else{
            $result['update'] = false;
        }
    }
 
    if($method == $METHOD_ADD){
        $data = array();
        $data['keyword'] = $_POST['keyword'];
        $data['name'] = $_POST['name'];
        $data['name_romanji'] = $_POST['name_romanji'];
        // $data['name_english'] = $_POST['name_english'];
        $data['name_japan'] = $_POST['name_japan'];
        $data['thumbnail'] = $_POST['thumbnail'];
        $data['background'] = $_POST['background'];
        $data['descr'] = $_POST['descr'];
        $data['status_id'] = $_POST['status_id'];
        $data['author_id'] = $_POST['author_id'];
     
 
        $rs = $db->insert('stories', $data);
        if($rs){
            $result['add'] = true;
        }else{
            $result['add'] = false;
        }
    }

    
    if($method == $METHOD_DELETE){
        $where='id='.$_POST['id'];
    //     $story_id =$_POST['id'];
    //     $select_id_chapter = $db->select_id_chapter('chapter',$story_id);
    //     $delete_chapter_images = $db->delete_chapter_images('chapter_images',$select_id_chapter);
    //     $delete_chapter = $db->delete_chapter('chapter',$story_id);
    //    $delete_story_genres = $db->delete_story_genres('story_genres',$story_id);
    //    $delete_story_views= $db->delete_story_views('view',$story_id);
    //    $delete_favorite= $db->delete_favorite('favorite',$story_id);
        $rs = $db->delete('stories',$where);
        
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


    