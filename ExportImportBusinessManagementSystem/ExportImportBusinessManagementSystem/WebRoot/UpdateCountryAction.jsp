<%@page import="com.iebms.dao.CountryMasterDao"%>
<%@page import="com.yourcompany.struts.form.CountryMasterForm"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/transitional.dtd">
<html>
	<head>
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
					<img src="images/goods.jpg" width="780" height="230" />
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

											<table bgcolor="white">
												<tr>
													<td>



														<center>
															<h3>
																<strong><font color="black">Update
																		Country Form</font>
																</strong>
															</h3>
															<%
																String realpath = request.getRealPath("/images");
																int id = Integer.parseInt(request.getParameter("Id"));
																CountryMasterDao dao = new CountryMasterDao();
																CountryMasterForm form = dao.ViewCountryMasterById(realpath, id);
															%>

															<form action="updateCountryAction.do">
																<table align="center" bgcolor="white">
																	<tr>
																		<td>
																			<strong><font color="black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Country
																					Name : </font>
																			</strong>
																		</td>
																		<td>
																			<input type=text name="countryName"
																				value="<%=form.getCountryName()%>" />
																		</td>
																	</tr>

																	<tr>
																		<td>
																			<strong><font color="black"></font>
																			</strong>
																		</td>
																		<td>
																			<input type=hidden name="countryId" value="<%=id%>">
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<strong><font color="black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Country
																					Area :</font>
																			</strong>
																		</td>
																		<td>
																			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																			<textarea name="countryArea"><%=form.getCountryArea()%></textarea>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<strong><font color="black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Description
																					: </font>
																			</strong>
																		</td>
																		<td>
																			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																			<textarea name="description"><%=form.getDescription()%></textarea>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<strong><font color="black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Country
																					Abbreviation :</font>
																			</strong>
																		</td>
																		<td>
																			<input type=text name="abbr"
																				value="<%=form.getAbbr()%>" />
																		</td>
																	</tr>
																	<!--<tr>
																		<td>
																			<strong><font color="black">CountryMap
																					:</font>
																			</strong>
																		</td>
																		<td>
																			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																			<input type="file" name="countryMap"
																				onChange="preview(this)" />
																		</td>
																		<td>
																			<img alt="See Photo Here" id="previewField"
																				src="<%=realpath + "/" + form.getCountryMap()%>"
																				height="100" width="100" />
																		</td>
																	</tr>
																	--><!--<input type="hidden" name="countryMap1"
																		value="<%=realpath + "/" + form.getCountryMap()%>" />
																	<tr>
																		--><td></td>
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
	</body>
</html>