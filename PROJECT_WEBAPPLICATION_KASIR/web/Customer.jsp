<%-- 
    Document   : Customer
    Created on : Nov 26, 2023, 12:27:21 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="SidebarDanUser.jsp"%>

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
            rs = st.executeQuery("SELECT * FROM customer");

%>
 <!-- customer -->
    <section class="container-customer">
        <h1 style="position: absolute; margin-top: 26px; margin-left: 20px;">Data Customer</h1>
        <div class="container-tabel-customer">
            <div class="container-content">
                <a href="tambahDataCustomer.jsp">
                    <input type="submit" value="+ Tambah Data" class="btn btn-primary btn-sm mb-2 mt-3">
                </a>
                <table class="table table-striped">
                    <thead>
                        <th>Id</th>
                        <th>Nama Customer</th>
                        <th>Alamat Customer</th>
                        <th>Usia Customer</th>
                        <th>Action</th>
                    </thead>
                    <tbody>
                        <%while (rs.next()) {%>
                        <tr>
                            <td><%=rs.getString("id_pembeli")%></td>
                            <td><%=rs.getString("nama_pembeli")%></td>
                            <td><%=rs.getString("alamat")%></td>
                            <td><%=rs.getString("usia")%></td>
                            <td><a href="editDataCustomer.jsp?id_pembeli=<%=rs.getString("id_pembeli")%>" class="btn btn-warning btn-sm">Edit</a>
                                <a href="hapusDataCustomer.jsp?id_pembeli=<%=rs.getString("id_pembeli")%>" class="btn btn-danger btn-sm">Hapus</a>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                        <% 
                            rs.close();
                           koneksi.close();
                            } catch (SQLException e) {
                                e.getMessage();
                            }
                        %>
            </div>
        </div>
    </section>
    <!-- customer -->
    
    </body>
    </html>
