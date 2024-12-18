package controller;

import dao.SalesDAO;
import model.SalesModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/SalesController")
public class SalesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SalesDAO salesDAO;

    @Override
    public void init() {
        salesDAO = new SalesDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("sales_list.jsp").forward(request, response);
    }
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Retrieve form parameters from sales_entry_editor.jsp
        String salesIDParam = request.getParameter("salesID");
        String salesPersonName = request.getParameter("salesPersonName");
        int target = Integer.parseInt(request.getParameter("target"));
        int numberOfUnits = Integer.parseInt(request.getParameter("numberOfUnits"));
        int numberOfUnitsSold = Integer.parseInt(request.getParameter("numberOfUnitsSold"));
        String completionStatus = request.getParameter("completionStatus");

        SalesModel sale = new SalesModel();
        sale.setSalesPersonName(salesPersonName);
        sale.setTarget(target);
        sale.setNumberOfUnits(numberOfUnits);
        sale.setNumberOfUnitsSold(numberOfUnitsSold);
        sale.setCompletionStatus(completionStatus);

        // Add new sale (salesID is null or empty)
        if (salesIDParam == null || salesIDParam.isEmpty()) {
            salesDAO.insertSale(sale);
        } else {
        	// Update existing sale
            sale.setSalesID(Integer.parseInt(salesIDParam));
            salesDAO.updateSale(sale);
        }

        // Redirect back to the sales list page after adding/updating
        response.sendRedirect("SalesController");
    }
}