package com.uniqueddeveloper.registration;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*** Servlet implementation class Delete */
@WebServlet("/delete")
public class Delete extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    // Handle GET requests
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect to the delete.jsp page (or any other page as needed)
        response.sendRedirect("delete.jsp");
    }

    // Handle POST requests
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String uemail = request.getParameter("username");
        String upwd = request.getParameter("password");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
        
        // Check if the email is valid
        if(uemail == null || uemail.equals("")) {
            request.setAttribute("status", "invalidEmail");
            dispatcher = request.getRequestDispatcher("delete.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Check if the password is valid
        if(upwd == null || upwd.equals("")) {
            request.setAttribute("status", "invalidUpwd");
            dispatcher = request.getRequestDispatcher("delete.jsp");
            dispatcher.forward(request, response);
            return;
        }
        
        try {
            // Establish the database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userregistration?useSSL=false","YOUR_USERNAME","YOUR_PASSWORD");

            // Create the SQL statement to delete user
            PreparedStatement pst = con.prepareStatement("DELETE FROM users WHERE uemail = ? AND upwd = ?");
            pst.setString(1, uemail);
            pst.setString(2, upwd);
            
            int rowCount = pst.executeUpdate();  
            // Execute update for deletion
            // Check if any row is deleted
            if (rowCount > 0) {
                session.setAttribute("email", uemail);
                session.setAttribute("password", upwd);
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }
            // Forward the request back to the JSP page
            dispatcher = request.getRequestDispatcher("delete.jsp");
            dispatcher.forward(request, response);
            } 
            catch (Exception e) {
                e.printStackTrace();
        }
    }
}
