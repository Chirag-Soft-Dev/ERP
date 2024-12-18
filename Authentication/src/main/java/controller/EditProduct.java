package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductModel;



@WebServlet("/EditProduct")
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    try {
	        // Parse product ID from request parameter
	        String productIdParam = req.getParameter("id");

	        // Validate if the 'id' parameter is present and valid
	        if (productIdParam == null || productIdParam.isEmpty()) {
	            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Product ID is required");
	            return;
	        }

	        int productId = Integer.parseInt(productIdParam);

	        // Fetch product details for the given ID
	        ProductModel product = ProductModel.getProductById(productId);

	        // Check if the product exists
	        if (product == null) {
	            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
	            return;
	        }

	        // Set product as request attribute and forward to JSP
	        req.setAttribute("product", product);
	        req.getRequestDispatcher("EditProduct.jsp").forward(req, resp);

	    } catch (NumberFormatException e) {
	        // Handle invalid ID format
	        resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Product ID format");
	    } catch (Exception e) {
	        // Log and handle unexpected errors
	        e.printStackTrace();
	        resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred");
	    }
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        
		int productId = Integer.parseInt(req.getParameter("product_id"));
        String productname = req.getParameter("productname");
        String description = req.getParameter("description");
        String category = req.getParameter("category");
        double price = Double.parseDouble(req.getParameter("price"));
        int stocklevel = Integer.parseInt(req.getParameter("stocklevel"));


        // Update customer details        
        ProductModel product = new ProductModel();
        product.setProductid(productId);
        product.setProductname(productname);
        product.setDescription(description);
        product.setCategory(category);
        product.setPrice(price);
        product.setStocklevel(stocklevel);

        product.updateProduct();


        // Redirect back to Customers.jsp
        resp.sendRedirect("ProductController");
    }
    

}
