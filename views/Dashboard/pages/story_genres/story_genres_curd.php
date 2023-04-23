<?php
$story_id_get = $_GET['id'];


?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            const story_id_get = "<?php echo $story_id_get ?>";
            window.scrollTo(0, 0);
            $.ajax({
                url: "http://localhost/manga-comic-be/views/Dashboard/pages/story_genres/story_genres_api.php?method=6&id=" + story_id_get,
                dataType: 'json',
                success: function(data) {
                    console.log(data);
                    $("#table_content").html("");
                    for (i = 0; i < data.length; i++) {
                        var dataAPI = data[i];
                        var str = ` 
                            

                            <table class="table" >
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">GENRES_ID</th>
                    <th scope="col">STORY_ID</th>
                    <th scope="col">CREATED_AT</th>
                    <th scope="col">UPDATED_AT</th>
                    <th scope="col">FUNCTIONS</th>
                </tr>
            </thead>
            <tbody>
                
                    <tr>
                        <td scope="row">${dataAPI['id']}</td>
                        <td style="width:200px ;">${dataAPI['genres_id']}</td>
                        <td style="width:200px ;">${dataAPI['story_id']}</td>                     
                        <td>${dataAPI['created_at']}</td>
                        <td>${dataAPI['updated_at']}</td>

                        <td>
                           
                            <!-- <a href="./edit.php?id" class="btn btn-warning">Sửa</a> -->
                            <br>
                            <button class="btn btn-danger btn-delete" id="BtnDelete" onclick="dele(${dataAPI['id']})">Xóa</button>
                           

                        </td>
                    </tr>
                
            </tbody>
        </table>
        
                            `;
                        $("#table_content").append(str);
                    }
                }
            });
        })

        //the loai tin tuc cho modal create
        $(document).ready(function() {
            $.ajax({
                url: "http://localhost/manga-comic-be/views/Dashboard/pages/genres/genres_api.php?method=1",
                dataType: 'json',
                success: function(data) {
                    console.log(data);
                    $("#Addcategory_news_id").html("");
                    for (i = 0; i < data.length; i++) {
                        var the_loai_truyen = data[i];
                        var str = `                                                                                
                                <option value="${the_loai_truyen['id']}">${the_loai_truyen['name']}</option>                                  
                            `;
                        $("#Addgenres_id").append(str);
                    }
                }
            });
        })
    </script>
</head>

<body>
    <h3>DANH SÁCH THỂ LOẠI CỦA TRUYỆN:</h3>
    <button type="button" class="btn btn-secondary" id="BtnAdd">Thêm mới</button>
    <div class="content" id="table_content">


    </div>


    








    <!-- The Modal Them moi -->
    <div id="myModalAddNews" class="modal">

        <!-- Nội dung form modal -->
        <div class="modal-content">
            <form action="#">
                <span class="Addclose">&times;</span>
                <h2>THÊM MỚI THỂ LOẠI</h2>

                <div class="modal_content">
                    <!--content ben trai-->
                    <div class="content_left">
                        <div class="component_container">
                            <span>STORY_ID</span>
                            <input type="text" id="Addstory_id" disabled value="<?php echo $story_id_get ?>">
                        </div>
                        <div class="component_container">
                            <span>THỂ LOẠI TRUYỆN:</span>
                            <!-- <input type="text" name="Addcategory_news_id" id="Addcategory_news_id"> -->
                            <select name="Addgenres_id" id="Addgenres_id">
                                <!-- <option value="2">Anime</option>
                                <option value="3">Truyện tranh</option>
                                <option value="4">Thông tin</option> -->
                            </select>
                        </div>
                      

                    </div>


                    <!--content ben phai-->
                    <div class="content_right">
                       

                        <br>
                        <br>

                        <button type="button" class="btn btn-secondary" id="BtnAddExit">Thoát</button>
                        <button type="button" class="btn btn-success" id="BtnAddNew">Thêm mới</button>

                    </div>

                </div>

            </form>
        </div>

    </div>






    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>



    <script>
        // lấy phần Modal
       
        var modal_add_news = document.getElementById('myModalAddNews');

        var BtnAdd = document.getElementById("BtnAdd");

        // //lay id phan mo modal
        // var btn = document.getElementsByClassName("myBtn");

        // Lấy phần span đóng Modal
        
        var Addspan = document.getElementsByClassName("Addclose")[0];
       
        var BtnAddExit = document.getElementById("BtnAddExit");

        
        var BtnAddNew = document.getElementById("BtnAddNew");


        //link api






        // Them moi
        BtnAdd.onclick = function() {

            modal_add_news.style.display = "block";
        }
        // Khi span được click thì đóng Modal
        Addspan.onclick = function() {
            modal_add_news.style.display = "none";
        }

        // Khi bấm nút thoát thì đóng Modal
        BtnAddExit.onclick = function() {
            modal_add_news.style.display = "none";
        }


        // Khi click ngoài Modal thì đóng Modal
        window.onclick = function(event) {
            if (event.target == modal_add_news) {
                modal_add_news.style.display = "none";
            }
        }

        //khi bam nut them moi
        BtnAddNew.onclick = function() {

            //gửi đi "id" của dữ liệu mà mình cần lấy

            var data = {}


            data["genres_id"] = $("#Addgenres_id").val();
            data["story_id"] = $("#Addstory_id").val();

            const story_id_get = "<?php echo $story_id_get ?>";

            $.post(
                "http://localhost/manga-comic-be/views/Dashboard/pages/story_genres/story_genres_api.php?method=4", {
                    genres_id: document.getElementById("Addgenres_id").value,
                    story_id: document.getElementById("Addstory_id").value,

                },
                function(data, status) {
                    modal.style.display = "none";
                    alert("Thêm mới thành công!");
                    $.ajax({
                        url: "http://localhost/manga-comic-be/views/Dashboard/pages/story_genres/story_genres_api.php?method=1",
                        method: "GET",
                        dataType: "json",
                        success(response) {
                            console.log(response);
                            $('#stage').load('./pages/story_genres/story_genres_curd.php?id=' + story_id_get);

                        }

                    });
                });

        }






        function dele(id) {
            //gửi đi "id" của dữ liệu mà mình cần lấy
            var data = {}
            data["id"] = $("#id").val();
            const story_id_get = "<?php echo $story_id_get ?>";

            $.post(
                "http://localhost/manga-comic-be/views/Dashboard/pages/story_genres/story_genres_api.php?method=5", {
                    id: id
                },
                function(data, status) {
                    alert("Xóa thành công!");
                    $.ajax({
                        url: "http://localhost/manga-comic-be/views/Dashboard/pages/story_genres/story_genres_api.php?method=1",
                        method: "GET",
                        dataType: "json",
                        success(response) {
                            console.log(response);
                            $('#stage').load('./pages/story_genres/story_genres_curd.php?id=' + story_id_get);

                        }

                    });
                });
        }







        // Khi span được click thì đóng Modal
        span.onclick = function() {
            modal.style.display = "none";
        }

        // Khi bấm nút thoát thì đóng Modal
        BtnExit.onclick = function() {
            modal.style.display = "none";
        }


        // Khi click ngoài Modal thì đóng Modal
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

    </script>


</body>

</html>