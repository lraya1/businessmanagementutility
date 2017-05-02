<%@page import="com.iebms.dao.GoodsDetailsDao"%>
<%@page import="com.yourcompany.struts.form.GoodsDetailsForm"%>
<%@page import="com.iebms.dao.GoodsMasterDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.GoodsMasterForm"%>
<%@page import="com.iebms.dao.CountryMasterDao"%>
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
				<td bgcolor="skyblue">
					<jsp:include page="Adminoptions.jsp" />
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
											<h2>
												<font color="black">Update Goods Details</font>
											</h2>

											<%
												String storepath = request.getRealPath("/images");
												int id = Integer.parseInt(request.getParameter("Id"));
												GoodsDetailsDao dao = new GoodsDetailsDao();
												GoodsDetailsForm form = dao.ViewGoodsDetailsById(storepath, id);
												String countryname = new CountryMasterDao().getCountryName(form
														.getCountryId());
											%>
											<form action="updateGoodsDetailsAction.do"
												method="register">
												<table align="center" bgcolor="white">
													<tr>
														<td>
															<font color="black"><b>Country Name: </b>
															</font>
														</td>
														<td>
															<select name="countryId">
																<option value="<%=form.getCountryId()%>"><%=countryname%></option>

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
															<font color="black"><b>Goods Name :</b>
														</td>
														<td>
															<select name="goodsId">
																<option value="<%=form.getGoodsId()%>"><%=new GoodsMasterDao().getGoodsName(form.getGoodsId())%></option>

																<%
																	GoodsMasterDao dao2 = new GoodsMasterDao();
																	CoreList cl2 = dao2.ViewGoodsMaster();
																	Enumeration en2 = cl2.elements();
																	while (en2.hasMoreElements()) {
																		GoodsMasterForm form2 = (GoodsMasterForm) en2.nextElement();
																%>
																<option value="<%=form2.getGoodsId()%>"><%=form2.getGoodsName()%></option>
																<%
																	}
																%>
															</select>
														</td>
													</tr>

													<input type="hidden" name="itemId" value="<%=id%>" />
													<tr>
														<td>
															<font color="black"><b>Price :</b>
															</font>
														</td>
														<td>
															<input type=text name="price"
																value="<%=form.getPrice()%>" />
														</td>
													</tr>
													<tr>
														<td>
															<font color="black"><b>Goods Name :</b>
															</font>
														</td>
														<td>
															<input type=text name="itemName"
																value="<%=form.getItemName()%>" />
														</td>
													</tr>
													<tr>
														<td>
															<font color="black"><b>Goods Desc :</b>
															</font>
														</td>
														<td>
															<input type=text name="itemDesc"
																value="<%=form.getItemDesc()%>" />
														</td>
													</tr><!--
													<%
														String realpath = request.getRealPath("/images");
														System.out.println("realpath" + realpath + "/"
																+ form.getItemImage());
														System.out.println("realpath" + realpath + "/"
																+ form.getItemLaunchVideo());
													%>

													<tr>
														<td>
															<font color="black"><b>Item Launch Video </b>
															</font>
														</td>
														<td>
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<input type=file name="itemImage" />
														</td>
													</tr>
													<input type="hidden" name="itemImage1"
														value="<%=realpath + "/" + form.getItemImage()%>" />
													<input type="hidden" name="itemlanuch1"
														value="<%=realpath + "/" + form.getItemLaunchVideo()%>" />

													<tr>
														<td>
															<font color="black"><b>ItemImage :/b>
															</font>
														</td>
														<td>
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<input type=file name="itemLaunchVideo" />
														</td>
													</tr>
													--><tr>
														<td>
															<font color="black"><b>ItemRegDate : </b>
															</font>
														</td>
														<td>
															<input type=text name="itemRegDate"
																value="<%=form.getItemRegDate()%>" readonly />
														</td>
													</tr>
													<tr>
														<td></td>
														<td>
															<input type=submit name="Update" value="Update" />
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