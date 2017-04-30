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

										<p>
											&nbsp;
										</p>
										<p align="center">
											<table align="center" bgcolor="white">
												<tr>
													<td width="396">
														<span class="style9"><b><h3>
																	<u>Goods Registration Form</u>
																</h3> </b>
														</span>




														<table bgcolor="white">
															<tr>
																<td>


																	<%
																		if (request.getParameter("status") != null) {
																	%>
																	<%=request.getParameter("status")%>
																	<%
																		}
																	%>
																	<form action="GoodsAction.do" name="register">
																		<table align="center">
																			<tr bgcolor="white">
																				<td>
																					<span class="style9"><b>Goods Name :</b>
																					</span>
																				</td>
																				<td>
																					<input type=text name="goodsName" />
																				</td>
																			</tr>
																			<tr>
																				<td bgcolor="white">
																					<span class="style9"><b>Goods
																							Description :</b>
																					</span>
																				</td>
																				<td>
																					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																					<textarea name="goodsDesc">
			</textarea>
																				</td>
																			</tr>
																			<tr bgcolor="white">
																				<td></td>
																				<td>
																					<input type=submit name="Register" value="Register" />
																					<input type=reset name="Register" value="Reset" />
																				</td>
																			</tr>
																		</table>
																	</form>
																	<script language="JavaScript" type="text/javascript">
//You should create the validator only after the definition of the HTML form
var frmvalidator = new Validator("register");

frmvalidator.addValidation("goodsName", "req", "Please enter Goods Name");
frmvalidator.addValidation("goodsName", "maxlen=20",
		"Max length for FirstName is 20");
frmvalidator.addValidation("goodsName", "alpha",
		" Goods Name Alphabetic chars only");

frmvalidator.addValidation("goodsDesc", "req", "Please enter Goods Desc");
frmvalidator.addValidation("goodsDesc", "maxlen=20", "Max length is 20");
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