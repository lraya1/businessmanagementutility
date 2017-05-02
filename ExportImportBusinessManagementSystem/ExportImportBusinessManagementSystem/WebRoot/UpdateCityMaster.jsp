<%@page import="com.iebms.dao.CityMasterDao"%>
<%@page import="com.yourcompany.struts.form.CityMasterForm"%>
<%@page import="com.iebms.dao.CountryMasterDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.CountryMasterForm"%>

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
				<td bgcolor="skyblue"><jsp:include page="./Header.jsp" /></td>
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
												<h2>
													<font color="black"> Update City Details</font>
												</h2>
												<%
													String storepath = request.getRealPath("/images");
													int id = Integer.parseInt(request.getParameter("Id"));
													CityMasterDao dao = new CityMasterDao();
													CityMasterForm form = dao.ViewCityMasterById(storepath, id);
													//String countryname=form.getCountryname();
												%>
												<form action="updateCityAction.do">
													<table align="center" bgcolor="white">
														<tr>
															<td>
																<font color="black"><strong>Country Name
																		:</strong>
																</font>
															</td>
															<td>
																<select name="countryId">
																	<option value="<%=form.getCountryId()%>"><%=form.getCountryname()%></option>
																	<%
																		CountryMasterDao dao1 = new CountryMasterDao();
																		CoreList cl1 = dao1.ViewCountryMaster(storepath);
																		Enumeration en1 = cl1.elements();
																		while (en1.hasMoreElements()) {
																			CountryMasterForm form1 = (CountryMasterForm) en1.nextElement();
																	%>
																	<option value="<%=form1.getCountryId()%>"><%=form1.getCountryName()%></option>
																	<%
																		}
																	%>
																</select>
															</td>
														</tr>
														<tr>
															<td>
																<font color="black"><strong>City Name :
																</strong>
																</font>
															</td>
															<td>
																<input type=text name="cityName"
																	value="<%=form.getCityName()%>" />
															</td>
														</tr>
														<tr>
															<td>
															</td>
															<td>
																<input type="hidden" name="cityId" value=<%=id%>>
															</td>
														</tr><!--
														<tr>
															<td>
																<font color="black"><strong>City Map :</strong>
																</font>
															</td>
															<td>
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																<input type=file name="cityMap" />
															</td>
														</tr>
														<%
															String realpath = request.getRealPath("/images");
															System.out.println("realpath" + realpath + "/" + form.getCityMap());
														%>
														<input type="hidden" name="cityMap1"
															value="<%=realpath + "/" + form.getCityMap()%>" />


														--><tr>
															<td>
																<font color="black"><strong>Description
																		:</strong>
																</font>
															</td>
															<td>
																<input type=text name="description"
																	value="<%=form.getDescription()%>" />
															</td>
														</tr>
														<tr>
															<td>
																<font color="black"><strong>Abbrivation
																		:</strong>
																</font>
															</td>
															<td>
																<input type=text name="abbr"
																	value="<%=form.getDescription()%>" />
															</td>
														</tr>

														<tr>
															<td></td>
															<td>
																<input type=submit name="Register" value="update" />
															</td>
														</tr>
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