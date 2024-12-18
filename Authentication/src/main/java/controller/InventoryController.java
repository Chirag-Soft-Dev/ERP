package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Inventorymodel;

@WebServlet("/InventoryController")
public class InventoryController extends HttpServlet {

    
    
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      

        req.getRequestDispatcher("Inventory.jsp").forward(req, resp);
    }

 
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve form data from the request
        String itemname = req.getParameter("itemname");
        String quantityStr = req.getParameter("quantity");
        String availableQuantityStr = req.getParameter("availablequantity");
        String daysOfSupplyStr = req.getParameter("daysofsupply");
        double recentSalesTrend = Double.parseDouble(req.getParameter("recentsalestrend"));
        String minimumStockLevelStr = req.getParameter("minimumstocklevel");
       
        // Parse string to integers where necessary
        int quantity = Integer.parseInt(quantityStr);
        int availableQuantity = Integer.parseInt(availableQuantityStr);
        int daysOfSupply = Integer.parseInt(daysOfSupplyStr);
        int minimumStockLevel = Integer.parseInt(minimumStockLevelStr);

        // Create a new InventoryModel object and set its values
        Inventorymodel inventory = new Inventorymodel();
        inventory.setItemname(itemname);
        inventory.setQuantity(quantity);
        inventory.setAvailablequantity(availableQuantity);
        inventory.setDaysofsupply(daysOfSupply);
        inventory.setRecentsalestrend(recentSalesTrend);
        inventory.setMinimumstocklevel(minimumStockLevel);

        String action = req.getParameter("action");

        if ("update".equals(action)) {
            // Update inventory item
            inventory.updateInventory();
        } else {
            // Insert new inventory item
            inventory.insertInventory();
        }

        // Redirect the user to the inventory list page
        resp.sendRedirect("Inventory.jsp");
    }
}
