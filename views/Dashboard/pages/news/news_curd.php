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
            $.ajax({
                url: "http://localhost/manga-comic-be/views/news_api.php?method=1",
                dataType: 'json',
                success: function(data) {
                    console.log(data);
                    $("#table_content").html("");
                    for (i = 0; i < data.length; i++) {
                        var news = data[i]; //vd  {idTinh:'6', loai:'Tỉnh', tenTinh:'Bắc Kạn'}
                        var str = ` 
                            

                            <table class="table" >
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">tiêu đề</th>
                    <th scope="col">Ảnh</th>
                    <th scope="col">Ngày đăng</th>
                    <th scope="col">Ngày sửa gần đây</th>
                    <th scope="col">Tác giả</th>
                    <th scope="col">Lượt xem</th>
                    <th scope="col">Ngôn ngữ</th>
                    <th scope="col">Chức năng</th>
                </tr>
            </thead>
            <tbody>
                
                    <tr>
                        <td scope="row">${news['id']}</td>
                        <td style="width:200px ;">${news['title']}</td>
                        <td style="width:200px"><img style="width:200px; height:100px; border-radius:0 !important;" src="${news['thumbnail']}" alt="" srcset=""></td>
                        <td>${news['created_at']}</td>
                        <td>${news['updated_at']}</td>
                        <td>${news['author']}</td>
                        <td>${news['views']}</td>
                        <td>${news['languages']}</td>
                        <td>
                           
                            <!-- <a href="./edit.php?id" class="btn btn-warning">Sửa</a> -->
                            <button class="btn btn-warning" id="myBtn" onclick="update(${news['id']})">Sửa</button>
                            <button class="btn btn-danger btn-delete" id="BtnDelete" onclick="dele(${news['id']})">Xóa</button>
                           

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
    <h3>Danh sách tin tức</h3>
    <button type="button" class="btn btn-secondary" id="BtnAdd">Thêm tin mới</button>
    <div class="content" id="table_content">


    </div>


    <!-- The Modal -->
    <div id="myModal" class="modal">

        <!-- Nội dung form modal -->
        <div class="modal-content">
            <form action="#">
                <span class="close">&times;</span>
                <h2>Chỉnh sửa tin tức</h2>

                <div class="modal_content">
                    <!--content ben trai-->
                    <div class="content_left">
                        <div class="component_container">
                            <span>id</span>
                            <input type="text" name="id" id="id" disabled>
                        </div>
                        <div class="component_container">
                            <span>Thể loại tin tức:</span>
                            <!-- <input type="text" name="Addcategory_news_id" id="Addcategory_news_id"> -->
                            <select name="category_news_id" id="category_news_id">
                                <option value="2">Anime</option>
                                <option value="3">Truyện tranh</option>
                                <option value="4">Thông tin</option>
                            </select>
                        </div>
                        <div class="component_container">
                            <span>Title</span>
                            <textarea name="title" id="title"></textarea>
                        </div>

                        <div class="component_container">
                            <span>Thumbnail</span>
                            <textarea name="thumbnail" id="thumbnail"></textarea>
                        </div>
                        <div class="component_container">
                            <span>Languages</span>
                            <select name="languages" id="languages">
                                <option value="English">English</option>
                                <option value="Vi">Vi</option>
                            </select>

                            <span style="margin-left: 180px;">Country</span>
                            <select name="country" id="country">
                                <option value="Japan">Japan</option>
                                <option value="China">China</option>
                            </select>
                        </div>
                        <div class="component_container">
                            <span>Tác giả</span>
                            <input type="text" name="author" id="author" disabled>
                        </div>

                    </div>


                    <!--content ben phai-->
                    <div class="content_right">
                        <div class="component_container">
                            <span>Content</span>
                            <textarea name="content" id="content"></textarea>
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
                <h2>Thêm mới tin tức</h2>

                <div class="modal_content">
                    <!--content ben trai-->
                    <div class="content_left">
                        <div class="component_container">
                            <span>Thể loại tin tức:</span>
                            <!-- <input type="text" name="Addcategory_news_id" id="Addcategory_news_id"> -->
                            <select name="Addcategory_news_id" id="Addcategory_news_id">
                                <option value="2">Anime</option>
                                <option value="3">Truyện tranh</option>
                                <option value="4">Thông tin</option>
                            </select>
                        </div>
                        <div class="component_container">
                            <span>Title</span>
                            <textarea name="Addtitle" id="Addtitle"></textarea>
                        </div>

                        <div class="component_container">
                            <span>Thumbnail:</span>
                            <textarea name="Addthumbnail" id="Addthumbnail"></textarea>
                        </div>
                        <div class="component_container">
                            <span>Languages</span>
                            <select name="Addlanguages" id="Addlanguages">
                                <option value="English">English</option>
                                <option value="Vi">Vi</option>
                            </select>

                            <span style="margin-left: 180px;">Country</span>
                            <select name="Addcountry" id="Addcountry">
                                <option value="Japan">Japan</option>
                                <option value="China">China</option>
                            </select>
                        </div>
                        <div class="component_container">
                            <span>Tác giả</span>
                            <input type="text" name="Addauthor" id="Addauthor">
                        </div>

                    </div>


                    <!--content ben phai-->
                    <div class="content_right">
                        <div class="component_container">
                            <span>Content</span>
                            <textarea name="Addcontent" id="Addcontent"></textarea>
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
            // modal.style.display = "block";
           
            // alert("\nid: " + id);
            //lấy dữ liệu từ api về
            $.ajax({
                    url: "http://localhost/manga-comic-be/views/news_api.php?method=2&id="+id,
                    method: "GET",
                    dataType: "json"

                })
                .done(function(response) {
                    modal.style.display = "block";
                    console.log(response);
                    response.forEach(item => {
                        document.getElementById("id").value = response[0].id;
                        document.getElementById("category_news_id").value=response[0].category_news_id;
                        document.getElementById("title").value = response[0].title;
                        document.getElementById("thumbnail").value = response[0].thumbnail;
                        document.getElementById("languages").value = response[0].languages;
                        document.getElementById("country").value = response[0].country;
                        document.getElementById("author").value = response[0].author;
                        document.getElementById("content").value = response[0].content;
                    });


                })
        }



        //khi bam nut cap nhat
        BtnUpdate.onclick = function() {

            //gửi đi "id" của dữ liệu mà mình cần lấy

            var data = {}
            data["id"] = $("#id").val();
            data["category_news_id"] = $("#category_news_id").val();
            data["title"] = $("#title").val();
            data["content"] = $("#content").val();
            data["languages"] = $("#languages").val();
            data["country"] = $("#country").val();


            $.post(
                "http://localhost/manga-comic-be/views/news_api.php?method=3", {
                    id: document.getElementById("id").value,
                    category_news_id: document.getElementById("category_news_id").value,
                    title: document.getElementById("title").value,
                    content: document.getElementById("content").value,
                    languages: document.getElementById("languages").value,
                    country: document.getElementById("country").value,
                },
                function(data, status) {
                    modal.style.display = "none";
                    alert("Sửa thành công!");

                    $.ajax({
                        url: "http://localhost/manga-comic-be/views/news_api.php?method=1",
                        method: "GET",
                        dataType: "json",
                        success(response) {
                            console.log(response);
                            $('#stage').load('./pages/news/news_curd.php');

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
            data["category_news_id"] = $("#Addcategory_news_id").val();
            data["title"] = $("#Addtitle").val();
            data["author"] = $("#Addauthor").val();
            data["content"] = $("#Addcontent").val();
            data["thumbnail"] = $("#Addthumbnail").val();
            data["languages"] = $("#Addlanguages").val();
            data["country"] = $("#Addcountry").val();


            $.post(
                "http://localhost/manga-comic-be/views/news_api.php?method=4", {
                    category_news_id: document.getElementById("Addcategory_news_id").value,
                    title: document.getElementById("Addtitle").value,
                    author: document.getElementById("Addauthor").value,
                    content: document.getElementById("Addcontent").value,
                    thumbnail: document.getElementById("Addthumbnail").value,
                    languages: document.getElementById("Addlanguages").value,
                    country: document.getElementById("Addcountry").value,
                },
                function(data, status) {
                    modal.style.display = "none";
                    alert("Thêm mới thành công!");
                    $.ajax({
                        url: "http://localhost/manga-comic-be/views/news_api.php?method=1",
                        method: "GET",
                        dataType: "json",
                        success(response) {
                            console.log(response);
                            $('#stage').load('./pages/news/news_curd.php');

                        }

                    });
                });

        }






        function dele(id) {
            //gửi đi "id" của dữ liệu mà mình cần lấy
            var data = {}
            data["id"] = $("#id").val();

            $.post(
                "http://localhost/manga-comic-be/views/news_api.php?method=5", {
                    id: id
                },
                function(data, status) {
                    alert("Xóa thành công!");
                    $.ajax({
                        url: "http://localhost/manga-comic-be/views/news_api.php?method=1",
                        method: "GET",
                        dataType: "json",
                        success(response) {
                            console.log(response);
                            $('#stage').load('./pages/news/news_curd.php');

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