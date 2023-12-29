<%-- 
    Document   : editDataCustomer
    Created on : Nov 26, 2023, 3:24:52 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="style/style.css">
    <title>Edit Customer</title>
</head>

<body>
    <div class="container-login" style="background-color: white;">
        <div style="background-color: rgb(10, 7, 22);">
            <h1 style="margin-left: 165px; margin-bottom: 50px; color: white; font-size: 25px;">Edit Data Customer</h1>
        </div>

        <!-- FORM -->
        <form action="editDataCustomerServlet" method="post">
            <div class="mb-4">
                <label class="label-form">ID</label>
                <input type="text" name="id_pembeli"
                    style="margin-left:56px; padding-right: 103px; -webkit-box-sizing:border-box;"
                    placeholder="ex: id-customer">
            </div>
            <div class="mb-4">
                <label class="label-form">Nama</label>
                <input type="text" name="editnama"
                    style="margin-left:30px; padding-right: 103px; -webkit-box-sizing:border-box;"
                    placeholder="ex: nama-customer">
            </div>

            <div class="mb-4">
                <label class="label-form">Alamat</label>
                <input type="text" name="editalamat" style="margin-left:23px; padding-right: 102px;"
                    placeholder="ex: BSD">
            </div>

            <div class="mb-4">
                <label class="label-form">Usia</label>
                <input type="text" name="editusia" style="margin-left:44px; padding-right: 101px;"
                    placeholder="ex: 20">
            </div>

            <div class="mb-4">
                <input type="submit" value="Edit" class="label-form btn btn-primary"
                    style="padding-left: 20px; padding-right: 20px;" onclick="buttonklik()">
            </div>
        </form>
        <!-- FORM END -->

        <span style="margin-left: 10%;">
            <a href="Customer.jsp">Kembali</a>
        </span>
    </div>

    <script>
        function buttonklik(){
            alert("Data Tersimpan");
        }
    </script>
</body>

</html>