<?php header('Content-Type: application/json; charset=utf-8'); ?>
 
<?php
    

    $METHOD_GET_ALL_NEWS = 1;
    $METHOD_GET_ONE_NEWS = 2;
    $METHOD_UPDATE_NEWS =3;
    $METHOD_ADD_NEWS = 4;
    $METHOD_DELETE_NEWS = 5;
 
    include_once '../api/news/functions.php';
 
    $db = new News_Functions();
 

 
    // for test from web browser
    $method = $_GET['method'];


    if($method == $METHOD_GET_ALL_NEWS) {
        $sql = "SELECT * FROM news ";
        $result = $db->selectall($sql);
    }

    if($method == $METHOD_GET_ONE_NEWS) {
        $id=$_GET['id'];
        $result = $db->selectone($id);
    }

    if($method == $METHOD_UPDATE_NEWS){
        $data = array();
        $data['title'] = $_POST['title'];
        $data['category_news_id'] = $_POST['category_news_id'];
        $data['languages'] = $_POST['languages'];
        $data['country'] = $_POST['country'];
        $data['content'] = $_POST['content'];
        $where='id='.$_POST['id'];
        $rs = $db->update('news', $data,$where);
        if($rs){
            $result['update'] = true;
        }else{
            $result['update'] = false;
        }
    }
 
    if($method == $METHOD_ADD_NEWS){
        $data = array();
        $data['category_news_id'] = $_POST['category_news_id'];
        $data['title'] = $_POST['title'];
        $data['author'] = $_POST['author'];
        $data['content'] = $_POST['content'];
        $data['thumbnail'] = $_POST['thumbnail'];
        $data['languages'] = $_POST['languages'];
        $data['country'] = $_POST['country'];
 
        $rs = $db->insert('news', $data);
        if($rs){
            $result['add'] = true;
        }else{
            $result['add'] = false;
        }
    }

    
    if($method == $METHOD_DELETE_NEWS){
        $where='id='.$_POST['id'];
        $rs = $db->delete('news',$where);
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


    