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
@WebServlet(name = "SupplierTambahServlet", urlPatterns = {"/SupplierTambahServlet"})
public class SupplierTambahServlet extends HttpServlet {

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
            
            String noFaktur = request.getParameter("noFaktur");
            String namaSupplier = request.getParameter("namaSupplier");
            String jenisBarang = request.getParameter("jenisBarang");
            int jumlahBarang = Integer.parseInt(request.getParameter("jumlahBarang"));
            
            String url = "jdbc:mysql://localhost:3306/db_projectwebkasir";
            String username = "root";
            String password = "";
            
            Connection koneksi;
            PreparedStatement pst;
            
            try{
                
                koneksi = DriverManager.getConnection(url,username,password);
                pst = koneksi.prepareStatement("INSERT INTO supplier(no_faktur, nama_supplier, jenis_barang, jumlah_barang) VALUES(?,?,?,?)");
                
                pst.setString(1, noFaktur);
                pst.setString(2, namaSupplier);
                pst.setString(3, jenisBarang);
                pst.setInt(4, jumlahBarang);
                pst.execute();   
                
                koneksi.close();
                pst.close();
            }
            catch(SQLException e){
                e.getMessage();
                e.getStackTrace();
            }
            
            response.sendRedirect("Supplier.jsp");
         
            
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
