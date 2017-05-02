<%@page import="com.iebms.dao.CityMasterDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.CityMasterForm"%>


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

.style1 {
	color: white;
	font-weight: bold;
}

.style2 {
	color: black
}
</style>

		<title>ImportExportBusinessManagementSystem</title>
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
				<td bgcolor="skyblue">
					<jsp:include page="./Header.jsp" />
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

										<p align="center" class="style3">


											<p>
												&nbsp;
											</p>
											<p>
												&nbsp;
											</p>
											<p>
												&nbsp;
											</p>
											<p align="center">





												<center>
													<h3>
														<font color="black"><strong>View Profits
																Details</strong>
														</font>
													</h3>

													<form action="deleteCityAction.do" method="post">
														<%
															if (request.getParameter("status") != null) {
														%>
														<%=request.getParameter("status")%>
														<%
															}
														%>
														<%
															try {
																CoreList cl = (CoreList) request.getAttribute("viewCitys");
																Enumeration en = cl.elements();
														%>
														<table align="center" border=1>
															<tr bgcolor="white">
																<td>
																	<div align="center" class="style2">
																		<strong><font color="black"><strong>Year
																			</strong>
																		</font>
																		</strong>
																	</div>
																</td>
																<td>
																	<div align="center" class="style2">
																		<strong><font color="black"><strong>Percentage</strong>
																		</font>
																		</strong>
																	</div>
																</td>
																<!--<td>
																	<div align="center" class="style2">
																		<strong><font color="black"><strong>CityMap</strong>
																		</font>
																		</strong>
																	</div>
																</td>
																--><!--<td>
																	<div align="center" class="style2">
																		<strong><font color="black"><strong>Desc</strong>
																		</font>
																		</strong>
																	</div>
																</td>
																<td>
																	<div align="center" class="style2">
																		<strong><font color="black"><strong>CountryName</strong>
																		</font>
																		</strong>
																	</div>
																</td>
															--></tr>
															<%
																while (en.hasMoreElements()) {
																		CityMasterForm form = (CityMasterForm) en.nextElement();
															%>
															<tr bgcolor="skyblue">
																 
																<td>
																	<span class="style1"><font color="black">20<%=form.getPyear()%></font>
																	</span>
																</td>
																<td>
																	<span class="style1"><font color="black"><%=form.getPper()%>%</font>
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
													</form>
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