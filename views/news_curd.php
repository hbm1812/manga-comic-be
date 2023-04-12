<?php
include_once '../../manga-comic-be/api/news/functions.php';


$method = 1;


if ($method == 1) {
    $sql = "select * from news";
    $data_news = News_functions::selectall($sql);
}



if (isset($_POST['get_all_news'])) {
}

if (isset($_POST['search_news'])) {
}



?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Curd</title>
    <link rel="stylesheet" href="./modal.css">
</head>



<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


<body>

    <!--navbar-->
    <div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Quản lý tin tức</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <form class="d-flex" action="" method="post">
                                <button class="btn btn-outline-success" type="submit" name="get_all_news">Toàn bộ tin tức</button>
                            </form>


                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Dropdown
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                        </li>
                    </ul>
                    <form class="d-flex" action="" method="post">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit" name="search_news">Search</button>
                    </form>
                </div>
            </div>
        </nav>



    </div>


    <!--Body_content-->
    <h3>Danh sách tin tức</h3>
    <div class="content">
        <table class="table">
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
                <?php foreach ($data_news as $data_new) { ?>
                    <tr>
                        <th scope="row"><?php echo $data_new['id'] ?></th>
                        <td style="width:20%"><?php echo $data_new['title'] ?></td>
                        <td style="width:20%"><img style="width:200px; height:100px" src="<?php echo $data_new['thumbnail'] ?>" alt="" srcset=""></td>
                        <td><?php echo $data_new['created_at'] ?></td>
                        <td><?php echo $data_new['updated_at'] ?></td>
                        <td><?php echo $data_new['author'] ?></td>
                        <td><?php echo $data_new['views'] ?></td>
                        <td><?php echo $data_new['languages'] ?></td>
                        <td>
                            <a href="./show.php?id=<?= $data_new['id'] ?>" class="btn btn-info">Xem Chi tiết</a>
                            <!-- <a href="./edit.php?id=<?= $data_new['id'] ?>" class="btn btn-warning">Sửa</a> -->
                            <button class="btn btn-warning " id="myBtn" onclick="update(<?php echo $data_new['id'] ?>)">Sửa</button>
                            <form action="./delete.php" method="post" id="formDelete-<?= $data_new['id'] ?>">
                                <input type="hidden" name="id" value="<?= $data_new['id'] ?>">
                                <button class="btn btn-danger btn-delete" id="<?= $data_new['id'] ?>">Xóa</button>
                            </form>

                        </td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>



    <!-- The Modal -->
    <div id="myModal" class="modal">

        <!-- Nội dung form đăng nhập -->
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

                        <button type="button" class="btn btn-secondary">Thoát</button>
                        <button type="button" class="btn btn-success" id="BtnUpdate">Cập nhật</button>

                    </div>

                </div>




            </form>
        </div>

    </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        // lấy phần Modal
        var modal = document.getElementById('myModal');

        // //lay id phan mo modal
        // var btn = document.getElementsByClassName("myBtn");

        // Lấy phần span đóng Modal
        var span = document.getElementsByClassName("close")[0];

        var BtnUpdate = document.getElementById("BtnUpdate");


        //link api
        const link_api_get = "http://localhost/manga-comic-be/views/news_api.php?method=<?= $method ?>";


        // Khi button được click thi mở Modal
        function update(id) {
            modal.style.display = "block";
            <?php $method = 1; ?>

            //lấy dữ liệu từ api về
            $.ajax({
                    url: link_api_get,
                    method: "GET",
                    dataType: "json"

                })
                .done(function(response) {
                    // console.log(response);
                    response.forEach(item => {
                        console.log(item.title);
                        document.getElementById("id").value = response[id - 1].id;
                        document.getElementById("title").value = response[id - 1].title;
                        document.getElementById("thumbnail").value = response[id - 1].thumbnail;
                        document.getElementById("languages").value = response[id - 1].languages;
                        document.getElementById("country").value = response[id - 1].country;
                        document.getElementById("author").value = response[id - 1].author;
                        document.getElementById("content").value = response[id - 1].content;
                    });


                })


        }



        //khi bam nut cap nhat
        BtnUpdate.onclick = function() {
            <?php $method = 3; ?>
            //gửi đi "id" của dữ liệu mà mình cần lấy

            var data = {}
            data["id"] = $("#id").val();
            data["title"] = $("#title").val();
            data["content"] = $("#content").val();
            data["languages"] = $("#languages").val();
            data["country"] = $("#country").val();


            // $.ajax({
            //     type: "POST",
            //     contentType: "application/json",
            //     url: link_api_post,
            //     data: JSON.stringify(data),
            //     dataType: 'json',
            //     cache: false,
            //     timeout: 600000,
            //     success: function(data) {

            //         var json = "<h4>Ajax Response</h4><pre>" +
            //             JSON.stringify(data, null, 4) + "</pre>";
            //         $('#feedback').html(json);

            //         console.log("SUCCESS : ", data);
            //         $("#btn-search").prop("disabled", false);
            //         alert("id: " + data["id"] + "\ntitle: " +  data["title"]);
            //         modal.style.display = "none";


            //     },

            // });

            $.post(
                "http://localhost/manga-comic-be/views/news_api.php?method=3", {
                    id: document.getElementById("id").value,
                    title: document.getElementById("title").value,
                    content: document.getElementById("content").value,
                    languages: document.getElementById("languages").value,
                    country: document.getElementById("country").value,
                },
                function(data, status) {
                    alert("id: " + document.getElementById("id").value + "\ntitle: " + document.getElementById("title").value);
                    modal.style.display = "none";

                    $.ajax({
                        url: link_api_get,
                        method: "GET",
                        dataType: "json",
                        success(response) {
                            console.log(response);

                        }

                    });
                });

        }



        // Khi span được click thì đóng Modal
        span.onclick = function() {
            modal.style.display = "none";
        }

        // Khi click ngoài Modal thì đóng Modal
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }





        // $.ajax({
        //         url: link_api_get,
        //         method: "GET",
        //         dataType: "json",
        //         success(response){
        //             console.log(response);

        //         }

        //     });



        // $.ajax({
        //         url: link_api_get,
        //         method: "GET",
        //         dataType: "json"

        //     })
        //     .done(function(response) {
        //         // console.log(response);
        //         response.forEach(item => {
        //             console.log(item.title);

        //         });


        //     })

        // document.write(item.title);
    </script>


</body>