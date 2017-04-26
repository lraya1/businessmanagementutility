<%@page import="com.iebms.dao.GoodsMasterDao"%>
<%@page import="com.iebms.util.CoreList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.yourcompany.struts.form.GoodsMasterForm"%>
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

.style13 {
	color: white;
	font-weight: bold;
}

.style14 {
	color: #666666;
	font-weight: bold;
}
</style>

		<title>ImportExportBusinessManagementSystem</title>
		<script type="text/javascript" src="scripts/moveclock.js">
</script>


		<meta http-equiv="Content-Type"
			content="text/html; charset=iso-8859-1" />
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


	</head>
	<body>
		<table width="750" align="center" bgcolor="white">
			<tr>
				<td>
					<img src="images/goods.jpg" width="780" height="230" />
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
						<table bgcolor="white" width="770" align="center">
							<tr>
								<td bgcolor="white">
									<font color="skyblue"><h1>
											<br>
										</h1>

										<p>
											&nbsp;
										</p>

										<table align="center" bgcolor="#999999">
											<tr>
												<td bgcolor="white">
													<span class="style9"><b><u><h2>
																	View Goods
																</h2>
														</u> </b>
													</span>




													<table bgcolor="#999999">
														<tr>
															<td bgcolor="white">


																<%
																	if (request.getParameter("status") != null) {
																%>
																<%=request.getParameter("status")%>
																<%
																	}
																%>
																<form action="deleteGoodsAction.do" method="post"
																	name="register">
																	<%
																		try {

																			CoreList cl = (CoreList) request.getAttribute("ViewGoods");
																			Enumeration en = cl.elements();
																	%>
																	<table align="center" border=1>
																		<tr bgcolor="skyblue">


																			<td colspan=2>
																				<div align="center" class="style13">
																					GoodsName
																				</div>
																			</td>
																			<td>
																				<div align="center" class="style13">
																					GoodsDesc
																				</div>
																			</td>
																		</tr>
																		<%
																			while (en.hasMoreElements()) {
																					GoodsMasterForm form = (GoodsMasterForm) en.nextElement();
																		%>
																		<tr bgcolor="white">
																			<td>
																				<div align="center" class="style14 style9">
																					<input type="checkbox" name="TypeId"
																						value="<%=form.getGoodsId()%>" />
																				</div>
																			</td>
																			<td>
																				<div align="center" class="style14 style9">
																					<a
																						href="UpdateGoodsMaster.jsp?Id=<%=form.getGoodsId()%>"><font
																						color="black"><strong><U><%=form.getGoodsName()%></U>
																						</strong>
																					</font>
																					</a>
																				</div>
																			</td>
																			<td>
																				<div align="center" class="style14 style9">
																					<font color="black"><strong><%=form.getGoodsDesc()%></strong>
																					</font>
																				</div>
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
																		<input type=submit name="delete" value="Delete" />
																	</center>
																</form>
																<script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
var frmvalidator = new Validator("register");
frmvalidator.addValidation("TypeId", "req", "Please select a TypeId");
</script>





															</td>
														</tr>
													</table>



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
								</td>
							</tr>
						</table>
					</div>
	</body>
</html>
