
<%@page import="com.yourcompany.struts.form.GoodsDetailsForm"%>
<%@page import="com.iebms.dao.GoodsDetailsDao"%> 
 
 <%
   	String target="goodsDetails.jsp?status=Registration failed";
       try
       {
       GoodsDetailsForm form=new GoodsDetailsForm();
       form.setItemRegDate(request.getParameter("itemRegDate"));
       form.setGoodsId(Integer.parseInt(request.getParameter("goodsId")));
       form.setCountryId(Integer.parseInt(request.getParameter("countryId")));
       form.setItemName(request.getParameter("itemName"));
       form.setItemImage(request.getParameter("itemImage"));
       form.setItemLaunchVideo(request.getParameter("itemLaunchVideo"));
       form.setItemDesc(request.getParameter("itemDesc"));
       form.setPrice(Integer.parseInt(request.getParameter("price")));
       GoodsDetailsDao dao=new GoodsDetailsDao();
       boolean flag=dao.insertGoodsDetails(form);
       if(flag)
       {
       target="goodsDetails.jsp?status=Registration success";
       }
       }
       catch(Exception e)
       {
       e.printStackTrace();
       }
       RequestDispatcher rd=request.getRequestDispatcher(target);
       rd.forward(request,response);
   %>