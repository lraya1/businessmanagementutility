package com.iebms.dao; 
import java.sql.*; 

import com.iebms.dao.AbstractDataAccessObject;
import com.iebms.util.CoreList;
import com.iebms.util.DateWrapper;
import com.iebms.util.LoggerManager;
import com.yourcompany.struts.form.OrderShipmentMasterForm;

public class OrderShipmentMasterDao extends AbstractDataAccessObject 
{
	public boolean insertOrderShipmentMaster(OrderShipmentMasterForm cmform)
	{
		java.sql.Connection con=null;
		boolean flag=false;
		try
		{
		int n=getSequenceID("OrderShipmentMaster","ShipmentId");
		con=getConnection();
		PreparedStatement ps=con.prepareStatement("insert into OrderShipmentMaster(SHIPMENTID,SHIPMENTDATE,ORDERID,SHIPMENTINCHARGEEMPID,SHIPMENTSTATUS,USERID) values(?,?,?,?,?,?)");
		ps.setInt(1,n);
		ps.setString(2,DateWrapper.parseDate(cmform.getShipmentDate()));
		ps.setInt(3,cmform.getOrderId());
		ps.setInt(4,cmform.getShipmentInchargeEmpId());
		ps.setString(5,cmform.getShipmentStatus());
		ps.setInt(6,cmform.getUserId());
		//ps.setString(7,cmform.getCustomerFeedBack());
		
	 
		
		 
		int i=ps.executeUpdate();
		if(i>0)
		{
			boolean flag1=new OrdersDAO().orderStatus(cmform.getOrderId());
			if(flag1)
			{
			flag=true;
		}
		}
			
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}finally
	{
		try{
			con.close();
		}
	catch(Exception e)
	{
		LoggerManager.writeLogInfo(e);
	}
	}
	return flag;
	
	
		}

public CoreList ViewOrderShipmentMaster(int employeeid)
{   CoreList v=new CoreList();
	java.sql.Connection con=null;
	OrderShipmentMasterForm cmform=null;
	try
	{
		con=getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select om.SHIPMENTID,om.SHIPMENTDATE,om.ORDERID,om.SHIPMENTSTATUS,om.USERID,ud.loginid from OrderShipmentMaster om,userdetails ud where om.userid=ud.userid and om.SHIPMENTINCHARGEEMPID="+employeeid);
		 
		while(rs.next())
		{
			cmform=new OrderShipmentMasterForm();
			 
			cmform.setShipmentId(rs.getInt(1));
			cmform.setShipmentDate(DateWrapper.parseDate(rs.getDate(2)));
			cmform.setOrderId(rs.getInt(3));
		//	cmform.setShipmentInchargeEmpId(rs.getInt(4));
			cmform.setShipmentStatus(rs.getString(4));
			cmform.setUserId(rs.getInt(5));
			cmform.setUsername(rs.getString(6));
			//cmform.setCustomerFeedBack(rs.getString(7));
			
			 
			v.add(cmform);
		}

		 
	}
		catch(Exception e)
	{
			e.printStackTrace();
		
	}
		finally
		{
			try{
				con.close();
			}
		catch(Exception e)
		{
			LoggerManager.writeLogInfo(e);
		}
		}
		return v;
		
	
}
public OrderShipmentMasterForm ViewOrderShipmentMasterById(int ShipmentId)
{   OrderShipmentMasterForm cmform=new OrderShipmentMasterForm();
	java.sql.Connection con=null;
	 
	try
	{
		 
		con=getConnection();
		 
		PreparedStatement ps=con.prepareStatement("select * from OrderShipmentMaster where ShipmentId = ? ");
		ps.setInt(1,ShipmentId);
		ResultSet rs=ps.executeQuery();
		 
		if(rs.next())
		{
			cmform=new OrderShipmentMasterForm();
			 
			cmform.setShipmentId(rs.getInt(1));
			cmform.setShipmentDate(DateWrapper.parseDate(rs.getDate(2)));
			cmform.setOrderId(rs.getInt(3));
			cmform.setShipmentInchargeEmpId(rs.getInt(4));
			cmform.setShipmentStatus(rs.getString(5));
			cmform.setUserId(rs.getInt(6));
			cmform.setCustomerFeedBack(rs.getString(7));
			 
			 
		}

		 
	}
		catch(Exception e)
	{
		
	}finally
	{
		try{
			con.close();
		}
	catch(Exception e)
	{
		LoggerManager.writeLogInfo(e);
	}
	}
	return cmform;
	
	
}

public boolean deleteOrderShipmentMaster(int ShipmentId)
	{
		java.sql.Connection con=null;
		boolean flag=false;
		try
		{
			 
			con=getConnection();
			 
			PreparedStatement ps=con.prepareStatement("delete from OrderShipmentMaster where ShipmentId = ? ");
			ps.setInt(1,ShipmentId);
			int i=ps.executeUpdate();
			if(i>0)
				flag=true;
			
			          
		}
		catch(Exception e)
		{
		}
		finally
		{
			try{
				con.close();
			}
		catch(Exception e)
		{
			LoggerManager.writeLogInfo(e);
		}
		}
		return flag;
		
		}

public boolean UpdateOrderShipmentMaster(OrderShipmentMasterForm cmform)
{
	java.sql.Connection con=null;
	boolean flag=false;
	try
	{
	 
	con=getConnection();
	PreparedStatement ps=con.prepareStatement("update OrderShipmentMaster set ShipmentDate = ?,orderid = ?, SHIPMENTINCHARGEEMPID = ?,SHIPMENTSTATUS = ?,USERID = ?,CUSTOMERFEEDBACK = ? where ShipmentId = ? ");
	ps.setInt(7,cmform.getShipmentId());
	ps.setString(1,DateWrapper.parseDate(cmform.getShipmentDate()));
	ps.setInt(2,cmform.getOrderId());
	ps.setInt(3,cmform.getShipmentInchargeEmpId());
	ps.setString(4,cmform.getShipmentStatus());
	ps.setInt(5,cmform.getUserId());
	ps.setString(6,cmform.getCustomerFeedBack());
	int i=ps.executeUpdate();
	if(i>0)
		flag=true;
	 
}
catch(Exception e)
{
}finally
{
	try{
		con.close();
	}
catch(Exception e)
{
	LoggerManager.writeLogInfo(e);
}
}
return flag;

	}

public boolean updateOrderShipmentStatus(int ShipmentId)
	{
		java.sql.Connection con=null;
		boolean flag=false;
		try
		{
			 
			con=getConnection();
			 
			PreparedStatement ps=con.prepareStatement("update OrderShipmentMaster set SHIPMENTSTATUS = 'Deliverd' where ShipmentId = ? ");
			ps.setInt(1,ShipmentId);
			int i=ps.executeUpdate();
			if(i>0)
				flag=true;
			
			          
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try{
				con.close();
			}
		catch(Exception e)
		{
			LoggerManager.writeLogInfo(e);
		}
		}
		return flag;
		
		}
}






 


 





 


 

 

 
