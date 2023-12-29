<%-- 
    Document   : Transaksi
    Created on : Dec 6, 2023, 10:39:44 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.time.LocalDate"%>
<%@include file="SidebarDanUser.jsp"%>

<%

    LocalDate currentDate = LocalDate.now();

    HttpSession sesi = request.getSession();
    sesi.setAttribute("date", currentDate);

    LocalDate date = (LocalDate) sesi.getAttribute("date");

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
        rs = st.executeQuery("SELECT DISTINCT customer.id_pembeli, customer.nama_pembeli FROM transaksi RIGHT JOIN customer ON transaksi.id_pembeli = customer.id_pembeli");
%>



<!-- transaksi kasir -->
<section style="margin-left: 250px; position: absolute;">
    <h1 style=" margin-top: 26px; margin-left: -30px;">Transaksi Kasir</h1>


    <div class="container-pertama">
        <div class="kasir-customer" style="background-color: white; width: 110%;height: 190px; margin-top: 30px;padding-top: 1px;border-radius: 5px;">
            <div style="margin-bottom: 30px; margin-left: 20px; margin-top: 20px;">
                <label style="margin-right: 60px;">Date</label>
                <input type="text" readonly placeholder="  <%=date%>">
            </div>
                <form action="perhitunganTransaksi" method="POST">
                <div style="margin-bottom: 30px; margin-left: 20px;">
                    <label style="margin-right: 60px;">Kasir</label>
                    <input type="text" name="kasir" readonly value="<%=namasesi%>" id="kasirjs">
                </div>
                <div style=" margin-left: 20px;">
                    <label style="margin-right: 26px;">Customer</label>
                    <select name="id_pembeli" id="" style="padding-right: 29px;">
                        <option selected>-- Nama Pembeli --</option>
                        <%while(rs.next()) {%>
                        <option value="<%=rs.getString("id_pembeli")%>"><%=rs.getString("nama_pembeli")%></option>  
                        <%}%>
                    </select>
                </div>
                <%
                        rs.close();
                        st.close();
                    } catch (SQLException e) {
                        e.getMessage();
                    }
                %>

        </div>


        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                koneksi = DriverManager.getConnection(url, username, password);
                st = koneksi.createStatement();
                rs = st.executeQuery("SELECT DISTINCT stok_barang.id_barang, stok_barang.nama_barang FROM transaksi RIGHT JOIN stok_barang ON transaksi.id_barang = stok_barang.id_barang");

        %>        
        <div class="barang-qty" style="background-color: white;width: 110%; height: 190px; margin-top: -190px; margin-left: 120%; padding-top: 1px; border-radius: 5px;">
            <div style="margin-bottom: 30px; margin-left: 20px; margin-top: 20px;">
                <label style="margin-right: 47px;">Menu</label>
                <select name="id_barang" id="" style="padding-right: 56px;">
                    <option selected>-- Pilih Menu --</option>
                    <%while(rs.next()) {%>
                    <option value="<%=rs.getString("id_barang")%>"><%=rs.getString("nama_barang")%></option> 
                    <%}%>
                </select>
            </div>
            <%
                    rs.close();
                    st.close();
                } catch (SQLException e) {
                    e.getMessage();
                }
            %>

            <div style="margin-bottom: 30px; margin-left: 20px;">
                <label style="margin-right: 60px;">QTY</label>
                <input type="text" name="qtysv" id="qty">
            </div>

<!--            <div>
                <input type="submit" value="Hitung" class="btn btn-primary btn-sm" name="button"style="margin-left: 114px;">
            </div>-->
        </div>

        <div class="total" style=" background-color: white; width: 110%;height: 190px; margin-top: -190px;margin-left: 240%;padding-top: 1px;border-radius: 5px; ">
            <h3 style="margin-left: 140px; margin-top: 20px;">Total</h3>
             <label style="color:black; font-size: 20px; font-weight: bolder; margin-left: 50px">Rp.</label><input name="totalsv" type="text" id="total" style="border: none; color: black; font-size: 20px; font-weight: bolder;">
        </div>
    </div>   


    <div class="container-kedua">
        <div class="bayar" style="background-color: white;width: 120%;height: 190px; margin-top: 20px;padding-top: 1px;border-radius: 5px; ">
            <div style="margin-bottom: 30px; margin-top: 20px;">
                <label style="margin-left: 10px; margin-right: 66px;">Harga</label>
                <input type="text" name="hargasv" id="harga">
            </div>
            <div style="margin-bottom: 30px;">
                <label style="margin-left: 10px; margin-right: 10px;">Uang Pembeli</label>
                <input type="text" name="uangPembelisv" id="uangPembeli">
            </div>

            <div>
                <label style="margin-left: 10px; margin-right: 22px;">Pembayaran</label>
                <select name="pilihPembayaran" id="" style="padding-right: 40px;">
                    <option selected>-- Pilih Metode  --</option>
                    <option value="cash">CASH</option>
                    <option value="debit">DEBIT</option>
                    <option value="gopay">GOPAY</option>
                    <option value="shoppepay">SHOPPEPAY</option>
                    <option value="qris">QRIS</option>
                </select>
            </div>
        </div>

        <div class="tombol-proses-payment" style="width: 110%;height: 190px; margin-top: -140px;margin-left: 130%;padding-top: 1px;border-radius: 5px;">
            <div style="margin-bottom: 20px;">
                <input type="submit" value="Bayar" name="button" class="btn btn-success" onclick="bayar()">
            </div>
        </div>

        <div class="kembalian" style=" background-color: white;width: 110%;height: 190px; margin-top: -240px;margin-left: 240%;padding-top: 1px;border-radius: 5px; ">
            <h3 style="margin-left: 110px; margin-top: 20px;">Kembalian</h3>
            <label style="color:black; font-size: 20px; font-weight: bolder; margin-left: 50px">Rp.</label><input name="kembaliansv" type="text" id="kembalian" style="border: none; color: black; font-size: 20px; font-weight: bolder;">
        </div>
    </div>
</form>
        <div style="position: absolute; margin-left: 120%; margin-top: -75%">
            <input type="button" value="Hitung" class="btn btn-primary btn-sm" onclick="Hitung()" style="margin-left: 114px;">
        </div>
            
        <div style="position: absolute; margin-left: 257px; margin-top: -19%">
            <a href="Transaksi.jsp">
            <input type="button" value="Batal" name="button" class="btn btn-warning" style="margin-left: 194px">
            </a>
        </div>
</section>
<!-- transaksi kasir end -->

<script>
    
    function Hitung(){
        var qty = parseInt(document.getElementById("qty").value);
        var harga = parseInt(document.getElementById("harga").value);
        var uangPembeli = parseInt(document.getElementById("uangPembeli").value);
        var rumusTotal;
        var rumusKembalian;

        if (isNaN(qty) || isNaN(harga) || isNaN(uangPembeli)) {
            alert("Harap masukkan angka yang valid untuk QTY, Harga, dan Uang Pembeli.");
            return;
        }

        rumusTotal = qty * harga;
        rumusKembalian = rumusTotal - uangPembeli;

        document.getElementById("total").value = rumusTotal;
        document.getElementById("kembalian").value = rumusKembalian;
    }
    
    function bayar(){
        alert("Pembayaran Berhasil, Ucapkan Terima Kasih Kepada Customer");
    }
</script>
</body>

</html>
