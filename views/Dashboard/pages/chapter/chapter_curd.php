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
                url: "http://localhost/manga-comic-be/views/Dashboard/pages/chapter/chapter_api.php?method=6&id=" + story_id_get,
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
                    <th scope="col">KEYWORD</th>
                    <th scope="col">NAME</th>
                    <th scope="col">STORY_ID</th>
                    <th scope="col">COUNTRY</th>
                    <th scope="col">LANGUAGES</th>
                    <th scope="col">CREATED_AT</th>
                    <th scope="col">UPDATED_AT</th>
                    <th scope="col">FUNCTIONS</th>
                </tr>
            </thead>
            <tbody>
                
                    <tr>
                        <td scope="row">${dataAPI['id']}</td>
                        <td style="width:200px ;">${dataAPI['keyword']}</td>
                        <td style="width:200px ;">${dataAPI['name']}</td>
                        <td style="width:200px ;">${dataAPI['story_id']}</td>
                        <td style="width:200px ;">${dataAPI['country']}</td>
                        <td style="width:200px ;">${dataAPI['languages']}</td>
                        <td>${dataAPI['created_at']}</td>
                        <td>${dataAPI['updated_at']}</td>

                        <td>
                           
                            <!-- <a href="./edit.php?id" class="btn btn-warning">Sửa</a> -->
                            <button class="btn btn-warning" id="myBtn" onclick="update(${dataAPI['id']})">Sửa</button>
                            <br>
                            <br>
                            <button class="btn btn-info" id="chapter_imageBtn" onclick="chapter_images(${dataAPI['id']})">Chapter Image</button>
                            <br>
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
    </script>
</head>

