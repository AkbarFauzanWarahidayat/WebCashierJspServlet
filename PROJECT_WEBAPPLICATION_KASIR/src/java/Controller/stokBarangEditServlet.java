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
@WebServlet(name = "stokBarangEditServlet", urlPatterns = {"/stokBarangEditServlet"})
public class stokBarangEditServlet extends HttpServlet {

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
            
            int idStok = Integer.parseInt(request.getParameter("idStok"));
            String kdBarang = request.getParameter("kdBarang");
            String namaBarang = request.getParameter("namaBarang");
            int qty = Integer.parseInt(request.getParameter("qty"));
            String hargaSatuan = request.getParameter("hargaSatuan");
            int id_Supplier = Integer.parseInt(request.getParameter("id_Supplier"));
            
            String url = "jdbc:mysql://localhost:3306/db_projectwebkasir";
            String username = "root";
            String password = "";
            
            
            Connection koneksi;
            PreparedStatement pst;
            
            try {
            koneksi = DriverManager.getConnection(url,username, password);
            pst = koneksi.prepareStatement("UPDATE stok_barang SET kd_barang=?, nama_barang=?, qty=?, harga_satuan=?, id_supplier=? WHERE id_barang=?");
            pst.setString(1, kdBarang);
            pst.setString(2, namaBarang);
            pst.setInt(3, qty);
            pst.setString(4, hargaSatuan);
            pst.setInt(5, id_Supplier);
            pst.setInt(6, idStok);
            pst.execute();
            }
            catch(SQLException e){
                e.getMessage();
            }
            
            response.sendRedirect("stokBarang.jsp");
            
            
            
            
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet stokBarangEditServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet stokBarangEditServlet at " + request.getContextPath() + "</h1>");
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
