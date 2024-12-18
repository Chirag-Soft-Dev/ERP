package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customermodel;

@WebServlet("/DeleteCustomer")
public class DeleteCustomer extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int customerId = Integer.parseInt(req.getParameter("customer_id"));
        
        // Delete the customer
        Customermodel.deleteCustomer(customerId);

        // Redirect back to Customers.jsp
        resp.sendRedirect("Customercontroller");
    }
}