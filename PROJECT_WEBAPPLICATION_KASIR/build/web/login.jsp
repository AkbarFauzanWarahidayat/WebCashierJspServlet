<%-- 
    Document   : login
    Created on : Dec 12, 2023, 4:17:12 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="style/style.css">
    <title>LOGIN KASIR</title>
</head>

<body>
    <div class="container-login" style="background-color: white;">
        <div style="background-color: rgb(10, 7, 22);">
            <h1 style="margin-left: 260px; margin-bottom: 50px; color: white; font-size: 25px;">LOGIN
            </h1>
        </div>

        <!-- form -->
        <form action="loginServlet" method="post">
            <div class="mb-4">
                <label class="label-form">Nama</label>
                <input type="text" name="nama"
                    style="margin-left:48px; padding-right: 103px; -webkit-box-sizing:border-box;"
                    placeholder="ex: nama-saya" id="nama">
            </div>

            <div class="mb-4">
                <label class="label-form">Email</label>
                <input type="email" name="email" style="margin-left:53px; padding-right: 102px;"
                    placeholder="ex: blabla@gmail.com" id="email">
            </div>

            <div class="mb-4">
                <label class="label-form">Password</label>
                <input type="password" name="password" style="margin-left:24px; padding-right: 101px;" id="password">
            </div>

            <div class="mb-4">
                <input type="submit" value="Login" class="label-form btn btn-primary"
                       style="padding-left: 20px; padding-right: 20px; margin-left: 260px;" onclick="login()">
            </div>
        </form>
        <!-- form end -->

        <span style="margin-left: 10%;">    
        </span>
    </div>
    
<!--    <script>
        alert("Login gagal, pastikan username,email dan password benar!");
        window.location.href="login.jsp";
    </script>-->
</body>

</html>
