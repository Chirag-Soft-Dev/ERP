	package controller;
	
	import java.io.IOException;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	
	import model.RegisterModel;
	
	@WebServlet("/RegisterController")
	public class RegisterController extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String fname = request.getParameter("fname");
	        String email = request.getParameter("email");
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	
	        RegisterModel user = new RegisterModel();
	        user.setFname(fname);
	        user.setEmail(email);
	        user.setUsername(username);
	        user.setPass(password);
	                
	        RegisterModel model  = new RegisterModel();
	        boolean isRegistered = model.registerUser(user);
	
	        if (isRegistered) {
	            response.sendRedirect("regisucc.jsp");
	        } else {
	            response.sendRedirect("errorpage.jsp");
	        }
	}
	}
