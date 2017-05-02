package com.iebms.dao;

 
import java.sql.*; 

import com.iebms.dao.AbstractDataAccessObject;
import com.iebms.util.CoreList;
import com.iebms.util.LoggerManager;
import com.yourcompany.struts.form.CourierDetailsForm;

public class CourierDetailsDao extends AbstractDataAccessObject 
{
	public boolean insertCourierDetails(CourierDetailsForm cdform)
	{
		java.sql.Connection con=null;
		boolean flag=false;
		try
		{
		 
		con=getConnection();
		PreparedStatement ps=con.prepareStatement("insert into CourierDetails values(?,?,?)");
		ps.setInt(1,cdform.getCourierId());
		ps.setInt(2,cdform.getItemId());
		ps.setString(3,cdform.getAmtCharged());
		 
		 
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

public CoreList ViewCourierDetails()
{   CoreList v=new CoreList();
	java.sql.Connection con=null;
	CourierDetailsForm cdform=null;
	try
	{
		con=getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from CourierDetails");
		 
		while(rs.next())
		{
			cdform=new CourierDetailsForm();
			cdform.setCourierId(rs.getInt(1));
			cdform.setItemId(rs.getInt(2));
			cdform.setAmtCharged(rs.getString(3));
			 
            v.add(cdform);
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
public CourierDetailsForm ViewCourierDetailsById(int OperatorId)
{   CourierDetailsForm cdform=new CourierDetailsForm();
	java.sql.Connection con=null;
	 
	try
	{
		 
		con=getConnection();
		 
		PreparedStatement ps=con.prepareStatement("select * from CourierDetails where OperatorId = ? ");
		ps.setInt(1,OperatorId);
		ResultSet rs=ps.executeQuery();
		 
		if(rs.next())
		{
			cdform=new CourierDetailsForm();
			cdform.setCourierId(rs.getInt(1));
			cdform.setItemId(rs.getInt(2));
			cdform.setAmtCharged(rs.getString(3));
			 
			 
			 
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
	return cdform;
	
	
}

public boolean deleteCourierDetails(int OperatorId)
	{
		java.sql.Connection con=null;
		boolean flag=false;
		try
		{
			 
			con=getConnection();
			 
			PreparedStatement ps=con.prepareStatement("delete from CourierDetails where courierId = ? ");
			ps.setInt(1,OperatorId);
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

public boolean UpdateCourierDetails(CourierDetailsForm cdform)
{
	java.sql.Connection con=null;
	boolean flag=false;
	try
	{
	 
	con=getConnection();
	PreparedStatement ps=con.prepareStatement("update CourierDetails set itemid = ?,amtcharged = ? where courierId = ? ");
	ps.setInt(3,cdform.getCourierId());
	ps.setInt(1,cdform.getItemId());
	ps.setString(2,cdform.getAmtCharged());
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
}






 


 






