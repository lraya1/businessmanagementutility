package com.iebms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Enumeration;

import com.iebms.dao.AbstractDataAccessObject;
import com.iebms.util.CoreHash;
import com.iebms.util.CoreList;
import com.iebms.util.DateWrapper;
import com.iebms.util.LoggerManager;
import com.yourcompany.struts.form.Orders;

public class OrdersDAO extends AbstractDataAccessObject{

	public Connection con;
	private Orders order;
	
	
	// place total order
	public boolean placeTotalOrder(Orders order, CoreHash aCoreHash)
	{
		boolean flag = false;
		try
		{
			
con=getConnection();
			int orderid = getSequenceID("stampordermaster", "orderid");
			int userid = order.getUserid();
			System.out.print("userid"+userid);
			double totalamt = order.getTotalamount();
			String orderdate = order.getOrderDate();
			String status = order.getStatus();
			
			PreparedStatement pst = con.prepareStatement("insert into stampordermaster values(?,?,?,?,?,?)");
			pst.setInt(1, orderid);
			pst.setString(2,DateWrapper.parseDate(new java.util.Date()));
			pst.setInt(3,userid);
			pst.setInt(4,2);
			pst.setDouble(5, totalamt);
			pst.setString(6,"Pending");
			
int n=pst.executeUpdate();
if(n>0)
			{
				flag = placeItemOrder(orderid,aCoreHash);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			LoggerManager.writeLogWarning(e);
		}
		finally
		{
			try
			{
				if(flag)
					con.commit();
				else
					con.rollback();
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
		return flag;
	}

	//place Item Order
	
	private boolean placeItemOrder(int orderid, CoreHash aCoreHash)
	{
		boolean flag = false;
		try
		{
			System.out.println("Orderid"+orderid);
			con=getConnection();
		   PreparedStatement pst = con.prepareStatement("insert into stamporderdetails values(?,?,?,?,?)");
		    
		   Enumeration enu = aCoreHash.keys();
		   
		   while(enu.hasMoreElements())
		   {
			   Integer i1=(Integer)enu.nextElement();
			   order = (Orders)aCoreHash.get(i1);
			   if(order.getItemid()!=0)
			   {
			   System.out.println("itemid"+order.getItemid());
			   pst.setInt(1, orderid);
			   pst.setInt(2, order.getItemid());
			   pst.setInt(3, order.getQuantity());
			   pst.setInt(4, order.getCategoryid());
			   pst.setInt(5, order.getBrandid());
			  
			   int n=pst.executeUpdate();
			  
			   if(n>0)
			   {
				   flag = true;
				   System.gc();
			   }
			   else
			   {
				   flag = false;
				   break;
			   }
			   }else{
				   flag = true;
				   System.gc();
			   
			   }
		   }
		}
		catch(Exception e)
		{e.printStackTrace();
			flag = false;
			LoggerManager.writeLogWarning(e);
		}		
		return flag;
	}
	
	public CoreList viewOrderStatus(int userid)
	{
		CoreList acorelist=new CoreList();
		Connection con=null;
	Orders aOrders=null;
		try{
			con=getConnection();
			PreparedStatement pst=con.prepareStatement("select orderid,orderdate,orderamount,orderstatus from stampordermaster where userid=?");
		pst.setInt(1,userid);
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			aOrders=new Orders();
			aOrders.setOrderID(rs.getInt(1));
			aOrders.setOrderDate(DateWrapper.parseDate(rs.getDate(2)));
			aOrders.setPrice(rs.getInt(3));
			aOrders.setStatus(rs.getString(4));
			
			acorelist.add(aOrders);
		}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return acorelist;
	}
	public CoreList viewTotalOrder()
	{
		CoreList acorelist=new CoreList();
		Connection con=null;
	Orders aOrders=null;
		try{
			con=getConnection();
			PreparedStatement pst=con.prepareStatement("select orderid,orderdate,orderamount,orderstatus,userid from stampordermaster");
		
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			aOrders=new Orders();
			aOrders.setOrderID(rs.getInt(1));
			aOrders.setOrderDate(DateWrapper.parseDate(rs.getDate(2)));
			aOrders.setPrice(rs.getInt(3));
			aOrders.setStatus(rs.getString(4));
			aOrders.setUserid(rs.getInt(5));
			acorelist.add(aOrders);
		}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return acorelist;
	}
	public boolean orderStatus(int orderid)
	{
		boolean flag=false;
		Connection con=null;
		try{
			con=getConnection();
			PreparedStatement pst=con.prepareStatement("Update stampordermaster set orderstatus='Processing' where orderid=?");
		pst.setInt(1,orderid);
		int n=pst.executeUpdate();
		if(n>0)
		{
			flag=true;
		}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return flag;
	}
	public boolean orderCompleteStatus(int orderid)
	{
		boolean flag=false;
		Connection con=null;
		try{
			con=getConnection();
			PreparedStatement pst=con.prepareStatement("Update stampordermaster set orderstatus='Delivered' where orderid=?");
		pst.setInt(1,orderid);
		int n=pst.executeUpdate();
		if(n>0)
		{
			flag=true;
		}
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return flag;
	}
	public CoreHash listOrderDetails(int orderid)
	{
		CoreHash aCoreHash = new CoreHash();
		
		try
		{
			con=getConnection();
		   Statement st = con.createStatement();
		   ResultSet rs = st.executeQuery("select * from stamporderdetails where orderid="+orderid);
		   int i=0;
		   while(rs.next())
		   {
			  order = new Orders();
			  orderid = rs.getInt(1);
			  order.setItemid(rs.getInt(2));
			  order.setQuantity(rs.getInt(3));
			  order.setCategoryid(rs.getInt(4));
			  
			  
			  order.setCountryname(rs.getString(5));
			  
		      aCoreHash.put(new Integer(i++), order);	  
		   }
		}
		catch(Exception e)
		{
			e.printStackTrace();
			LoggerManager.writeLogWarning(e);
		}
		finally
		{
			try
			{
				con.close();
			}
			catch(Exception e)
			{
				LoggerManager.writeLogWarning(e);
			}
		}
		return aCoreHash;
	}
	
	
	
}
