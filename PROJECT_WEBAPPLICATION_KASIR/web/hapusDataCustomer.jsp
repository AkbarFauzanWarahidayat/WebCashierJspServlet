<%-- 
    Document   : hapusDataCustomer
    Created on : Nov 26, 2023, 2:50:45 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    String url = "jdbc:mysql://localhost:3306/db_projectwebkasir";
    String user = "root";
    String pass = "";
    
    Connection koneksi;
    PreparedStatement pst;
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        
        koneksi = DriverManager.getConnection(url, user, pass);
        pst = koneksi.prepareStatement("DELETE FROM customer WHERE id_pembeli=?");
        
        int id_pembeli = Integer.parseInt(request.getParameter("id_pembeli"));
        pst.setInt(1, id_pembeli);
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
        <title>delete</title>
    </head>
    <body>
        <script>
            alert("Data Berhasil Dihapus");
            window.location.href = "Customer.jsp";
        </script>    
    </body>
</html>
