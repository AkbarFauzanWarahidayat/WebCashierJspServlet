<%-- 
    Document   : history
    Created on : Dec 12, 2023, 5:20:15 PM
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
            rs = st.executeQuery("SELECT id, customer.nama_pembeli, kasir, stok_barang.nama_barang, harga, transaksi.qty, uang_masuk_pembeli, metode_pembayaran, total, kembalian FROM customer INNER JOIN transaksi ON customer.id_pembeli = transaksi.id_pembeli INNER JOIN stok_barang ON transaksi.id_barang = stok_barang.id_barang");
            

%>

<!-- history -->
    <section class="container-stokBarang">
        <h1 style="position: absolute; margin-top: 26px; margin-left: 20px;">History Hasil Transaksi</h1>
        <div class="container-tabel-stokBarang">
            <div class="container-content" style="max-height: 90%; overflow-y: auto;">
                <table class="table table-striped">
                    <thead>
                        <th>ID</th>
                        <th>Nama Pembeli</th>
                        <th>Kasir</th>
                        <th>Nama Barang Dibeli</th>
                        <th>Harga/1an</th>
                        <th>Qty</th>
                        <th>Uang Masuk Pembeli</th>
                        <th>Metode Pembayaran</th>
                        <th>Total</th>
                        <th>Kembalian</th>
                        
                    </thead>
                    <tbody>
                        <%while (rs.next()) {%>
                        <tr>
                            <td><%=rs.getString("id")%></td>
                            <td><%=rs.getString("customer.nama_pembeli")%></td>
                            <td><%=rs.getString("kasir")%></td>
                            <td><%=rs.getString("stok_barang.nama_barang")%></td>
                            <td><%=rs.getString("harga")%></td>
                            <td><%=rs.getString("transaksi.qty")%></td>
                            <td><%=rs.getString("uang_masuk_pembeli")%></td>
                            <td><%=rs.getString("metode_pembayaran")%></td>
                            <td><%=rs.getString("total")%></td>
                            <td><%=rs.getString("kembalian")%></td>
                            
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