<body>
    <h3>DANH SÁCH CHAPTER CỦA TRUYỆN:</h3>
    <button type="button" class="btn btn-secondary" id="BtnAdd">Thêm mới</button>
    <div class="content" id="table_content">


    </div>


    <!-- The Modal -->
    <div id="myModal" class="modal">

        <!-- Nội dung form modal -->
        <div class="modal-content">
            <form action="#">
                <span class="close">&times;</span>
                <h2>CHỈNH SỬA THÔNG TIN TRUYỆN</h2>

                <div class="modal_content">
                    <!--content ben trai-->
                    <div class="content_left">
                        <div class="component_container">
                            <span>ID</span>
                            <input type="text" id="id" disabled>
                        </div>
                        <div class="component_container">
                            <span>KEYWORD</span>
                            <input type="text" id="keyword">
                        </div>
                        <div class="component_container">
                            <span>NAME</span>
                            <textarea name="name" id="name"></textarea>
                        </div>



                    </div>


                    <!--content ben phai-->
                    <div class="content_right">
                        <div class="component_container">
                            <span>STORY_ID</span>
                            <input type="text" id="story_id" disabled value="<?php echo $story_id_get ?>">
                        </div>

                        <div class="component_container">
                            <span>Languages</span>
                            <select name="languages" id="languages">
                                <option value="EN">EN</option>
                                <option value="Vi">Vi</option>
                            </select>

                            <span style="margin-left: 180px;">Country</span>
                            <select name="country" id="country">
                                <option value="JP">JP</option>
                                <option value="China">China</option>
                            </select>
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
                            <span>KEYWORD</span>
                            <input type="text" id="Addkeyword">
                        </div>
                        <div class="component_container">
                            <span>NAME</span>
                            <textarea name="Addname" id="Addname"></textarea>
                        </div>
                        <div class="component_container">
                            <span>STORY_ID</span>
                            <input type="text" id="Addstory_id" disabled value="<?php echo $story_id_get ?>">
                        </div>

                    </div>


                    <!--content ben phai-->
                    <div class="content_right">
                        <div class="component_container">
                            <span>Languages</span>
                            <select name="languages" id="Addlanguages">
                                <option value="EN">EN</option>
                                <option value="Vi">Vi</option>
                            </select>

                            <span style="margin-left: 180px;">Country</span>
                            <select name="country" id="Addcountry">
                                <option value="JP">JP</option>
                                <option value="China">China</option>
                            </select>
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
                    url: "http://localhost/manga-comic-be/views/Dashboard/pages/chapter/chapter_api.php?method=2&id=" + id,
                    method: "GET",
                    dataType: "json"

                })
                .done(function(response) {
                    modal.style.display = "block";
                    console.log(response);
                    response.forEach(item => {
                        document.getElementById("id").value = response[0].id;
                        document.getElementById("keyword").value = response[0].keyword;
                        document.getElementById("name").value = response[0].name;
                        document.getElementById("story_id").value = response[0].story_id;
                        document.getElementById("country").value = response[0].country;
                        document.getElementById("languages").value = response[0].languages;
        
                    });


                })
        }



        //khi bam nut cap nhat
        BtnUpdate.onclick = function() {
            const story_id_get = "<?php echo $story_id_get ?>";
            //gửi đi "id" của dữ liệu mà mình cần lấy

            var data = {}
            data["id"] = $("#id").val();
            data["keyword"] = $("#keyword").val();
            data["name"] = $("#name").val();
            data["story_id"] = $("#story_id").val();
            data["languages"] = $("#languages").val();
            data["country"] = $("#country").val();


            $.post(
                "http://localhost/manga-comic-be/views/Dashboard/pages/chapter/chapter_api.php?method=3", {
                    id: document.getElementById("id").value,
                    keyword: document.getElementById("keyword").value,
                    name: document.getElementById("name").value,
                    story_id: document.getElementById("story_id").value,
                    languages: document.getElementById("languages").value,
                    country: document.getElementById("country").value,
                },
                function(data, status) {
                    modal.style.display = "none";
                    alert("Sửa thành công!");

                    $.ajax({
                        url: "http://localhost/manga-comic-be/views/Dashboard/pages/chapter/chapter_api.php?method=1",
                        method: "GET",
                        dataType: "json",
                        success(response) {
                            console.log(response);
                            $('#stage').load('./pages/chapter/chapter_curd.php?id=' + story_id_get);

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

            data["keyword"] = $("#Addkeyword").val();
            data["name"] = $("#Addname").val();
            data["story_id"] = $("#Addstory_id").val();
            data["languages"] = $("#Addlanguages").val();
            data["country"] = $("#Addcountry").val();
            const story_id_get = "<?php echo $story_id_get ?>";

            $.post(
                "http://localhost/manga-comic-be/views/Dashboard/pages/chapter/chapter_api.php?method=4", {
                    keyword: document.getElementById("Addkeyword").value,
                    name: document.getElementById("Addname").value,
                    story_id: document.getElementById("Addstory_id").value,
                    languages: document.getElementById("Addlanguages").value,
                    country: document.getElementById("Addcountry").value,
                },
                function(data, status) {
                    modal.style.display = "none";
                    alert("Thêm mới thành công!");
                    $.ajax({
                        url: "http://localhost/manga-comic-be/views/Dashboard/pages/chapter/chapter_api.php?method=1",
                        method: "GET",
                        dataType: "json",
                        success(response) {
                            console.log(response);
                            $('#stage').load('./pages/chapter/chapter_curd.php?id=' + story_id_get);

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
                "http://localhost/manga-comic-be/views/Dashboard/pages/chapter/chapter_api.php?method=5", {
                    id: id
                },
                function(data, status) {
                    alert("Xóa thành công!");
                    $.ajax({
                        url: "http://localhost/manga-comic-be/views/Dashboard/pages/chapter/chapter_api.php?method=1",
                        method: "GET",
                        dataType: "json",
                        success(response) {
                            console.log(response);
                            $('#stage').load('./pages/chapter/chapter_curd.php?id=' + story_id_get);

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