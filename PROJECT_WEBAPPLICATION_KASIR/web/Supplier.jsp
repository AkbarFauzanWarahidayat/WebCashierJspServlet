<%-- 
    Document   : Supplier
    Created on : Nov 30, 2023, 9:55:21 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%@include file="SidebarDanUser.jsp"%>

<%
    String url = "jdbc:mysql://localhost:3306/db_projectwebkasir";
    String username = "root";
    String password = "";
    
    Connection koneksi;
    Statement st;
    ResultSet rs;
    
    try {
    Class.forName("com.mysql.jdbc.Driver");
    
    koneksi = DriverManager.getConnection(url, username, password);
    st = koneksi.createStatement();
    rs = st.executeQuery("SELECT * FROM supplier");
    
    
%>

<!-- supplier -->
    <section class="container-supplier">
        <h1 style="position: absolute; margin-top: 26px; margin-left: 20px;">Data Supplier</h1>
        <div class="container-tabel-supplier">
            <div class="container-content">
                <a href="SupplierTambah.jsp">
                    <input type="submit" value="+ Tambah Data" class="btn btn-primary btn-sm mb-2 mt-3">
                </a>
                <table class="table table-striped">
                    <thead>
                        <th>ID</th>
                        <th>No Faktur</th>
                        <th>Nama Supplier</th>
                        <th>Jenis Barang</th>
                        <th>Jumlah Barang</th>
                        <th>Action</th>
                    </thead>
                    <tbody>
                        <%while(rs.next()){%>
                        <tr>
                            <td><%=rs.getString("id_supplier")%></td>
                            <td><%=rs.getString("no_faktur")%></td>
                            <td><%=rs.getString("nama_supplier")%></td>
                            <td><%=rs.getString("jenis_barang")%></td>
                            <td><%=rs.getString("jumlah_barang")%></td>
                            <td><a href="SupplierEdit.jsp?id_supplier=<%=rs.getString("id_supplier")%>" class="btn btn-warning btn-sm">Edit</a>
                                <a href="SupplierHapus.jsp?id_supplier=<%=rs.getString("id_supplier")%>" class="btn btn-danger btn-sm">Hapus</a>
                            </td>
                        </tr>
                        <% } %>
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
    <!-- supplier -->
    
    </body>
    </html>