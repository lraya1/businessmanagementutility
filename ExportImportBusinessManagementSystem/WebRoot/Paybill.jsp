
<%@page import="com.iebms.util.DateWrapper"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/transitional.dtd">
<html>
	<head>
		<style>
body,td,th {
	color: white;
	;
}

.style9 {
	color: black
}

body {
	background-color: white;
}
</style>

		<title>ExportImportBusinessManagementSystem</title>
		<script type="text/javascript" src="scripts/moveclock.js">
</script>
		<meta http-equiv="Content-Type"
			content="text/html; charset=iso-8859-1" />
	</head>
	<body>
		<table width="750" align="center" bgcolor="white">
			<tr>
				<td>
					<img src="images/goods.jpg" width="780" height="230">
				</td>
			</tr>
			<tr>
				<td bgcolor="skyblue"><jsp:include page="UserOptions.jsp" />
				</td>
			</tr>
			<tr>
				<td>
					<%--<div align="center">--%>
					<%--<table bgcolor="white" width="750" align="center">--%>
					<%--<tr>--%>
					<%--   <td><jsp:include page="Template.html"/></td></tr></table></div>--%>
					<div align="center">
						<table bgcolor="white" width="770" align="center" height="70">
							<tr>
								<td>
									<font color="skyblue"><h1>
											<br>
										</h1>

										<p align="center">
											<center>

												<font color="black"><b> <%
 	String target = "Success1.jsp?status=Invalid Transaction";
 	int creditcardnumber = Integer.parseInt(request
 			.getParameter("Creditcardno"));
 	int amount = Integer.parseInt(request.getParameter("amount"));
 	int cardid = Integer.parseInt(request.getParameter("cardid"));
 	int operatorid = Integer.parseInt(request
 			.getParameter("operatorid"));
// 	int cardnumber = new MobileCardDetailsDao().getCardNumber(cardid);
 	int cardnumber = 0;
/* 	int userid = ((Integer) session.getAttribute("user")).intValue();
 	MobileCardSalesForm form = new MobileCardSalesForm();
 	form.setCardId(cardid);
 	form.setOperatorId(operatorid);
 	form.setUserId(userid);
 	form.setSaleDate(DateWrapper.parseDate(new java.util.Date()));*/
 	/*MobileCardSalesDao adao = new MobileCardSalesDao();
 	boolean flag1 = adao.getCardDetails(creditcardnumber, amount);
 	if (flag1) {
 		boolean flag2 = new MobileCardSalesDao()
 				.updateCardStatus(cardid);
 		if (flag2) {
 			boolean flag = adao.insertMobileCardSales(form);
 			if (flag) {
 				target = "Success1.jsp?status=Your card number is    "
 						+ cardnumber;
 			}
 		}
 	}*/
 	RequestDispatcher rd = request.getRequestDispatcher(target);
 	rd.forward(request, response);
 %> </b>
												</font>




											</center>
								</td>
							</tr>
						</table>
						<p>
							&nbsp;
						</p>
						<p>
							&nbsp;
						</p>
						<p>
							&nbsp;
						</p>

						<p>
							&nbsp;
						</p>
						<p>
							&nbsp;
						</p>
						<p>
							&nbsp;
						</p>

						<p>
							&nbsp;
						</p>



						<p>
							&nbsp;
						</p>
					</div>
	</body>
</html>