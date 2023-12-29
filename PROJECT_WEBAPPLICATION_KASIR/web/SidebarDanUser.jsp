<%-- 
    Document   : Sidebar
    Created on : Nov 26, 2023, 12:25:48 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="style/style.css">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />
    <title>Esfit</title>
</head>
<body>
    <!-- sidebar -->
    <div>
        <div class="sidebar p-4" style="background-color: rgb(29, 29, 29);">
            <div class="mb-5">
                <a href="#" class="text-white">
                    <h1>Esfit.</h1>
                </a>
            </div>
             <div class="mb-4">
                 <a href="dashboard.jsp" class="text-white">
                    <i class="bi bi-speedometer"></i>
                    Dashboard
                </a>
            </div>
            <hr style="color: white;">
            <div class="mb-4">
                <a href="Transaksi.jsp" class="text-white">
                    <i class="bi bi-cart-plus"></i>
                    Transaksi Kasir
                </a>
            </div>
            <div class="mb-4">
                <a href="history.jsp" class="text-white">
                    <i class="bi bi-clock-history"></i>
                    History Transaksi
                </a>
            </div>
            <hr style="color: white;">
            <div class="mb-4">
                <a href="Supplier.jsp" class="text-white">
                    <i class="bi bi-boxes"></i>
                    Supplier
                </a>
            </div>
            <div class="mb-4">
                <a href="stokBarang.jsp" class="text-white">
                    <i class="bi bi-archive mr-4"></i>
                    Stok Barang
                </a>
            </div>
            <div class="mb-4">
                <a href="Customer.jsp" class="text-white">
                    <i class="bi bi-people"></i>
                    Customer
                </a>
            </div>
            <div class="mb-4">
                <a href="login.jsp" class="text-white">
                    <i class="bi bi-door-open"></i>
                    Logout
                </a>
            </div>
        </div>
    </div>
    <!-- sidebar end -->

    <!-- content main -->
    
    <!-- akun -->
    <%
        String namasesi = (String)session.getAttribute("namasesi");
     
    %>
    <section>
        <div class="container-akun">
            <div style="margin-left:84%;" class="nama-user">
                <label style="margin-top: 3px;">hi, <%=namasesi%></label> <i class="bi bi-person-circle"></i>
            </div>
        </div>
    </section>
    <!-- akun end -->
