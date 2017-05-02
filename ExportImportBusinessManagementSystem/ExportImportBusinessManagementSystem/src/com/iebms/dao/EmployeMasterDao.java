package com.iebms.dao;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.iebms.model.Profile;
import com.iebms.util.CoreList;
import com.iebms.util.DateWrapper;
import com.iebms.util.LoggerManager;
import com.yourcompany.struts.form.EmployeMasterForm;

public class EmployeMasterDao extends AbstractDataAccessObject 
{
	
	
	public boolean insertEmployeMaster(EmployeMasterForm emform)
	{
		java.sql.Connection con=null;
		boolean flag=false;
		try
		{
		int n=getSequenceID("EmployeMaster","EmployeId");
		con=getConnection();
		PreparedStatement ps=con.prepareStatement("insert into EmployeMaster values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setInt(1,n);
		ps.setString(2,emform.getEmployeFirstName());
		ps.setString(3,emform.getEmployeMiddleName());
		ps.setString(4,emform.getEmployeLastName());
		ps.setString(5,DateWrapper.parseDate(emform.getDateOfBirth()));
		ps.setString(6,DateWrapper.parseDate(new java.util.Date()));
		ps.setString(7,emform.getAddress());
		ps.setString(8,emform.getPhone());
		ps.setString(9,emform.getEmail());
		File afile=new File(emform.getImage());
        FileInputStream fs=new FileInputStream(afile);
        ps.setBinaryStream(10,fs,(int)afile.length());
		ps.setInt(11,emform.getUserId());
		ps.setString(12,emform.getUsername());
		ps.setString(13,emform.getPassword());
		 
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

public CoreList ViewEmployeMaster(String storepath)
{   CoreList v=new CoreList();
	java.sql.Connection con=null;
	EmployeMasterForm emform=null;
	try
	{
		con=getConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from EmployeMaster");
		 
		while(rs.next())
		{
			emform=new EmployeMasterForm();
			int id=rs.getInt(1);
			emform.setEmployeId(rs.getInt(1));
			emform.setEmployeFirstName(rs.getString(2));
			emform.setEmployeMiddleName(rs.getString(3));
			emform.setEmployeLastName(rs.getString(4));
			emform.setDateOfBirth(DateWrapper.parseDate(rs.getDate(5)));
			emform.setDateOfJoin(DateWrapper.parseDate(rs.getDate(6)));
			emform.setAddress(rs.getString(7));
			emform.setPhone(rs.getString(8));
			emform.setEmail(rs.getString(9));
			Blob b=rs.getBlob(10);
			byte b1[]=b.getBytes(1,(int)b.length()); 
			OutputStream fout=new FileOutputStream(storepath+"/"+id+".gif");
			fout.write(b1);
			emform.setImage(id+".gif");
			emform.setUserId(rs.getInt(11));
			emform.setUsername(rs.getString(12));
			v.add(emform);
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
public EmployeMasterForm ViewEmployeMasterById(String storepath,int EmployeId)
{   EmployeMasterForm emform=new EmployeMasterForm();
	java.sql.Connection con=null;
	 
	try
	{
		 
		con=getConnection();
		 
		PreparedStatement ps=con.prepareStatement("select * from EmployeMaster where EmployeId = ? ");
		ps.setInt(1,EmployeId);
		ResultSet rs=ps.executeQuery();
		 
		if(rs.next())
		{
			emform=new EmployeMasterForm();
			int id=rs.getInt(1);
			emform.setEmployeId(rs.getInt(1));
			emform.setEmployeFirstName(rs.getString(2));
			emform.setEmployeMiddleName(rs.getString(3));
			emform.setEmployeLastName(rs.getString(4));
			emform.setDateOfBirth(DateWrapper.parseDate(rs.getDate(5)));
			emform.setDateOfJoin(DateWrapper.parseDate(rs.getDate(6)));
			emform.setAddress(rs.getString(7));
			emform.setPhone(rs.getString(8));
			emform.setEmail(rs.getString(9));
			Blob b=rs.getBlob(10);
			byte b1[]=b.getBytes(1,(int)b.length()); 
			OutputStream fout=new FileOutputStream(storepath+"/"+id+".gif");
			fout.write(b1);
			emform.setImage(id+".gif");
			emform.setUserId(rs.getInt(11));
			 
			 
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
	return emform;
	
	
}

public boolean deleteEmployeMaster(int EmployeId)
	{
		java.sql.Connection con=null;
		boolean flag=false;
		try
		{
			 
			con=getConnection();
			 
			PreparedStatement ps=con.prepareStatement("delete from EmployeMaster where EmployeId = ? ");
			ps.setInt(1,EmployeId);
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

public boolean UpdateEmployeMaster(EmployeMasterForm emform)
{
	java.sql.Connection con=null;
	boolean flag=false;
	try
	{
	 
	con=getConnection();
	PreparedStatement ps=con.prepareStatement("update EmployeMaster set employefirstname = ?,employemiddlename = ?, employelastname = ?,dateofbirth = ?,dateofjoin = ?,address = ?,phone = ?,email = ?,image = ?, userid = ? where EmployeId = ? ");
	ps.setInt(11,emform.getEmployeId());
	ps.setString(1,emform.getEmployeFirstName());
	ps.setString(2,emform.getEmployeMiddleName());
	ps.setString(3,emform.getEmployeLastName());
	ps.setString(4,DateWrapper.parseDate(emform.getDateOfBirth()));
	ps.setString(5,DateWrapper.parseDate(emform.getDateOfJoin()));
	ps.setString(6,emform.getAddress());
	ps.setString(7,emform.getPhone());
	ps.setString(8,emform.getEmail());
	File afile=new File(emform.getImage());
    FileInputStream fs=new FileInputStream(afile);
    ps.setBinaryStream(9,fs,(int)afile.length());
	ps.setInt(10,emform.getUserId());
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
public int getEmployeeDetails(String username,String password)
{
	int employeeid=0;
	Connection con=null;
	try{
		con=getConnection();
		String selectsql="select employeid from employemaster where username=? and password=?";
		PreparedStatement pst=con.prepareStatement(selectsql);
	pst.setString(1,username);
	pst.setString(2,password);
	ResultSet rs=pst.executeQuery();
	while(rs.next())
	{
		employeeid=rs.getInt(1);
	}
	}catch (Exception e) {
		e.printStackTrace();
			
		
		// TODO: handle exception
	}
	return employeeid;
}


public boolean changePassword(Profile regbean)
{
    String loginid=regbean.getLoginID();
    String oldpassword=regbean.getPassword();
    String newpassword=regbean.getNewPassword();
    boolean flag=false;
    Connection con=null;
    try 
    {
    	con=getConnection();
    	
        PreparedStatement cstmt=con.prepareStatement("update employemaster set password=? where username=? and password=?");
        
        cstmt.setString(1,newpassword);
        cstmt.setString(2,loginid);
        cstmt.setString(3,oldpassword);
        int n=cstmt.executeUpdate();
       
        
        if(n>0)           {
            flag=true;
            con.commit();
        }
        else
        {
            flag=false;
            con.rollback();
        }
        con.close();
    } catch (Exception e) {

    	// TODO: handle exception
	}
    
return flag;

}
}






 


 





 
