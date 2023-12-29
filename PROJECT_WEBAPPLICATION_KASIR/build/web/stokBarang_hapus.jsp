<%-- 
    Document   : stokBarang_hapus
    Created on : Dec 5, 2023, 5:43:44 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    int id_barang = Integer.parseInt(request.getParameter("id_barang"));
    
    String url = "jdbc:mysql://localhost:3306/db_projectwebkasir";
    String username = "root";
    String password = "";
    
    Connection koneksi;
    PreparedStatement pst;
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
    
        koneksi = DriverManager.getConnection(url,username,password);
        pst = koneksi.prepareStatement("DELETE FROM stok_barang WHERE id_barang=?");
        pst.setInt(1, id_barang);
        pst.execute();
        
    } catch(SQLException e){
        e.getMessage();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script>
            alert("Data Berhasil Dihapus");
            window.location.href = "stokBarang.jsp";
        </script>
    </body>
</html>
