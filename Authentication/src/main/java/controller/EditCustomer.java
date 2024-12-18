package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customermodel;

@WebServlet("/EditCustomer")
public class EditCustomer extends HttpServlet {

   
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int customerId = Integer.parseInt(req.getParameter("id"));
        
        // Fetch customer details for the given ID
        Customermodel customer = Customermodel.getCustomerById(customerId);
        req.setAttribute("customer", customer);

        // Forward to EditCustomer.jsp
        req.getRequestDispatcher("EditCustomer.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int customerId = Integer.parseInt(req.getParameter("customer_id"));
        String customerName = req.getParameter("customer_name");
        double totalLifetimeValue = Double.parseDouble(req.getParameter("total_lifetime_value"));
        double averageOrderValue = Double.parseDouble(req.getParameter("average_order_value"));
        String customerSegmentCategories = req.getParameter("customer_segment_categories");

        // Update customer details
        Customermodel customer = new Customermodel();
        customer.setCustomerId(customerId);
        customer.setCustomer_name(customerName);
        customer.setTotal_lifetime_value(totalLifetimeValue);
        customer.setAverage_order_value(averageOrderValue);
        customer.setCustomer_segment_categories(customerSegmentCategories);
        customer.updateCustomer();

        // Redirect back to Customers.jsp
        resp.sendRedirect("Customercontroller");
    }
}