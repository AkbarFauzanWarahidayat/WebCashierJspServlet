<%-- 
    Document   : SupplierHapus
    Created on : Dec 1, 2023, 12:09:56 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    int id_supplier = Integer.parseInt(request.getParameter("id_supplier"));
    
    String url = "jdbc:mysql://localhost:3306/db_projectwebkasir";
    String username = "root";
    String password = "";
    
    Connection koneksi;
    PreparedStatement pst;
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        
        koneksi = DriverManager.getConnection(url,username,password);
        pst = koneksi.prepareStatement("DELETE FROM supplier WHERE id_supplier=?");
        pst.setInt(1, id_supplier);
        pst.execute();
        
    }
    catch(SQLException e){
        e.getMessage();
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hapus Data Supplier</title>
    </head>
    <body>
        <script>
            alert("Data Berhasil Dihapus");
            window.location.href = "Supplier.jsp";
        </script>
    </body>
</html>
