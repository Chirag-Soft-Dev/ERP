package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SalesDAO;


@WebServlet("/DeleteSalesEntry")
public class DeleteSalesEntry extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String salesID = request.getParameter("salesID");
		if (salesID != null) {
			new SalesDAO().deleteSale(Integer.parseInt(salesID));
		}		
		response.sendRedirect("SalesController");
	}
}
