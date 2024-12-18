<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.SalesModel" %>
<%@ page import="dao.SalesDAO" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Sales List</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style type="text/css">
body {
	font-family: "Montserrat", sans-serif;
}

.bgcolor-teal-dark {
	background-color: #006666;
	color: #fefefe;
}

.bgcolor-orange-dark {
	background-color: #f05e16;
	color: #fefefe;
}

.ibm-plex-mono-regular {
	font-family: "IBM Plex Mono", monospace;
	font-weight: 400;
	font-style: normal;
}

.ibm-plex-mono-bold, th {
	font-family: "IBM Plex Mono", monospace;
	font-weight: 700;
	font-style: normal;
}

.fixed-width-actions {
	width: 150px;
	white-space: nowrap;
}

.fixed-width-status {
	width: 200px;
	text-align: center;
}
</style>
</head>
<body style="background-color: #efefef">
	<div class="container mt-4">
		<h1 class="ibm-plex-mono-regular mb-4 text-black-50">Sales List</h1>

		<div class="d-flex justify-content-between mb-3">
			<!-- Add New Sale Button -->
			<a href="sales_add.jsp" class="ibm-plex-mono-regular btn bgcolor-teal-dark rounded-pill">
				<i class="bi bi-plus-lg"></i> Add New Sale
			</a>  <a href="home.jsp" class="ibm-plex-mono-regular btn bgcolor-teal-dark rounded-pill">
				Back
			</a>
		</div>

		<div class="container rounded-3 bg-white">
			<table class="table table-borderless">
				<thead class="thead-light">
					<tr>
						<th>Sales Person</th>
						<th>Target</th>
						<th>Units</th>
						<th>Units Sold</th>
						<th class="fixed-width-status text-start">Status</th>
						<th class="fixed-width-actions">Actions</th>
					</tr>
				</thead>

				<%
				SalesDAO salesDAO = new SalesDAO();
				List<SalesModel> salesList = salesDAO.getAllSales();
				%>

				<tbody>
					<%
					if (salesList != null && !salesList.isEmpty()) {
						for (SalesModel sale : salesList) {
					%>

					<tr>
						<td class="align-middle"><%=sale.getSalesPersonName()%></td>
						<td class="align-middle"><%=sale.getTarget()%></td>
						<td class="align-middle"><%=sale.getNumberOfUnits()%></td>
						<td class="align-middle"><%=sale.getNumberOfUnitsSold()%></td>
						<td class="align-middle">
							<span class="rounded-pill px-3 py-1 <%= sale.getCompletionStatus().equals("Pending") ? "bg-warning" : "bg-success text-light" %>">
								<%=sale.getCompletionStatus()%>
							</span>
						</td>
						<td class="align-middle fixed-width-actions">
							<a href="sales_update.jsp?salesID=<%=sale.getSalesID()%>" class="btn btn-sm bgcolor-orange-dark rounded">Edit</a>
							<a href="DeleteSalesEntry?salesID=<%=sale.getSalesID()%>" class="btn btn-sm btn-danger rounded">Delete</a>
						</td>
					</tr>

					<%
					} // END for
					} else {
					%>
					<tr>
						<td colspan="6" class="text-center">No sales records available.</td>
					</tr>
					<%
					} // END else
					%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>