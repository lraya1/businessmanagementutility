/*
 * SecurityDAO.java
 *
 * 
 */

package com.iebms.dao;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import com.iebms.model.Profile;
import com.iebms.util.LoggerManager;
/**
 *
 * @author 
 */
public class SecurityDAO extends AbstractDataAccessObject
{
     Connection con;
     private String desc;
     private boolean flag;
    /** Creates a new instance of SecurityDAO */
    public SecurityDAO() 
    {
       
               //getting Database Connection
    	
               
    }
    
   
   
    //Login Check
    public String loginCheck(Profile regbean)
    {
        String loginid=regbean.getLoginID();
        String password=regbean.getPassword();
        String role="ee";        
        try
        {   con=getConnection();
        System.out.println("con"+con);
          //  con.setAutoCommit(true);
            CallableStatement cstmt=con.prepareCall("{call logincheck(?,?,?)}");
            cstmt.setString(1,loginid);
            cstmt.setString(2,password);
            cstmt.registerOutParameter(3,Types.VARCHAR);
           boolean flag= cstmt.execute();
           System.out.println("flag->"+flag);
            role=cstmt.getString(3);
            System.out.println("logintype="+role);
            
            
        }
        catch (SQLException ex) 
        {ex.printStackTrace();
        	LoggerManager.writeLogSevere(ex);
            desc="Database Connection problem";
            flag=false;
        }
        //loginaudit(loginid,desc);
        return role;
    }
    
    
    //Method for login audit
    public void loginaudit(String loginid)
    {
        try 
        { con=getConnection();
        	
            CallableStatement cstmt=con.prepareCall("call signoutprocedure(?)");
            cstmt.setString(1,loginid);
            
            
           cstmt.execute();
           
            con.close();
        }
        catch(Exception e)
        {
             
            e.printStackTrace();
            }
    }//Change Password
    public boolean changePassword(Profile regbean)
    {
        String loginid=regbean.getLoginID();
        String oldpassword=regbean.getPassword();
        String newpassword=regbean.getNewPassword();
        boolean flag=false;
        try 
        {con=getConnection();
        	con.setAutoCommit(false);
           
            PreparedStatement cstmt=con.prepareStatement("update userdetails set password=? where loginid=? and password=?");
            
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
        } 
        catch (SQLException ex) 
        {ex.printStackTrace();
        	LoggerManager.writeLogSevere(ex);
            flag=false;
            try 
            {
                con.rollback();
            } 
            catch (SQLException sex) 
            {
            	LoggerManager.writeLogSevere(sex);
            }
            
        }
        catch (Exception e) 
        {
            e.printStackTrace();
            flag=false;
            try 
            {
                con.rollback();
            } 
            catch (SQLException sex) 
            {sex.printStackTrace();
            	LoggerManager.writeLogSevere(sex);
            }
        }
        return flag;        
    }
    
    
     //Change Secret Question
    public boolean changeQuestion(Profile regbean)
    {
        String loginid=regbean.getLoginID();
        String password=regbean.getPassword();
        String secretquestid=regbean.getSecretQuestionID();
        
        String secretans=regbean.getSecretAnswer();
        System.out.println(loginid+"==="+password);
        CallableStatement cstmt;
        int i=0;
        try 
        {   
           
            	con=getConnection();
            	//con.setAutoCommit(false);
                
               
                cstmt=con.prepareCall("update  userdetails set forgotpwquestion=?,forgotpwanswer=? where loginid=? and password=?");
                cstmt.setString(1,secretquestid);
                cstmt.setString(2,secretans);
            
                cstmt.setString(3,loginid);
                cstmt.setString(4,password);
               
                int n= cstmt.executeUpdate();

                if(n>0)
                {
                    flag=true;
                    con.commit();
                }
                else
                {
                    flag=false;
                    con.rollback();
                }
           
            con.close();
        }
        catch (Exception ex) 
        {   ex.printStackTrace();
        }
        return flag;        
    }
    
     //Recover Password using Existed Question
    public String recoverPasswordByQuestion(Profile regbean)
    {
        String password;
        String loginid=regbean.getLoginID();
        String secretquestid=regbean.getSecretQuestionID();
        String secretans=regbean.getSecretAnswer();
        System.out.println("Loginid"+loginid);
        System.out.println("Secrete"+secretquestid);
        System.out.println("answer"+secretans);
        try 
        {con=getConnection();
        	con.setAutoCommit(true); 
            CallableStatement cstmt=con.prepareCall("{call RecoverPassword(?,?,?,?)}");
            cstmt.setString(1,loginid);
            cstmt.setString(2,secretquestid);
            cstmt.setString(3,secretans);
            cstmt.registerOutParameter(4,Types.VARCHAR);           
            cstmt.execute();
            password=cstmt.getString(4);
            con.close();
        } 
        catch (SQLException ex) 
        {ex.printStackTrace();
        	LoggerManager.writeLogSevere(ex);
            password="";
        }
        catch (Exception e) 
        {
        	LoggerManager.writeLogSevere(e);
            password="";
        }
        return password;        
    }
    public String  checkUser(String userName)
    {
 	   String user=null;
 	   System.out.println("username"+userName);
 	   try 
 	   
        {con=getConnection();
        	con.setAutoCommit(true); 
            CallableStatement cstmt=con.prepareCall("{ call loginidavailablity(?,?) }");
            cstmt.setString(1, userName);
            cstmt.registerOutParameter(2,Types.VARCHAR);           
            cstmt.execute();
            user=cstmt.getString(2);
            con.close();
        } 
        catch (SQLException ex) 
        {
        	ex.printStackTrace();
        	LoggerManager.writeLogSevere(ex);
            user=null;
        }
        catch (Exception e) 
        {
        	e.printStackTrace();
            
        	LoggerManager.writeLogSevere(e);
        	user=null;
        }
        return user;        
    }
    public int getUserid(String name)
    {
    	Connection con=null;
    	try{
    		con=getConnection();
    		PreparedStatement pst=con.prepareStatement("select userid from userdetails where loginid=?");
    		pst.setString(1,name);
    		ResultSet rs=pst.executeQuery();
    		while(rs.next())
    		{
    			return rs.getInt(1);
    	}
    		con.close();
    	}catch(Exception e)
    	{
    		e.printStackTrace();
    		LoggerManager.writeLogInfo(e);
    	}
    	return 0;
    }
}
   
