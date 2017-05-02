
<%@page import="com.yourcompany.struts.form.GoodsDetailsForm"%>
<%@page import="com.iebms.dao.GoodsDetailsDao"%>

<%
	String target = "ViewGoodsDetails.jsp?status=Updation failed";
	try {
		GoodsDetailsForm form = new GoodsDetailsForm();
		form
				.setItemId(Integer.parseInt(request
						.getParameter("itemId")));
		form.setItemRegDate(request.getParameter("itemRegDate"));
		form.setGoodsId(Integer.parseInt(request
				.getParameter("goodsId")));
		form.setCountryId(Integer.parseInt(request
				.getParameter("countryId")));
		form.setItemName(request.getParameter("itemName"));
		form.setItemImage(request.getParameter("itemImage"));
		form
				.setItemLaunchVideo(request
						.getParameter("itemLaunchVideo"));
		form.setItemDesc(request.getParameter("itemDesc"));
		form.setPrice(Integer.parseInt(request.getParameter("price")));
		GoodsDetailsDao dao = new GoodsDetailsDao();

		boolean flag = dao.UpdateGoodsDetails(form);
		System.out.println("this is flag" + flag);
		if (flag) {
			target = "ViewGoodsDetails.jsp?status=Updation success";

		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	//RequestDispatcher rd=request.getRequestDispatcher(target);
	//rd.forward(request,response);
%>
