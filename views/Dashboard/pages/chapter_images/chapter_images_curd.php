<?php
$chapter_id_get = $_GET['id'];


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
            const chapter_id_get = "<?php echo $chapter_id_get ?>";
            window.scrollTo(0, 0);
            $.ajax({
                url: "http://localhost/manga-comic-be/views/Dashboard/pages/chapter_images/chapter_images_api.php?method=6&id=" + chapter_id_get,
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
                    <th scope="col">THUMBNAIL</th>
                    <th scope="col">CHAPTER_ID</th>
                    <th scope="col">CREATED_AT</th>
                    <th scope="col">UPDATED_AT</th>
                    <th scope="col">FUNCTIONS</th>
                </tr>
            </thead>
            <tbody>
                
                    <tr>
                        <td scope="row">${dataAPI['id']}</td>
                        <td style="width:200px ;">${dataAPI['thumbnail']}</td>
                        <td>${dataAPI['chapter_id']}</td>
                        <td>${dataAPI['created_at']}</td>
                        <td>${dataAPI['updated_at']}</td>

                        <td>
                           
                            <button class="btn btn-warning" id="myBtn" onclick="update(${dataAPI['id']})">Sửa</button>
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
    </script>
</head>

<body>
    <h3>DANH SÁCH IMAGES CỦA CHAPTER:</h3>
    <button type="button" class="btn btn-secondary" id="BtnAdd">Thêm mới</button>
    <div class="content" id="table_content">


    </div>


    <!-- The Modal -->
    <div id="myModal" class="modal">

        <!-- Nội dung form modal -->
        <div class="modal-content">
            <form action="#">
                <span class="close">&times;</span>
                <h2>CHỈNH SỬA chapter images:</h2>

                <div class="modal_content">
                    <!--content ben trai-->
                    <div class="content_left">
                        <div class="component_container">
                            <span>ID</span>
                            <input type="text" id="id" disabled>
                        </div>

                        <div class="component_container">
                            <span>THUMBNAIL</span>
                            <textarea name="thumbnail" id="thumbnail"></textarea>
                        </div>

                    </div>


                    <!--content ben phai-->
                    <div class="content_right">
                        <div class="component_container">
                            <span>ID</span>
                            <input type="text" id="chapter_id" disabled>
                        </div>

                        <br>
                        <br>
                        <br>

                        <button type="button" class="btn btn-secondary" id="BtnExit">Thoát</button>
                        <button type="button" class="btn btn-success" id="BtnUpdate">Cập nhật</button>

                    </div>

                </div>

            </form>
        </div>

    </div>








    <!-- The Modal Them moi -->
    <div id="myModalAddNews" class="modal">

        <!-- Nội dung form modal -->
        <div class="modal-content">
            <form action="#">
                <span class="Addclose">&times;</span>
                <h2>THÊM MỚI CHAPTER</h2>

                <div class="modal_content">
                    <!--content ben trai-->
                    <div class="content_left">

                        <div class="component_container">
                            <span>THUMBNAIL</span>
                            <textarea name="Addthumbnail" id="Addthumbnail"></textarea>
                        </div>

                    </div>


                    <!--content ben phai-->
                    <div class="content_right">
                        <div class="component_container">
                            <span>ID</span>
                            <input type="text" id="Addchapter_id" disabled value="<?php echo $chaptertừ_id_get ?>">
                        </div>


                        <br>
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
        var modal = document.getElementById('myModal');
        var modal_add_news = document.getElementById('myModalAddNews');

        var BtnAdd = document.getElementById("BtnAdd");

        // //lay id phan mo modal
        // var btn = document.getElementsByClassName("myBtn");

        // Lấy phần span đóng Modal
        var span = document.getElementsByClassName("close")[0];
        var Addspan = document.getElementsByClassName("Addclose")[0];
        var BtnExit = document.getElementById("BtnExit");
        var BtnAddExit = document.getElementById("BtnAddExit");

        var BtnUpdate = document.getElementById("BtnUpdate");
        var BtnAddNew = document.getElementById("BtnAddNew");


        //link api



        // Khi button được click thi mở Modal
        function update(id) {
            //lấy dữ liệu từ api về
            $.ajax({
                    url: "http://localhost/manga-comic-be/views/Dashboard/pages/chapter_images/chapter_images_api.php?method=2&id=" + id,
                    method: "GET",
                    dataType: "json"

                })
                .done(function(response) {
                    modal.style.display = "block";
                    console.log(response);
                    response.forEach(item => {
                        document.getElementById("id").value = response[0].id;
                        document.getElementById("thumbnail").value = response[0].thumbnail;
                        document.getElementById("chapter_id").value = response[0].chapter_id;


                    });


                })
        }



        //khi bam nut cap nhat
        BtnUpdate.onclick = function() {
            const chapter_id_get = "<?php echo $chapter_id_get ?>";
            //gửi đi "id" của dữ liệu mà mình cần lấy

            var data = {}
            data["id"] = $("#id").val();
            data["thumbnail"] = $("#thumbnail").val();
            data["chapter_id"] = $("#chapter_id").val();


            $.post(
                "http://localhost/manga-comic-be/views/Dashboard/pages/chapter_images/chapter_images_api.php?method=3", {
                    id: document.getElementById("id").value,
                    thumbnail: document.getElementById("thumbnail").value,
                    chapter_id: document.getElementById("chapter_id").value,

                },
                function(data, status) {
                    modal.style.display = "none";
                    alert("Sửa thành công!");

                    $.ajax({
                        url: "http://localhost/manga-comic-be/views/Dashboard/pages/chapter_images/chapter_images_api.php?method=1",
                        method: "GET",
                        dataType: "json",
                        success(response) {
                            console.log(response);
                            $('#stage').load('./pages/chapter_images/chapter_images_curd.php?id=' + chapter_id_get);

                        }

                    });
                });

        }




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

            data["thumbnail"] = $("#Addthumbnail").val();
            data["chapter_id"] = $("#Addchapter_id").val();
            const chapter_id_get = "<?php echo $chapter_id_get ?>";

            $.post(
                "http://localhost/manga-comic-be/views/Dashboard/pages/chapter_images/chapter_images_api.php?method=4", {
                    thumbnail: document.getElementById("Addthumbnail").value,
                    chapter_id: document.getElementById("Addchapter_id").value,
                },
                function(data, status) {
                    modal.style.display = "none";
                    alert("Thêm mới thành công!");
                    $.ajax({
                        url: "http://localhost/manga-comic-be/views/Dashboard/pages/chapter_images/chapter_images_api.php?method=1",
                        method: "GET",
                        dataType: "json",
                        success(response) {
                            console.log(response);
                            $('#stage').load('./pages/chapter_images/chapter_images_curd.php?id=' + chapter_id_get);

                        }

                    });
                });

        }






        function dele(id) {
            //gửi đi "id" của dữ liệu mà mình cần lấy
            var data = {}
            data["id"] = $("#id").val();
            const chapter_id_get = "<?php echo $chapter_id_get ?>";

            $.post(
                "http://localhost/manga-comic-be/views/Dashboard/pages/chapter_images/chapter_images_api.php?method=5", {
                    id: id
                },
                function(data, status) {
                    alert("Xóa thành công!");
                    $.ajax({
                        url: "http://localhost/manga-comic-be/views/Dashboard/pages/chapter_images/chapter_images_api.php?method=1",
                        method: "GET",
                        dataType: "json",
                        success(response) {
                            console.log(response);
                            $('#stage').load('./pages/chapter_images/chapter_images_curd.php?id=' + chapter_id_get);

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

        function chapter_images(id) {
            //lấy dữ liệu từ api về
            $('#stage').load('./pages/chapter_images/chapter_images_curd.php?id=' + id);

        }
    </script>


</body>

</html>