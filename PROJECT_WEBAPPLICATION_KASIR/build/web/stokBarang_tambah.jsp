<%-- 
    Document   : stokBarang_tambah
    Created on : Dec 3, 2023, 3:58:54 PM
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
    <title>Add Stok Barang</title>
</head>

<body>
    <div class="container-login" style="background-color: white;">
        <div style="background-color: rgb(10, 7, 22);">
            <h1 style="margin-left: 130px; margin-bottom: 50px; color: white; font-size: 25px;">Tambah Data Stok Barang</h1>
        </div>

        
        <%
            String url = "jdbc:mysql://localhost:3306/db_projectwebkasir";
            String user = "root";
            String password = "";
            
            Connection koneksi;
            Statement st;
            ResultSet rs;
        
        try {
        Class.forName("com.mysql.jdbc.Driver");
            koneksi = DriverManager.getConnection(url, user, password);
            st = koneksi.createStatement();
            rs = st.executeQuery("SELECT id_supplier,nama_supplier FROM supplier");

        %>
        <!-- FORM -->
        <form action="stokBarangTambahServlet" method="post">
            <div class="mb-4">
                <label class="label-form">Kd Barang</label>
                <input type="text" name="kdBarang"
                    style="margin-left:30px; padding-right: 103px; -webkit-box-sizing:border-box;"
                    placeholder="ex: FOV0014">
            </div>

            <div class="mb-4">
                <label class="label-form">Nama Barang</label>
                <input type="text" name="namaBarang" style="margin-left:7px; padding-right: 102px;"
                    placeholder="ex: Es Coklat">
            </div>

            <div class="mb-4">
                <label class="label-form">Qty</label>
                <input type="text" name="qty" style="margin-left:78px; padding-right: 101px;"
                    placeholder="ex: 5">
            </div>

            <div class="mb-4">
                <label class="label-form">Harga Satuan</label>
                <input type="text" name="hargaSatuan" style="margin-left:8px; padding-right: 101px;"
                    placeholder="ex: 10000">
            </div>

            <div class="mb-4">
                <select name="id_supplier" id="" style="margin-left:55px; ">
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
                <input type="submit" value="Tambah" class="label-form btn btn-primary"
                    style="padding-left: 20px; padding-right: 20px;" onclick="buttonklik()">
            </div>
        </form>
        <!-- FORM END -->

        <span style="margin-left: 10%;">
            <a href="stokBarang.jsp">Kembali</a>
        </span>
    </div>

    <script>
        function buttonklik(){
            alert("Data Tersimpan");
        }
    </script>
</body>

</html>
