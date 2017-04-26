<%@page import="com.iebms.dao.GoodsDetailsDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.GoodsDetailsForm"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/transitional.dtd">
<html>
	<head>
		<style>
body,td,th {
	color: white;
	;
}

body {
	background-color: white;
}

.style3 {
	color: black
}
</style>

		<title>ImportExportBusinessManagementSystem</title>
		<script type="text/javascript" src="scripts/moveclock.js">
</script>
		<script type="text/javascript" src="scripts/moveclock.js">
</script>

		<script language="JavaScript" src="scripts/gen_validatorv31.js"
			type="text/javascript">
</script>
		<script language="JavaScript" type="text/javascript"
			src="scripts/ts_picker.js">
</script>
		<script language="JavaScript1.1" src="scripts/pass.js">

</script>
		<script type="text/javascript" src="scripts/image.js">
</script>
		<script type="text/javascript" src="scripts/general.js">
</script>
		<script type="text/javascript" src="scripts/adi.js">
</script>
		<script type="text/javascript" src="scripts/form_validation.js">
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
				<td bgcolor="skyblue"><jsp:include page="Adminoptions.jsp" /></td>
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

										<p align="center" class="style3">
											<center class="style3">

												<%
													if (request.getParameter("status") != null) {
												%>
												<%=request.getParameter("status")%>
												<%
													}
												%>
												<h2>
													<font color="black"><b>View Goods Details</b>
													</font>
												</h2>
												<form action="deleteGoodsDetailsAction.do" name="register">
													<%
														try {

															GoodsDetailsDao dao = new GoodsDetailsDao();
															CoreList cl = (CoreList) request
																	.getAttribute("viewGoodsDetails");
															Enumeration en = cl.elements();
													%>
													<table align="center" border=1>
														<tr bgcolor="skyblue">
															<td colspan=2>
																<div align="center">
																	<strong>Country Name</strong>
																</div>
															</td>
															<td>
																<div align="center">
																	<strong>Goods Name</strong>
																</div>
															</td>

															<td>
																<div align="center">
																	<strong>Item Name</strong>
																</div>
															</td>
															<td>
																<div align="center">
																	<strong>ItemRegDate</strong>
																</div>
															</td>

															<td>
																<div align="center">
																	<strong>Item Img</strong>
																</div>
															</td>
															<td>
																<div align="center">
																	<strong>Item Video</strong>
																</div>
															</td>
															<td>
																<div align="center">
																	<strong>Item Desc</strong>
																</div>
															</td>
															<td>
																<div align="center">
																	<strong>Price</strong>
																</div>
															</td>
														</tr>
														<%
															while (en.hasMoreElements()) {
																	GoodsDetailsForm form = (GoodsDetailsForm) en.nextElement();
														%>
														<tr bgcolor="white">
															<td>
																<input name="TypeId" type=checkbox
																	value="<%=form.getItemId()%>">
															</td>
															<td>
																<span class="style3"><strong><%=form.getCountryname()%></strong>
																</span>
															</td>
															<td>
																<span class="style3"><strong><%=form.getGoodsName()%></strong>
																</span>
															</td>
															<td>
																<a
																	href="UpdategoodsDetails.jsp?Id=<%=form.getItemId()%>"
																	class="style3"><strong><u><%=form.getItemName()%></u>
																</strong>
																</a>
															</td>
															<td>
																<span class="style3"><strong><%=form.getItemRegDate()%></strong>
																</span>
															</td>
															<td>
																<img src="images/<%=form.getItemImage()%>" width=50
																	height=50>
															</td>
															<td>
																<span class="style3"><strong><a
																		href="AdminWindowsMediaPlayer.jsp?videofile=<%=form.getItemLaunchVideo()%>">Play</a>
																</strong>
																</span>
															</td>
															<td>
																<span class="style3"><strong><%=form.getItemDesc()%></strong>
																</span>
															</td>
															<td>
																<span class="style3"><strong><%=form.getPrice()%></strong>
																</span>
															</td>
														</tr>
														<%
															}
															} catch (Exception e) {
																e.printStackTrace();
															}
														%>
													</table>
													<center>
														<input type=submit name="Delete" value="Delete">
													</center>
												</form>
												<script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
var frmvalidator = new Validator("register");
frmvalidator.addValidation("TypeId", "req", "Please select a TypeId");
</script>
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