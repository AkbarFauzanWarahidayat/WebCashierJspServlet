<%-- 
    Document   : SupplierEdit
    Created on : Nov 30, 2023, 11:08:12 PM
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
    <title>Edit Supplier</title>
</head>

<body>
    <div class="container-login" style="background-color: white;">
        <div style="background-color: rgb(10, 7, 22);">
            <h1 style="margin-left: 180px; margin-bottom: 50px; color: white; font-size: 25px;">Edit Data Supplier</h1>
        </div>

        <!-- FORM -->
        <form action="SupplierEditServlet" method="post">

            <div class="mb-4">
                <label class="label-form">ID</label>
                <input type="text" name="id_supplier"
                    style="margin-left:84px; padding-right: 103px; -webkit-box-sizing:border-box;"
                    placeholder="ex: 1">
            </div>

            <div class="mb-4">
                <label class="label-form">No Faktur</label>
                <input type="text" name="editnoFaktur"
                    style="margin-left:30px; padding-right: 103px; -webkit-box-sizing:border-box;"
                    placeholder="ex: POD0203">
            </div>

            <div class="mb-4">
                <label class="label-form">Nama Supplier</label>
                <input type="text" name="editnamaSupplier" style="margin-left:-5px; padding-right: 102px;"
                    placeholder="ex: TOKO BERKAH">
            </div>

            <div class="mb-4">
                <label class="label-form">Jenis Barang</label>
                <input type="text" name="editjenisBarang" style="margin-left:13px; padding-right: 101px;"
                    placeholder="ex: BOX">
            </div>

            <div class="mb-4">
                <label class="label-form">Jumlah Barang</label>
                <input type="text" name="editjumlahBarang" style="margin-left:-3px; padding-right: 101px;"
                    placeholder="ex: 20">
            </div>

            <div class="mb-4">
                <input type="submit" value="Simpan" class="label-form btn btn-primary"
                    style="padding-left: 20px; padding-right: 20px;" onclick="buttonklik()">
            </div>
        </form>
        <!-- FORM END -->

        <span style="margin-left: 10%;">
            <a href="Supplier.jsp">Kembali</a>
        </span>
    </div>

    <script>
        function buttonklik(){
            alert("Data Berhasil Di Edit");
        }
    </script>
</body>

</html>
