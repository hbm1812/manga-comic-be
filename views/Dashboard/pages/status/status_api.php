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
        $sql = "SELECT * FROM status ";
        $result = $db->selectall($sql);
    }

    if($method == $METHOD_GET_ONE) {
        $id=$_GET['id'];
        $result = $db->selectone('status',$id);
    }

    if($method == $METHOD_UPDATE){
        $data = array();
        $data['keyword'] = $_POST['keyword'];
        $data['name'] = $_POST['name'];
        $where='id='.$_POST['id'];
        $rs = $db->update('status', $data,$where);
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
        $rs = $db->insert('status', $data);
        if($rs){
            $result['add'] = true;
        }else{
            $result['add'] = false;
        }
    }

    
    if($method == $METHOD_DELETE){
        $where='id='.$_POST['id'];
        $rs = $db->delete('status',$where);
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


    