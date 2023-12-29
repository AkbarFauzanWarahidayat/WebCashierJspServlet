/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 *
 * @author ASUS
 */
@WebServlet(name = "perhitunganTransaksi", urlPatterns = {"/perhitunganTransaksi"})
public class perhitunganTransaksi extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String kasir = request.getParameter("kasir");
            int idPembeli = Integer.parseInt(request.getParameter("id_pembeli"));
            int idBarang = Integer.parseInt(request.getParameter("id_barang"));
            int qtysv = Integer.parseInt(request.getParameter("qtysv"));
            int hargasv = Integer.parseInt(request.getParameter("hargasv"));
            int uangPembelisv = Integer.parseInt(request.getParameter("uangPembelisv"));
            int totalsv = Integer.parseInt(request.getParameter("totalsv"));
            int kembaliansv = Integer.parseInt(request.getParameter("kembaliansv"));
            String pilihPembayaran = request.getParameter("pilihPembayaran");


                String url = "jdbc:mysql://localhost:3306/db_projectwebkasir";
                String user = "root";
                String password = "";
                
                Connection koneksi;
                PreparedStatement pst;
               
                
                try{
                    koneksi = DriverManager.getConnection(url,user,password);
                    pst = koneksi.prepareStatement("INSERT INTO transaksi(id_pembeli, kasir, id_barang, qty, harga, uang_masuk_pembeli, metode_pembayaran, total, kembalian) VALUES (?,?,?,?,?,?,?,?,?)");
                    pst.setInt(1, idPembeli);
                    pst.setString(2, kasir);
                    pst.setInt(3, idBarang);
                    pst.setInt(4, qtysv);
                    pst.setInt(5,hargasv);
                    pst.setInt(6, uangPembelisv);
                    pst.setString(7, pilihPembayaran);
                    pst.setInt(8, totalsv);
                    pst.setInt(9, kembaliansv);
                    pst.execute();
                    
                    koneksi.close();
                    pst.close();
                }catch(SQLException e){
                    e.printStackTrace();
                }
                
                response.sendRedirect("Transaksi.jsp");
                
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet perhitunganTransaksi</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet perhitunganTransaksi at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
