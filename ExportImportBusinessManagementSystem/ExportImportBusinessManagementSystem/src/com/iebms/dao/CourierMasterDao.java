package com.iebms.dao;
 
import java.sql.*; 

import com.iebms.dao.AbstractDataAccessObject;
import com.iebms.util.CoreList;
import com.iebms.util.DateWrapper;
import com.iebms.util.LoggerManager;
import com.yourcompany.struts.form.CourierMasterForm;

public class CourierMasterDao extends AbstractDataAccessObject 
{
	public boolean insertCourierMaster(CourierMasterForm cmform)
	{
		java.sql.Connection con=null;
		boolean flag=false;
		try
		{
		int n=getSequenceID("CourierMaster","CourierId");
		con=getConnection();
		PreparedStatement ps=con.prepareStatement("insert into CourierMaster(COURIERID,COURIERDATE,USERID,FROMCOUNTRYID,TOCOUNTRYID,FROMCITYID,TOCITYID,COURIERAMT,COURIERDET,status) values(?,?,?,?,?,?,?,?,?,?)");
		ps.setInt(1,n);
		ps.setString(2,DateWrapper.parseDate(new java.util.Date()));
		ps.setInt(3,cmform.getUserId());
		
		ps.setInt(4,cmform.getFromCountryId());
		ps.setInt(5,cmform.getToCountryId());
		ps.setInt(6,cmform.getFromCityId());
		ps.setInt(7,cmform.getToCityId());
		ps.setInt(8,cmform.getCourierAmt());
		ps.setString(9,cmform.getCourierDet());
		ps.setString(10,"Pending");
		 
		int i=ps.executeUpdate();
		if(i>0)
			flag=true;
		 
			
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

public CoreList ViewCourierMaster(int userid)
{   CoreList v=new CoreList();
	java.sql.Connection con=null;
	CourierMasterForm cmform=null;
	try
	{
		con=getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from CourierMaster where userid ="+userid);
		 
		while(rs.next())
		{
			cmform=new CourierMasterForm();
			 
			cmform.setCourierId(rs.getInt(1));
			cmform.setCourierDate(DateWrapper.parseDate(rs.getDate(2)));
			cmform.setUserId(rs.getInt(3));
			cmform.setEmployeId(rs.getInt(4));
			cmform.setFromCountryId(rs.getInt(5));
			cmform.setToCountryId(rs.getInt(6));
			cmform.setFromCityId(rs.getInt(7));
			cmform.setToCityId(rs.getInt(8));
			cmform.setCourierAmt(rs.getInt(9));
			cmform.setCourierDet(rs.getString(10));
			cmform.setStatus(rs.getString(11));
			v.add(cmform);
		}

		 
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
		return v;
		
	
}
public CoreList ViewAllCourierDetails()
{   CoreList v=new CoreList();
	java.sql.Connection con=null;
	CourierMasterForm cmform=null;
	try
	{
		con=getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from CourierMaster");
		 
		while(rs.next())
		{
			cmform=new CourierMasterForm();
			 
			cmform.setCourierId(rs.getInt(1));
			cmform.setCourierDate(DateWrapper.parseDate(rs.getDate(2)));
			cmform.setUserId(rs.getInt(3));
			cmform.setEmployeId(rs.getInt(4));
			cmform.setFromCountryId(rs.getInt(5));
			cmform.setToCountryId(rs.getInt(6));
			cmform.setFromCityId(rs.getInt(7));
			cmform.setToCityId(rs.getInt(8));
			cmform.setCourierAmt(rs.getInt(9));
			cmform.setCourierDet(rs.getString(10));
			cmform.setStatus(rs.getString(11));
			v.add(cmform);
		}

		 
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
		return v;
		
	
}

public CourierMasterForm ViewCourierMasterById(int CourierId)
{   CourierMasterForm cmform=new CourierMasterForm();
	java.sql.Connection con=null;
	 
	try
	{
		 
		con=getConnection();
		 
		PreparedStatement ps=con.prepareStatement("select * from CourierMaster where CourierId = ? ");
		ps.setInt(1,CourierId);
		ResultSet rs=ps.executeQuery();
		 
		if(rs.next())
		{
			cmform=new CourierMasterForm();
	 
			cmform.setCourierId(rs.getInt(1));
			cmform.setCourierDate(DateWrapper.parseDate(rs.getDate(2)));
			cmform.setUserId(rs.getInt(3));
			cmform.setEmployeId(rs.getInt(4));
			cmform.setFromCountryId(rs.getInt(5));
			cmform.setToCountryId(rs.getInt(6));
			cmform.setFromCityId(rs.getInt(7));
			cmform.setToCityId(rs.getInt(8));
			cmform.setCourierAmt(rs.getInt(9));
			cmform.setCourierDet(rs.getString(10));
			 
			 
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

public boolean deleteCourierMaster(int CourierId)
	{
		java.sql.Connection con=null;
		boolean flag=false;
		try
		{
			 
			con=getConnection();
			 
			PreparedStatement ps=con.prepareStatement("delete from CourierMaster where CourierId = ? ");
			ps.setInt(1,CourierId);
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

public boolean UpdateCourierMaster(CourierMasterForm cmform)
{
	java.sql.Connection con=null;
	boolean flag=false;
	try
	{
	 System.out.println("employeeid"+cmform.getEmployeId());
	 System.out.println("Couriere"+cmform.getCourierId());
	 con=getConnection();
	PreparedStatement ps=con.prepareStatement("update CourierMaster set status='Processing',EMPLOYEID=? where CourierId = ? ");
	ps.setInt(1,cmform.getEmployeId());
	
	ps.setInt(2,cmform.getCourierId());
	
	
	int i=ps.executeUpdate();
	if(i>0)
		flag=true;
	 
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

public CoreList ViewCourierMasterDetails(int employeeid)
{ 
	CourierMasterForm cmform=null;
	
	java.sql.Connection con=null;
	 CoreList acorelist=new CoreList();
	try
	{
		 
		con=getConnection();
		 
		PreparedStatement ps=con.prepareStatement("select * from CourierMaster where employeId = ? ");
		ps.setInt(1,employeeid);
		ResultSet rs=ps.executeQuery();
		 
		while(rs.next())
		{
			cmform=new CourierMasterForm();
	 
			cmform.setCourierId(rs.getInt(1));
			cmform.setCourierDate(DateWrapper.parseDate(rs.getDate(2)));
			cmform.setUserId(rs.getInt(3));
			cmform.setEmployeId(rs.getInt(4));
			cmform.setFromCountryId(rs.getInt(5));
			cmform.setToCountryId(rs.getInt(6));
			cmform.setFromCityId(rs.getInt(7));
			cmform.setToCityId(rs.getInt(8));
			cmform.setCourierAmt(rs.getInt(9));
			cmform.setCourierDet(rs.getString(10));
			cmform.setStatus(rs.getString(11));
			acorelist.add(cmform);
			 
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
	return acorelist;
	
	
}

public boolean updateCourierStatus(int courierid)
{
	boolean flag=false;
	Connection con=null;
	try{
		con=getConnection();
		String updatesql="Update CourierMaster set status='Deliverd' where courierid="+courierid;
		PreparedStatement pst=con.prepareStatement(updatesql);

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

}






 


 





 


 