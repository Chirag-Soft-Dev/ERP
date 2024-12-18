package controller;


import model.ProductModel;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.util.List;

@WebServlet("/ProductController")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Handle GET requests
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Get all products or a specific product based on action
        if (action != null && action.equals("view")) {
            try {
                int productId = Integer.parseInt(request.getParameter("productid"));
                ProductModel product = ProductModel.getProductById(productId);
                request.setAttribute("product", product);
                request.getRequestDispatcher("/Product.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("errorPage.jsp");
            }
        } else {
            List<ProductModel> products = ProductModel.getAllProducts();
            request.setAttribute("products", products);
            request.getRequestDispatcher("/Product.jsp").forward(request, response);
        }
    }

    // Handle POST requests for inserting and updating products
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
            String productname = request.getParameter("productname");	
            String description = request.getParameter("description");
            String category = request.getParameter("category");
            double price = Double.parseDouble(request.getParameter("price"));
            int stocklevel = Integer.parseInt(request.getParameter("stocklevel"));

            ProductModel product = new ProductModel();
            product.setProductname(productname);
            product.setDescription(description);
            product.setCategory(category);
            product.setPrice(price);
            product.setStocklevel(stocklevel);

            product.insertProduct();
            
            response.sendRedirect("Product.jsp");
                           
    }

}
