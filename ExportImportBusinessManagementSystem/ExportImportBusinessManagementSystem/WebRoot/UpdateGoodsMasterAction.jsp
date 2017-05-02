
<%@page import="com.yourcompany.struts.form.GoodsMasterForm"%>
<%@page import="com.iebms.dao.GoodsMasterDao"%>



<%
     	String target="ViewGoodsMaster.jsp?status=Updation failed";
           try
           {
           GoodsMasterForm form=new GoodsMasterForm();  
           form.setGoodsId(Integer.parseInt(request.getParameter("goodsId")));
           form.setGoodsName(request.getParameter("goodsName"));
           form.setGoodsDesc(request.getParameter("goodsDesc"));
           GoodsMasterDao dao=new GoodsMasterDao();
           boolean flag=dao.UpdateGoodsMaster(form);
           if(flag)
           {
           target="ViewGoodsMaster.jsp?status=Updation success";
           }
           }
           catch(Exception e)
           {
           e.printStackTrace();
           }
           RequestDispatcher rd=request.getRequestDispatcher(target);
           rd.forward(request,response);
           
     %>

