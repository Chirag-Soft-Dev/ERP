package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customermodel;

@WebServlet("/Customercontroller")
public class Customercontroller extends HttpServlet {

	
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        int customerId = req.getParameter("id") != null ? Integer.parseInt(req.getParameter("id")) : 0;

        if ("delete".equals(action) && customerId > 0) {
            
        } else if ("edit".equals(action) && customerId > 0) {
            
        }

        List<Customermodel> customerList = Customermodel.getAllCustomers();
        req.setAttribute("customers", customerList);

        req.getRequestDispatcher("Customers.jsp").forward(req, resp);
    }
	
	
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        // Retrieve form data from the request
        String customerName = req.getParameter("customer_name");
        String totalLifetimeValueStr = req.getParameter("total_lifetime_value");
        String averageOrderValueStr = req.getParameter("average_order_value");
        String customerSegmentCategories = req.getParameter("customer_segment_categories");

        // Parse string to numbers where necessary
        double totalLifetimeValue = Double.parseDouble(totalLifetimeValueStr);
        double averageOrderValue = Double.parseDouble(averageOrderValueStr);

        // Create a new Customermodel object and set its values
        Customermodel customermodel = new Customermodel();
        customermodel.setCustomer_name(customerName);
        customermodel.setTotal_lifetime_value(totalLifetimeValue);
        customermodel.setAverage_order_value(averageOrderValue);
        customermodel.setCustomer_segment_categories(customerSegmentCategories);

        // Call the insertCustomer method to insert the data into the database
        customermodel.insertCustomer();

        // Redirect the user to a confirmation page or back to the customer form
        resp.sendRedirect("Customers.jsp"); // You can change this to the page you want to redirect to
    }
}