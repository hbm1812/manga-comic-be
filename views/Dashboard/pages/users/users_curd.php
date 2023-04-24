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
                url: "http://localhost/manga-comic-be/views/Dashboard/pages/users/users_api.php?method=1",
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
                    <th scope="col">#</th>
                    <th scope="col">name</th>
                    <th scope="col">email</th>
                    <th scope="col">username</th>
                    <th scope="col">password</th>
                    <th scope="col">phone</th>
                    <th scope="col">role_id</th>
                    <th scope="col">avatar</th>
                    <th scope="col">created_at</th>
                    <th scope="col">updated_at</th>
                    <th scope="col">Chức năng</th>
                </tr>
            </thead>
            <tbody>
                
                    <tr>
                        <td scope="row">${dataAPI['id']}</td>
                        <td style="width:200px ;">${dataAPI['name']}</td>
                        <td style="width:200px ;">${dataAPI['email']}</td>
                        <td style="width:200px ;">${dataAPI['username']}</td>
                        <td style="width:200px ;">${dataAPI['password']}</td>
                        <td>${dataAPI['phone']}</td>
                        <td>${dataAPI['role_id']}</td>
                        <td style="width:200px"><img style="width:200px; height:100px; border-radius:0 !important;" src="${dataAPI['avatar']}" alt="" srcset=""></td>                       
                        <td>${dataAPI['created_at']}</td>
                        <td>${dataAPI['updated_at']}</td>

                        <td>
                           
                            <!-- <a href="./edit.php?id" class="btn btn-warning">Sửa</a> -->
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
    <h3>DANH SÁCH TÀI KHOẢN</h3>
    <button type="button" class="btn btn-secondary" id="BtnAdd">Thêm mới</button>
    <div class="content" id="table_content">


    </div>


    <!-- The Modal -->
    <div id="myModal" class="modal">

        <!-- Nội dung form modal -->
        <div class="modal-content">
            <form action="#">
                <span class="close">&times;</span>
                <h2>CHỈNH SỬA THÔNG TIN TÀI KHOẢN</h2>

                <div class="modal_content">
                    <!--content ben trai-->
                    <div class="content_left">
                        <div class="component_container">
                            <span>id</span>
                            <input type="text" name="id" id="id" disabled>
                        </div>
                        <div class="component_container">
                            <span>Name</span>
                            <input type="text" name="name" id="name" disabled>
                        </div>
                        <div class="component_container">
                            <span>Role:</span>
                            <select name="role_id" id="role_id">
                                <option value="1">Admin</option>
                                <option value="2">User</option>
                            </select>
                        </div>

                        <div class="component_container">
                            <span>Username</span>
                            <input type="text" name="username" id="username" disabled>
                        </div>
                        <div class="component_container">
                            <span>Password</span>
                            <input type="text" name="password" id="password">
                        </div>




                    </div>


                    <!--content ben phai-->
                    <div class="content_right">

                        <div class="component_container">
                            <span>email</span>
                            <input type="text" name="email" id="email" disabled>
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
                            <span>id</span>
                            <input type="text" name="Addid" id="Addid" disabled>
                        </div>
                        <div class="component_container">
                            <span>Name</span>
                            <input type="text" name="Addname" id="Addname">
                        </div>
                        <div class="component_container">
                            <span>Role:</span>
                            <select name="Addrole_id" id="Addrole_id">
                                <option value="1">Admin</option>
                                <option value="2">User</option>
                            </select>
                        </div>
                        <div class="component_container">
                            <span>Avatar</span>
                            <textarea name="Addavatar" id="Addavatar"></textarea>
                        </div>
                        <div class="component_container">
                            <span>Username</span>
                            <input type="text" name="Addusername" id="Addusername">
                        </div>
                        <div class="component_container">
                            <span>Password</span>
                            <input type="text" name="Addpassword" id="Addpassword">
                        </div>

                    </div>


                    <!--content ben phai-->
                    <div class="content_right">
                    <div class="component_container">
                            <span>email</span>
                            <input type="text" name="Addemail" id="Addemail">
                        </div>
                        <div class="component_container">
                            <span>Phone</span>
                            <input type="text" name="Addphone" id="Addphone">
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
                    url: "http://localhost/manga-comic-be/views/Dashboard/pages/users/users_api.php?method=2&id=" + id,
                    method: "GET",
                    dataType: "json"

                })
                .done(function(response) {
                    modal.style.display = "block";
                    console.log(response);
                    response.forEach(item => {
                        document.getElementById("id").value = response[0].id;
                        document.getElementById("name").value = response[0].name;
                        document.getElementById("email").value = response[0].email;
                        document.getElementById("username").value = response[0].username;
                        document.getElementById("password").value = response[0].password;
                        document.getElementById("role_id").value = response[0].role_id;
                    });


                })
        }



        //khi bam nut cap nhat
        BtnUpdate.onclick = function() {

            //gửi đi "id" của dữ liệu mà mình cần lấy

            var data = {}
            data["id"] = $("#id").val();
            data["password"] = $("#password").val();
            data["role_id"] = $("#role_id").val();



            $.post(
                "http://localhost/manga-comic-be/views/Dashboard/pages/users/users_api.php?method=3", {
                    id: document.getElementById("id").value,
                    password: document.getElementById("password").value,
                    role_id: document.getElementById("role_id").value,
                },
                function(data, status) {
                    modal.style.display = "none";
                    alert("id: " + document.getElementById("id").value + "\npassword: " + document.getElementById("password").value+ "\nrole_id: " + document.getElementById("role_id").value);
                    // alert("Sửa thành công!");

                    $.ajax({
                        url: "http://localhost/manga-comic-be/views/Dashboard/pages/users/users_api.php?method=1",
                        method: "GET",
                        dataType: "json",
                        success(response) {
                            console.log(response);
                            $('#stage').load('./pages/users/users_curd.php');

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
            data["Addname"] = $("#Addname").val();
            data["Addemail"] = $("#Addemail").val();
            data["Addusername"] = $("#Addusername").val();
            data["Addpassword"] = $("#Addpassword").val();
            data["Addphone"] = $("#Addphone").val();
            data["Addavatar"] = $("#Addavatar").val();
            data["Addrole_id"] = $("#Addrole_id").val();


            $.post(
                "http://localhost/manga-comic-be/views/Dashboard/pages/users/users_api.php?method=4", {
                    name: document.getElementById("Addname").value,
                    password: document.getElementById("Addpassword").value,
                    role_id: document.getElementById("Addrole_id").value,
                    username: document.getElementById("Addusername").value,
                    phone: document.getElementById("Addphone").value,
                    email: document.getElementById("Addemail").value,
                    avatar: document.getElementById("Addavatar").value,

                },
                function(data, status) {
                    modal.style.display = "none";
                    alert("Thêm mới thành công!");
                    $.ajax({
                        url: "http://localhost/manga-comic-be/views/Dashboard/pages/users/users_api.php?method=1",
                        method: "GET",
                        dataType: "json",
                        success(response) {
                            console.log(response);
                            $('#stage').load('./pages/users/users_curd.php');

                        }

                    });
                });

        }






        function dele(id) {
            //gửi đi "id" của dữ liệu mà mình cần lấy
            var data = {}
            data["id"] = $("#id").val();
            var result =  confirm("Bạn có chắc là muốn xóa chứ?");
			if(result ==true){
                $.post(
                "http://localhost/manga-comic-be/views/Dashboard/pages/users/users_api.php?method=5", {
                    id: id
                },
                function(data, status) {
                    alert("Xóa thành công!");
                    $.ajax({
                        url: "http://localhost/manga-comic-be/views/Dashboard/pages/users/users_api.php?method=1",
                        method: "GET",
                        dataType: "json",
                        success(response) {
                            console.log(response);
                            $('#stage').load('./pages/users/users_curd.php');

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