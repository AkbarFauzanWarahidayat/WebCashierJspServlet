package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

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
@WebServlet(urlPatterns = {"/editDataCustomerServlet"})
public class editDataCustomerServlet extends HttpServlet {

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
            
            int id_pembeli = Integer.parseInt(request.getParameter("id_pembeli"));
            String editNamaCustomer = request.getParameter("editnama");
            String editAlamatCustomer = request.getParameter("editalamat");
            String editUsiaCustomer = request.getParameter("editusia");
            
            String url = "jdbc:mysql://localhost:3306/db_projectwebkasir";
            String user = "root";
            String pass = "";
            
            Connection koneksi;
            PreparedStatement pst;
            
            try{
                koneksi = DriverManager.getConnection(url,user,pass);
                pst = koneksi.prepareStatement("UPDATE customer SET nama_pembeli=?, alamat=?, usia=? WHERE id_pembeli=?");
                pst.setString(1, editNamaCustomer);
                pst.setString(2, editAlamatCustomer);
                pst.setString(3, editUsiaCustomer);
                pst.setInt(4, id_pembeli);
                pst.execute();
                
                koneksi.close();
                pst.close();
            }
            catch(SQLException e){
                e.printStackTrace();
            }
            
            response.sendRedirect("Customer.jsp");
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet editDataCustomerServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet editDataCustomerServlet at " + request.getContextPath() + "</h1>");
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
