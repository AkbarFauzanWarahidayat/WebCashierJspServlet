<%-- 
    Document   : dashboard
    Created on : Dec 14, 2023, 12:46:36 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="SidebarDanUser.jsp"%>%>
 <!-- dashboard -->
    <div class="container-dash" style="margin-left: -49%;">
        <%
            String url = "jdbc:mysql://localhost:3306/db_projectwebkasir";
            String user = "root";
            String password = "";
        
            Connection koneksi;
            Statement st;
            ResultSet rs;
            
            try{
            Class.forName("com.mysql.jdbc.Driver");
            
            koneksi = DriverManager.getConnection(url, user, password);
            st = koneksi.createStatement();
            rs = st.executeQuery("SELECT COUNT(*) as jumlahbaris FROM stok_barang");
           
        %>
        <div class="container" style="background-color: #7ec1e6; width: 300px; height: 150px; margin-top: 30px; border-radius: 5px;">
            <i class="bi bi-shop" style="font-size: 100px; position: absolute; margin-left: 154px; color: rgb(128, 128, 128);"></i>
            <%while(rs.next()){ %>
            <h1 style="font-size: 70px; color: white;"><%=rs.getString("jumlahbaris")%></h1>
            <%}%>
            <h3 style="color: white;">Produk</h3>
        </div>
            <%rs.close();
            koneksi.close();
            
                } catch(SQLException e) { 
                 e.getMessage();
                }
            %>

        <div class="container" style="background-color: #fa6565; width: 300px; height: 150px; margin-top: -150px; border-radius: 5px; margin-left:59%;">
            <%
            
            try{
            Class.forName("com.mysql.jdbc.Driver");
            
            koneksi = DriverManager.getConnection(url, user, password);
            st = koneksi.createStatement();
            rs = st.executeQuery("SELECT COUNT(*) as jumlahbaris FROM customer");
           
        %>
            <i class="bi bi-person-plus" style="font-size: 100px; position: absolute; margin-left: 175px; color: rgba(128, 128, 128, 0.925);"></i>
            <%while(rs.next()){ %>
            <h1 style="font-size: 70px; color: white;"><%=rs.getString("jumlahbaris")%></h1>
            <%}%>
            <h3 style="color: white;">Pelanggan</h3>
        </div>
            <%rs.close();
            koneksi.close();
            
                } catch(SQLException e) { 
                 e.getMessage();
                }
            %>

        <div class="container" style="background-color: #f1c45b; width: 300px; height: 150px; margin-top: -150px; border-radius: 5px; margin-left:74%;">
            <%
            
            try{
            Class.forName("com.mysql.jdbc.Driver");
            
            koneksi = DriverManager.getConnection(url, user, password);
            st = koneksi.createStatement();
            rs = st.executeQuery("SELECT COUNT(*) as jumlahbaris FROM transaksi");
           
        %>
            <i class="bi bi-bag-check" style="font-size: 100px; position: absolute; margin-left: 175px; color: rgba(128, 128, 128, 0.925);"></i>
            <%while(rs.next()){ %>
            <h1 style="font-size: 70px; color: white;"><%=rs.getString("jumlahbaris")%></h1>
            <%}%>
            <h3 style="color: white;">Transaksi</h3>
            <%rs.close();
            koneksi.close();
            
                } catch(SQLException e) { 
                 e.getMessage();
                }
            %>
        </div>
        
        <div class="container" style="background-color: #eaeaea; width: 200px; height: 150px; margin-top: -150px; border-radius: 5px; margin-left:89%;">
            <a href="https://my.unpam.ac.id/">
            <img src="LOGO UNPAM.png" style="width: 130px; height: 130px; margin-top: 10px; margin-left: 23px">         
            </a>
        </div>
    </div>


    <!-- dashboard end -->
    </body>
    
    </html>
