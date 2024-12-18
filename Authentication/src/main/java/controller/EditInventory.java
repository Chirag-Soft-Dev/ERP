package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Inventorymodel;

@WebServlet("/EditInventory")
public class EditInventory extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int itemId = Integer.parseInt(req.getParameter("id"));

        Inventorymodel inventory = Inventorymodel.getInventoryById(itemId);
        req.setAttribute("inventory", inventory);

        req.getRequestDispatcher("EditInventory.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int itemId = Integer.parseInt(req.getParameter("itemid"));
        String itemName = req.getParameter("itemname");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        int availableQuantity = Integer.parseInt(req.getParameter("availablequantity"));
        int daysOfSupply = Integer.parseInt(req.getParameter("daysofsupply"));
        double recentSalesTrend = Double.parseDouble(req.getParameter("recentsalestrend"));
        int minimumStockLevel = Integer.parseInt(req.getParameter("minimumstocklevel"));

        // Update inventory details
        Inventorymodel inventory = new Inventorymodel();
        inventory.setItemid(itemId);
        inventory.setItemname(itemName);
        inventory.setQuantity(quantity);
        inventory.setAvailablequantity(availableQuantity);
        inventory.setDaysofsupply(daysOfSupply);
        inventory.setRecentsalestrend(recentSalesTrend);
        inventory.setMinimumstocklevel(minimumStockLevel);
        inventory.updateInventory();

        // Redirect back to Inventory.jsp
        resp.sendRedirect("InventoryController");
    }
}
