<%@ page language="java" pageEncoding="ISO-8859-1"%>
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

		<title>ImportExportBusinessManagementSystem</title>
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


										<p align="center">
											<h2>
												<center>
													<font color="black"><b>Goods Registeration Form</b>
													</font>
												</center>
											</h2>
											<%
												if (request.getParameter("status") != null) {
											%>
											<%=request.getParameter("status")%>
											<%
												}
											%>

											<form action="GoodsDetailsAction.do" name="register">
												<table border="1" align="center" bordercolor="#FFFFFF">
													<tr>
														<td bgcolor="white">
															<div align="center">
																<font color="black"><b>Country Name :</b>
																</font>
															</div>
														</td>
														<td bgcolor="white">
															<div align="center">
																<select name="countryId" />
																<option value="">
																	---Select Any One----
																</option>

																<%
																	String storepath = request.getRealPath("/images");
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
															</div>
														</td>
													</tr>
													<tr>
														<td bgcolor="white">
															<div align="center">
																<font color="black"><b>Goods Name :</b>
																</font>
															</div>
														</td>
														<td bgcolor="white">
															<div align="center">
																<select name="goodsId">
																	<option value="">
																		---Select Any One----
																	</option>

																	<%
																		GoodsMasterDao dao = new GoodsMasterDao();
																		CoreList cl = dao.ViewGoodsMaster();
																		Enumeration en = cl.elements();
																		while (en.hasMoreElements()) {
																			GoodsMasterForm form = (GoodsMasterForm) en.nextElement();
																	%>
																	<option value="<%=form.getGoodsId()%>"><%=form.getGoodsName()%></option>
																	<%
																		}
																	%>
																</select>
															</div>
														</td>
													</tr>
													<tr>
														<td bgcolor="white">
															<div align="center">
																<font color="black"><b>Item Name :</b>
																</font>
															</div>
														</td>
														<td bgcolor="white">
															<div align="center">
																<input type=text name="itemName" />
															</div>
														</td>
													</tr>
													<!--<tr>
														<td bgcolor="white">
															<div align="center">
																<font color="black"><b>Goods Images :</b>
																</font>
															</div>
														</td>
														<td bgcolor="white">
															<div align="center">
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																<input type=file name="itemLaunchVideo" />
															</div>
														</td>
													</tr>

													<tr>
														<td bgcolor="white">
															<div align="center">
																<font color="black"><b>Goods Lanuch Video :</b>
																</font>
															</div>
														</td>
														<td bgcolor="white">
															<div align="center">
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																<input type=file name="itemImage" />
															</div>
														</td>
													</tr>

													--><tr>
														<td bgcolor="white">
															<div align="center">
																<font color="black"><b>Goods Desc :</b>
																</font>
															</div>
														</td>
														<td bgcolor="white">
															<div align="center">
																<input type=text name="itemDesc" />
															</div>
														</td>
													</tr>

													<tr>
														<td bgcolor="white">
															<div align="center">
																<font color="black"><b>Price : </b>
																</font>
															</div>
														</td>
														<td bgcolor="white">
															<div align="center">
																<input type=text name="price" />
															</div>
														</td>
													</tr>

													<tr>
														<td bgcolor="white">
															<div align="center"></div>
														</td>
														<td bordercolor="#FFFFFF" bgcolor="white">
															<div align="center">
																<input type=submit name="Register" value="Register" />
																<input type=reset name="Register" value="Reset" />
															</div>
														</td>
													</tr>
												</table>
											</form>

											<script language="JavaScript" type="text/javascript">

//You should create the validator only after the definition of the HTML form
var frmvalidator = new Validator("register");
frmvalidator.addValidation("countryId", "dontselect=0");
frmvalidator.addValidation("goodsId", "dontselect=0");

frmvalidator.addValidation("itemName", "req", "Please enter Item Name");
frmvalidator.addValidation("itemName", "maxlen=20",
		"Max length for ItemName is 20");
frmvalidator.addValidation("itemName", "alpha",
		" Item Name Alphabetic chars only");

frmvalidator.addValidation("itemDesc", "req", "Please enter Item Desc");

frmvalidator.addValidation("price", "req", "Please enter Item Price");

frmvalidator.addValidation("dob", "req", "Please enter your DOB");

frmvalidator.addValidation("itemLaunchVideo", "req",
		"Please requierd Item Launch Video");
</script>


											<center>


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