<%-- 
    Document   : stokBarang_edit
    Created on : Dec 5, 2023, 5:43:33 PM
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
    <%

    String url = "jdbc:mysql://localhost:3306/db_projectwebkasir";
    String user = "root";
    String password = "";
    
    Connection koneksi;
    ResultSet rs;
    Statement st;
    

    try { 
        Class.forName("com.mysql.jdbc.Driver");
        koneksi = DriverManager.getConnection(url,user,password);
        st = koneksi.createStatement();
        rs = st.executeQuery("SELECT id_supplier,nama_supplier FROM supplier");
    
%>
    <div class="container-login" style="background-color: white;">
        <div style="background-color: rgb(10, 7, 22);">
            <h1 style="margin-left: 180px; margin-bottom: 50px; color: white; font-size: 25px;">Edit Data Supplier</h1>
        </div>

        <!-- FORM -->
        <form action="stokBarangEditServlet" method="post">

            <div class="mb-4">
                <label class="label-form">ID</label>
                <input type="text" name="idStok"
                    style="margin-left:84px; padding-right: 103px; -webkit-box-sizing:border-box;"
                    placeholder="ex: 1">
            </div>

            <div class="mb-4">
                <label class="label-form">Kd Barang</label>
                <input type="text" name="kdBarang"
                    style="margin-left:27px; padding-right: 103px; -webkit-box-sizing:border-box;"
                    placeholder="ex: POD0203">
            </div>

            <div class="mb-4">
                <label class="label-form">Nama Barang</label>
                <input type="text" name="namaBarang" style="margin-left:3px; padding-right: 102px;"
                    placeholder="ex: TOKO BERKAH">
            </div>

            <div class="mb-4">
                <label class="label-form">QTY</label>
                <input type="text" name="qty" style="margin-left:70px; padding-right: 101px;"
                    placeholder="ex: BOX">
            </div>

            <div class="mb-4">
                <label class="label-form">Harga Satuan</label>
                <input type="text" name="hargaSatuan" style="margin-left:4px; padding-right: 101px;"
                    placeholder="ex: 20">
            </div>

            <div class="mb-4">             
                <select name="id_Supplier" id="" style="margin-left:55px; ">
                    <option selected>--Pilih Supplier--</option>
                    <%while(rs.next()) { %>
                    <option value="<%=rs.getString("id_supplier")%>"><%=rs.getString("nama_supplier")%></option>
                    <%}%>
                </select>
            </div>
            <%
                 rs.close();
                 st.close();
                 }
                 catch(SQLException e){
                    e.getMessage();
                }

            %>

            <div class="mb-4">
                <input type="submit" value="Simpan" class="label-form btn btn-primary"
                    style="padding-left: 20px; padding-right: 20px;" onclick="buttonklik()">
            </div>
        </form>
        <!-- FORM END -->

        <span style="margin-left: 10%;">
            <a href="stokBarang_edit.jsp">Kembali</a>
        </span>
    </div>

    <script>
        function buttonklik(){
            alert("Data Berhasil Di Edit");
        }
    </script>
</body>

</html>