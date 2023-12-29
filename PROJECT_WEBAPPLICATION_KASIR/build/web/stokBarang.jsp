<%-- 
    Document   : stokBarang
    Created on : Dec 1, 2023, 1:01:46 AM
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
            rs = st.executeQuery("SELECT stok_barang.id_barang, stok_barang.kd_barang, stok_barang.nama_barang, stok_barang.qty, stok_barang.harga_satuan, supplier.nama_supplier FROM stok_barang INNER JOIN supplier ON stok_barang.id_supplier = supplier.id_supplier");
            

%>

<!-- stokBarang -->
    <section class="container-stokBarang">
        <h1 style="position: absolute; margin-top: 26px; margin-left: 20px;">Data Stok Barang</h1>
        <div class="container-tabel-stokBarang">
            <div class="container-content">
                <a href="stokBarang_tambah.jsp">
                    <input type="submit" value="+ Tambah Data" class="btn btn-primary btn-sm mb-2 mt-3">
                </a>
                <table class="table table-striped">
                    <thead>
                        <th>ID Barang</th>
                        <th>Kode Barang</th>
                        <th>Nama Barang</th>
                        <th>Qty</th>
                        <th>Harga Satuan</th>
                        <th>Supplier</th>
                        <th>Action</th>
                    </thead>
                    <tbody>
                        <%while (rs.next()) {%>
                        <tr>
                            <td><%=rs.getString("id_barang")%></td>
                            <td><%=rs.getString("kd_barang")%></td>
                            <td><%=rs.getString("nama_barang")%></td>
                            <td><%=rs.getString("qty")%></td>
                            <td><%=rs.getString("harga_satuan")%></td>
                            <td><%=rs.getString("nama_supplier")%></td>
                            <td><a href="stokBarang_edit.jsp?id_barang=<%=rs.getString("id_barang")%>" class="btn btn-warning btn-sm">Edit</a>
                                <a href="stokBarang_hapus.jsp?id_barang=<%=rs.getString("id_barang")%>" class="btn btn-danger btn-sm">Hapus</a>
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
    <!-- stokBarang -->
    
    </body>
    </html>
