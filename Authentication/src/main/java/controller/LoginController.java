package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.RegisterModel;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RegisterModel model = new RegisterModel();
        String username = request.getParameter("username");
        String password = request.getParameter("pass");
        
        boolean isValidUser = model.validateUserCredentials(username, password);
        
        if (isValidUser) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username); 
            response.sendRedirect("logsuccess.jsp");
        } else {
            response.sendRedirect("errorpage.jsp");
        }
    }

    
}
