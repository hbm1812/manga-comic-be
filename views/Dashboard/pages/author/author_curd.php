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
            window.scrollTo(0, 0);
            $.ajax({
                url: "http://localhost/manga-comic-be/views/Dashboard/pages/author/author_api.php?method=1",
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
                    <th scope="col">TÊN TÁC GIẢ</th>
                    <th scope="col">BÍ DANH</th>
                    <th scope="col">AVATAR</th>
                    <th scope="col">MÔ TẢ</th>
                    <th scope="col">LẦN CUỐI SỬA</th>
                    <th scope="col">NGÀY TẠO</th>
                    <th scope="col">CHỨC NĂNG</th>
                </tr>
            </thead>
            <tbody>
                
                    <tr>
                        <td scope="row">${dataAPI['id']}</td>
                        <td style="width:200px ;">${dataAPI['name']}</td>
                        <td style="width:200px ;">${dataAPI['alias']}</td>
                        <td style="width:200px"><img style="width:200px; height:100px; border-radius:0 !important;" src="${dataAPI['thumbnail']}" alt="" srcset=""></td>
                        <td style="width:200px">${dataAPI['descr']}</td>
                        <td>${dataAPI['created_at']}</td>
                        <td>${dataAPI['updated_at']}</td>
                        <td>
                           
                            <button class="btn btn-warning" id="myBtn" onclick="update(${dataAPI['id']})">Sửa</button>
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
    <h3>DANH SÁCH TÁC GIẢ</h3>
    <button type="button" class="btn btn-secondary" id="BtnAdd">Thêm mới</button>
    <div class="content" id="table_content">


    </div>


    <!-- The Modal -->
    <div id="myModal" class="modal">
        <!-- Nội dung form modal -->
        <div class="modal-content">
            <form action="#">
                <span class="close">&times;</span>
                <h2>CHỈNH SỬA THÔNG TIN TÁC GIẢ</h2>

                <div class="modal_content">
                    <!--content ben trai-->
                    <div class="content_left">
                        <div class="component_container">
                            <span>id</span>
                            <input type="text" name="id" id="id" disabled>
                        </div>
                        <div class="component_container">
                            <span>TÊN TÁC GIẢ</span>
                            <input type="text" name="name" id="name">
                        </div>
                        <div class="component_container">
                            <span>BÍ DANH</span>
                            <input type="text" name="alias" id="alias">
                        </div>
                        <div class="component_container">
                            <span>KEYWORD</span>
                            <input type="text" name="keyword" id="keyword">
                        </div>
                        <div class="component_container">
                            <span>AVATAR</span>
                            <textarea name="avatar" id="avatar"></textarea>
                        </div>

                    </div>


                    <!--content ben phai-->
                    <div class="content_right">
                        <div class="component_container">
                            <span>Mô tả</span>
                            <textarea name="descr" id="descr"></textarea>
                        </div>

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
                <h2>THÊM MỚI</h2>

                <div class="modal_content">
                    <!--content ben trai-->
                    <div class="content_left">
                        <div class="component_container">
                            <span>Tên TÁC GIẢ</span>
                            <input type="text" name="Addname" id="Addname">
                        </div>
                        <div class="component_container">
                            <span>BÍ DANH</span>
                            <input type="text" name="Addalias" id="Addalias">
                        </div>
                        <div class="component_container">
                            <span>KEYWORD</span>
                            <input type="text" name="Addkeyword" id="Addkeyword">
                        </div>
                        <div class="component_container">
                            <span>AVATAR</span>
                            <textarea name="Addavatar" id="Addavatar"></textarea>
                        </div>

                    </div>


                    <!--content ben phai-->
                    <div class="content_right">
                        <div class="component_container">
                            <span>Mô tả</span>
                            <textarea name="Adddescr" id="Adddescr"></textarea>
                        </div>
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
            // alert("\nid: " + id);
            //lấy dữ liệu từ api về
            $.ajax({
                    url: "http://localhost/manga-comic-be/views/Dashboard/pages/author/author_api.php?method=2&id=" + id,
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
                        document.getElementById("alias").value = response[0].alias;
                        document.getElementById("avatar").value = response[0].avatar;
                        document.getElementById("descr").value = response[0].descr;
                    });


                })
        }



        //khi bam nut cap nhat
        BtnUpdate.onclick = function() {

            //gửi đi "id" của dữ liệu mà mình cần lấy

            var data = {}
            data["id"] = $("#id").val();
            data["keyword"] = $("#keyword").val();
            data["name"] = $("#name").val();
            data["alias"] = $("#alias").val();
            data["avatar"] = $("#avatar").val();
            data["descr"] = $("#descr").val();



            $.post(
                "http://localhost/manga-comic-be/views/Dashboard/pages/author/author_api.php?method=3", {
                    id: document.getElementById("id").value,
                    keyword: document.getElementById("keyword").value,
                    name: document.getElementById("name").value,
                    alias: document.getElementById("alias").value,
                    avatar: document.getElementById("avatar").value,
                    descr: document.getElementById("descr").value,

                },

                function(data, status) {
                    alert("Sửa thành công!");
                    modal.style.display = "none";

                    $.ajax({
                        url: "http://localhost/manga-comic-be/views/Dashboard/pages/author/author_api.php?method=1",
                        method: "GET",
                        dataType: "json",
                        success(response) {
                            console.log(response);
                            $('#stage').load('./pages/author/author_curd.php');

                        }

                    });
                });

        }




        // Them moi news
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
            data["alias"] = $("#Addalias").val();
            data["avatar"] = $("#Addavatar").val();
            data["descr"] = $("#Adddescr").val();


            $.post(
                "http://localhost/manga-comic-be/views/Dashboard/pages/author/author_api.php?method=4", {
                    keyword: document.getElementById("Addkeyword").value,
                    name: document.getElementById("Addname").value,
                    alias: document.getElementById("Addalias").value,
                    avatar: document.getElementById("Addavatar").value,
                    descr: document.getElementById("Adddescr").value,
                },
                function(data, status) {
                    modal.style.display = "none";
                    alert("Thêm mới thành công!");
                    $.ajax({
                        url: "http://localhost/manga-comic-be/views/Dashboard/pages/author/author_api.php?method=1",
                        method: "GET",
                        dataType: "json",
                        success(response) {
                            console.log(response);
                            $('#stage').load('./pages/author/author_curd.php');

                        }

                    });
                });

        }






        function dele(id) {
            //gửi đi "id" của dữ liệu mà mình cần lấy
            var data = {}
            data["id"] = $("#id").val();
            var result = confirm("Bạn có chắc là muốn xóa chứ?");
            if (result == true) {
                $.post(
                    "http://localhost/manga-comic-be/views/Dashboard/pages/author/author_api.php?method=5", {
                        id: id
                    },
                    function(data, status) {
                        alert("Xóa thành công!");
                        $.ajax({
                            url: "http://localhost/manga-comic-be/views/Dashboard/pages/author/author_api.php?method=1",
                            method: "GET",
                            dataType: "json",
                            success(response) {
                                console.log(response);
                                $('#stage').load('./pages/author/author_curd.php');

                            }

                        });
                    });
            }

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