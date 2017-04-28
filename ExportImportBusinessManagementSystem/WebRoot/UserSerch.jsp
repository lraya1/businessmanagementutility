
<%@page import="com.iebms.dao.CountryMasterDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.CountryMasterForm"%>
<%@page import="com.iebms.dao.GoodsMasterDao"%>
<%@page import="com.yourcompany.struts.form.GoodsMasterForm"%>
<%@page import="com.iebms.dao.GoodsDetailsDao"%>
<%@page import="com.yourcompany.struts.form.GoodsDetailsForm"%>
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
		<title>EPost- Office</title>
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

									<font color="skyblue"><h1></h1>

										<p align="center">
											<center>
												<form action="UserSerch.jsp">
													<table>
														<tr>
															<td>
																<font color="black"><strong>Country Name</strong>
																</font>
															</td>
															<td>
																<select name="countryid">
																	<option value="--Select Any One---">
																		--Select Any One---
																	</option>
																	<%
																		CountryMasterDao aMasterDao = new CountryMasterDao();
																		CoreList acorelist = aMasterDao.ViewCountryIDs();
																		Enumeration aEnumeration = acorelist.elements();
																		while (aEnumeration.hasMoreElements()) {
																			CountryMasterForm aform = (CountryMasterForm) aEnumeration
																					.nextElement();
																	%>
																	<option value="<%=aform.getCountryId()%>"><%=aform.getCountryName()%>
																	</option>
																	<%
																		}
																	%>
																</select>
															</td>
															<td>
																<font color="black"><strong>Goods Name</strong>
																</font>
															</td>
															<td>
																<select name="Goodsid">
																	<option value="--Select Any One---">
																		--Select Any One---
																	</option>
																	<%
																		GoodsMasterDao aGoodsDao = new GoodsMasterDao();
																		CoreList acorelist1 = aGoodsDao.ViewGoodsMaster();
																		Enumeration aEnumeration1 = acorelist1.elements();
																		while (aEnumeration1.hasMoreElements()) {
																			GoodsMasterForm aform = (GoodsMasterForm) aEnumeration1
																					.nextElement();
																	%>
																	<option value="<%=aform.getGoodsId()%>"><%=aform.getGoodsName()%>
																	</option>
																	<%
																		}
																	%>
																</select>
															</td>
														</tr>

														<tr>
															<td></td>
															<td></td>
															<td>
																<input type="submit" name="submit" value="search" />
															</td>
														</tr>
														<tr>
															<td></td>
															<td></td>
														</tr>
														<tr>
															<td></td>
															<td></td>
														</tr>
														<tr>
															<td></td>
															<td></td>
														</tr>
														<tr>
															<td></td>
															<td></td>
														</tr>
														<tr>
															<td></td>
															<td></td>
														</tr>
														<tr>
															<td></td>
															<td></td>
														</tr>
														<tr>
															<td></td>
															<td></td>
														</tr>
														<tr>
															<td></td>
															<td></td>
														</tr>
														<tr>
															<td></td>
															<td></td>
														</tr>
														<tr>
															<td></td>
															<td></td>
														</tr>
														<tr>
															<td></td>
															<td></td>
														</tr>
														<tr>
															<td></td>
															<td></td>
														</tr>


													</table>
												</form>
												<%
													if (request.getParameter("status") != null) {
												%>
												<%=request.getParameter("status")%>
												<%
													}
												%>
												<form action="deleteGoodsDetailsAction.do">
													<%
														try {
															int Goodsid = Integer.parseInt(request.getParameter("Goodsid"));
															int countryid = Integer.parseInt(request
																	.getParameter("countryid"));
															String storepath = request.getRealPath("/images");
															GoodsDetailsDao dao = new GoodsDetailsDao();
															CoreList cl = dao.ViewGoodsDetails(storepath, Goodsid,
																	countryid);
															Enumeration en = cl.elements();
													%>
													<%
														int count = 0;
															if (session.getAttribute("nci") != null) {
																count = ((Integer) session.getAttribute("nci")).intValue();
															}
													%>
													<font color="black"><b> <%=count%>Item(s) are in
															Cart </b>
													</font>

													<table align="center" border=1>
														<tr bgcolor="skyblue">
															<td>
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
																	<strong>Item Img</strong>
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
																<span class="style3"><font color="black"><strong><%=form.getCountryname()%></strong>
																</font>
																</span>
															</td>
															<td>
																<span class="style3"><strong><font
																		color="black"><%=form.getGoodsName()%></font>
																</strong>
																</span>
															</td>
															<td>
																<strong><font color="black"><%=form.getItemName()%></font>
																</strong>
															</td>
															<td>
																<img src="images/<%=form.getItemImage()%>" width=50
																	height=50>
															</td>
															<td>
																<span class="style3"><strong><font
																		color="black"><%=form.getItemDesc()%></font>
																</strong>
																</span>
															</td>
															<td>
																<span class="style3"><strong><font
																		color="black"><%=form.getPrice()%></font>
																</strong>
																</span>
															</td>
															<td>
																<span class="style3"><strong><font
																		color="black"><a
																			href="AddtoCart.jsp?countryid=<%=form.getCountryId()%>&Goodsid=<%=form.getGoodsId()%>&itemid=<%=form.getItemId()%>">Add
																				To Cart</a>
																	</font>
																</strong>
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