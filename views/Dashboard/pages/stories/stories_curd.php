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
                url: "http://localhost/manga-comic-be/views/Dashboard/pages/stories/stories_api.php?method=1",
                dataType: 'json',
                success: function(data) {
                    console.log(data);
                    $("#table_content").html("");
                    for (i = 0; i < data.length; i++) {
                        var dataAPI = data[i];
                        var number = i + 1;
                        var str = ` 
                            

                            <table class="table" >
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">ID</th>
                    <th scope="col">name_vienamese</th>
                    <th scope="col">name_romanji</th>
                    <th scope="col">name_japan</th>
                    <th scope="col">thumbnail</th>
                    <th scope="col">background</th>
                    <th scope="col">Ngày đăng</th>
                    <th scope="col">Lần cuối sửa</th>
                    <th scope="col">Lượt xem</th>
                    <th scope="col">Lượt đăng ký</th>
                    <th scope="col">Chức năng</th>
                </tr>
            </thead>
            <tbody>
                
                    <tr>
                        <td scope="row">${number}</td>
                        <td scope="row">${dataAPI['id']}</td>
                        <td style="width:200px ;">${dataAPI['name']}</td>
                        <td style="width:200px ;">${dataAPI['name_romanji']}</td>
                        <td style="width:200px ;">${dataAPI['name_name_japan']}</td>
                        <td style="width:200px"><img style="width:200px; height:100px; border-radius:0 !important;" src="${dataAPI['thumbnail']}" alt="" srcset=""></td>
                        <td style="width:200px"><img style="width:200px; height:100px; border-radius:0 !important;" src="${dataAPI['background']}" alt="" srcset=""></td>
                        <td>${dataAPI['created_at']}</td>
                        <td>${dataAPI['updated_at']}</td>
                        <td>${dataAPI['view_count']}</td>
                        <td>${dataAPI['favorite_count']}</td>

                        <td>
                           
                            <button class="btn btn-warning" id="myBtn" onclick="update(${dataAPI['id']})">Sửa</button>
                            <br>
                            <br>
                            <button class="btn btn-dark" id="genresBtn" onclick="genres(${dataAPI['id']})">Thể loại</button>
                            <br>
                            <br>
                            <button class="btn btn-info" id="chapterBtn" onclick="chapter(${dataAPI['id']})">Chapter</button>
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
        //danh sach tac gia cho modal update
        $(document).ready(function() {
            $.ajax({
                url: "http://localhost/manga-comic-be/views/Dashboard/pages/author/author_api.php?method=1",
                dataType: 'json',
                success: function(data) {
                    console.log(data);
                    $("#author_id").html("");
                    for (i = 0; i < data.length; i++) {
                        var author_data = data[i];
                        var str = `                                                                               
                                <option value="${author_data['id']}">${author_data['name']}</option>
                               
                            `;
                        $("#author_id").append(str);
                    }
                }
            });
        })


        //danh sach tac gia cho modal create
        $(document).ready(function() {
            $.ajax({
                url: "http://localhost/manga-comic-be/views/Dashboard/pages/author/author_api.php?method=1",
                dataType: 'json',
                success: function(data) {
                    console.log(data);
                    $("#Addauthor_id").html("");
                    for (i = 0; i < data.length; i++) {
                        var author_data = data[i];
                        var str = `                                                                                
                                <option value="${author_data['id']}">${author_data['name']}</option>                                  
                            `;
                        $("#Addauthor_id").append(str);
                    }
                }
            });
        })

        
    </script>
</head>

<body>
    <h3>DANH SÁCH TRUYỆN</h3>
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
                            <span>id</span>
                            <input type="text" name="id" id="id" disabled>
                        </div>
                        <div class="component_container">
                            <span>Tên tiếng việt</span>
                            <textarea name="name" id="name"></textarea>
                        </div>
                        <div class="component_container">
                            <span>Tên romanji</span>
                            <textarea name="name_romanji" id="name_romanji"></textarea>
                        </div>
                        <div class="component_container">
                            <span>Tên tiếng anh</span>
                            <textarea name="name_english" id="name_english"></textarea>
                        </div>
                        <div class="component_container">
                            <span>Tên tiếng Nhật</span>
                            <textarea name="name_japan" id="name_japan"></textarea>
                        </div>
                        <div class="component_container">
                            <span>keyword</span>
                            <input type="text" name="keyword" id="keyword">
                        </div>
                        <div class="component_container">
                            <span>Thumbnail</span>
                            <textarea name="thumbnail" id="thumbnail"></textarea>
                        </div>
                        <div class="component_container">
                            <span>Background</span>
                            <textarea name="background" id="background"></textarea>
                        </div>


                    </div>


                    <!--content ben phai-->
                    <div class="content_right">

                        <div class="component_container">
                            <span>Tác giả:</span>
                            <select name="author_id" id="author_id">

                            </select>
                        </div>

                        <div class="component_container">
                            <span>Trạng thái</span>
                            <select name="status_id" id="status_id">
                                <option value="1">Đang tiếng hành</option>
                                <option value="2">Sắp chiếu</option>
                                <option value="3">Hoàn thành</option>
                            </select>
                        </div>
                        <div class="component_container">
                            <span>Mô tả</span>
                            <textarea name="desc" id="desc"></textarea>
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
                            <span>Tên tiếng việt</span>
                            <textarea name="Addname" id="Addname"></textarea>
                        </div>
                        <div class="component_container">
                            <span>Tên romanji</span>
                            <textarea name="Addname_romanji" id="Addname_romanji"></textarea>
                        </div>
                        <div class="component_container">
                            <span>Tên tiếng anh</span>
                            <textarea name="Addname_english" id="Addname_english"></textarea>
                        </div>
                        <div class="component_container">
                            <span>Tên tiếng Nhật</span>
                            <textarea name="Addname_japan" id="Addname_japan"></textarea>
                        </div>
                        <div class="component_container">
                            <span>keyword</span>
                            <input type="text" name="Addkeyword" id="Addkeyword">
                        </div>
                        <div class="component_container">
                            <span>Thumbnail</span>
                            <textarea name="Addthumbnail" id="Addthumbnail"></textarea>
                        </div>
                        <div class="component_container">
                            <span>Background</span>
                            <textarea name="Addbackground" id="Addbackground"></textarea>
                        </div>

                    </div>


                    <!--content ben phai-->
                    <div class="content_right">
                        <div class="component_container">
                            <span>Tác giả:</span>
                            <!-- <input type="text" name="Addauthor_id" id="Addauthor_id"> -->
                            <select name="Addauthor_id" id="Addauthor_id">

                            </select>
                        </div>

                        <div class="component_container">
                            <span>Trạng thái</span>
                            <select name="Addstatus_id" id="Addstatus_id">
                                <option value="1">Đang tiến hành</option>
                                <option value="2">Sắp chiếu</option>
                                <option value="3">Hoàn thành</option>
                            </select>
                        </div>
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
                    url: "http://localhost/manga-comic-be/views/Dashboard/pages/stories/stories_api.php?method=2&id=" + id,
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
                        document.getElementById("name_romanji").value = response[0].name_romanji;
                        document.getElementById("name_english").value = response[0].name_english;
                        document.getElementById("name_japan").value = response[0].name_japan;
                        document.getElementById("thumbnail").value = response[0].thumbnail;
                        document.getElementById("background").value = response[0].background;
                        document.getElementById("desc").value = response[0].desc;
                        document.getElementById("status_id").value = response[0].status_id;
                        document.getElementById("author_id").value = response[0].author_id;
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
            data["name_romanji"] = $("#name_romanji").val();
            data["name_english"] = $("#name_english").val();
            data["name_japan"] = $("#name_japan").val();
            data["thumbnail"] = $("#thumbnail").val();
            data["background"] = $("#background").val();
            data["desc"] = $("#desc").val();
            data["status_id"] = $("#status_id").val();
            data["author_id"] = $("#author_id").val();


            $.post(
                "http://localhost/manga-comic-be/views/Dashboard/pages/stories/stories_api.php?method=3", {
                    id: document.getElementById("id").value,
                    keyword: document.getElementById("keyword").value,
                    name: document.getElementById("name").value,
                    name_romanji: document.getElementById("name_romanji").value,
                    name_english: document.getElementById("name_english").value,
                    name_japan: document.getElementById("name_japan").value,
                    thumbnail: document.getElementById("thumbnail").value,
                    background: document.getElementById("background").value,
                    desc: document.getElementById("desc").value,
                    status_id: document.getElementById("status_id").value,
                    author_id: document.getElementById("author_id").value,
                },
                function(data, status) {
                    modal.style.display = "none";
                    alert("Sửa thành công!");

                    $.ajax({
                        url: "http://localhost/manga-comic-be/views/Dashboard/pages/stories/stories_api.php?method=1",
                        method: "GET",
                        dataType: "json",
                        success(response) {
                            console.log(response);
                            $('#stage').load('./pages/stories/stories_curd.php');

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
            data["name_romanji"] = $("#Addname_romanji").val();
            data["name_english"] = $("#Addname_english").val();
            data["name_japan"] = $("#Addname_japan").val();
            data["thumbnail"] = $("#Addthumbnail").val();
            data["background"] = $("#Addbackground").val();
            data["desc"] = $("#Adddescr").val();
            data["status_id"] = $("#Addstatus_id").val();
            data["author_id"] = $("#Addauthor_id").val();

            console.log("run run")
            $.ajax({
                url: "http://localhost/manga-comic-be/views/Dashboard/pages/stories/stories_api.php?method=4",
                method: "POST",
                dataType: "json",
                data: {
                    keyword: document.getElementById("Addkeyword").value,
                    name: document.getElementById("Addname").value,
                    name_romanji: document.getElementById("Addname_romanji").value,
                    name_english: document.getElementById("Addname_english").value,
                    name_japan: document.getElementById("Addname_japan").value,
                    thumbnail: document.getElementById("Addthumbnail").value,
                    background: document.getElementById("Addbackground").value,
                    desc: document.getElementById("Adddescr").value,
                    status_id: document.getElementById("Addstatus_id").value,
                    author_id: document.getElementById("Addauthor_id").value,
                },
                success(response) {
                    modal.style.display = "none";
                    alert("Thêm mới thành công!");
                  
                    $.ajax({
                        url: "http://localhost/manga-comic-be/views/Dashboard/pages/stories/stories_api.php?method=1",
                        method: "GET",
                        dataType: "json",
                        success(response) {
                            console.log(response);
                            $('#stage').load('./pages/stories/stories_curd.php');
                        }

                    });
                }
            });

            // $.post(
            //     "http://localhost/manga-comic-be/views/Dashboard/pages/stories/stories_api.php?method=4", {
            //         keyword: document.getElementById("Addkeyword").value,
            //         name: document.getElementById("Addname").value,
            //         name_romanji: document.getElementById("Addname_romanji").value,
            //         name_english: document.getElementById("Addname_english").value,
            //         name_japan: document.getElementById("Addname_japan").value,
            //         thumbnail: document.getElementById("Addthumbnail").value,
            //         background: document.getElementById("Addbackground").value,
            //         desc: document.getElementById("Adddescr").value,
            //         status_id: document.getElementById("Addstatus_id").value,
            //         author_id: document.getElementById("Addauthor_id").value,
            //     },
            //     function(data, status) {
            //         modal.style.display = "none";
            //         alert("Thêm mới thành công!");
            //         $.ajax({
            //             url: "http://localhost/manga-comic-be/views/Dashboard/pages/stories/stories_api.php?method=1",
            //             method: "GET",
            //             dataType: "json",
            //             success(response) {
            //                 console.log(response);
            //                 $('#stage').load('./pages/stories/stories_curd.php');

            //             }

            //         });
            //     });

        }






        function dele(id) {
            //gửi đi "id" của dữ liệu mà mình cần lấy
            var data = {}
            data["id"] = $("#id").val();
            var result = confirm("Bạn có chắc là muốn xóa chứ?");
            if (result == true) {
                $.post(
                    "http://localhost/manga-comic-be/views/Dashboard/pages/stories/stories_api.php?method=5", {
                        id: id
                    },
                    function(data, status) {
                        alert("Xóa thành công!");
                        $.ajax({
                            url: "http://localhost/manga-comic-be/views/Dashboard/pages/stories/stories_api.php?method=1",
                            method: "GET",
                            dataType: "json",
                            success(response) {
                                console.log(response);
                                $('#stage').load('./pages/stories/stories_curd.php');

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




        function chapter(id) {
            //lấy dữ liệu từ api về
            $('#stage').load('./pages/chapter/chapter_curd.php?id=' + id);

        }

        function genres(id) {
            //lấy dữ liệu từ api về
            $('#stage').load('./pages/story_genres/story_genres_curd.php?id=' + id);

        }
    </script>


</body>

</html>