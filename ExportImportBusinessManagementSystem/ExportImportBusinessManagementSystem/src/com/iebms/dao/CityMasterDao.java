package com.iebms.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.*;

import com.iebms.dao.AbstractDataAccessObject;
import com.iebms.util.CoreList;
import com.iebms.util.LoggerManager;
import com.yourcompany.struts.form.CityMasterForm;

public class CityMasterDao extends AbstractDataAccessObject {
	public boolean insertCityMaster(CityMasterForm mcform) {
		java.sql.Connection con = null;
		boolean flag = false;
		try {
			int n = getSequenceID("CityMaster", "CityId");
			con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into CityMaster values(?,?,?,?,?,?)");
			ps.setInt(1, n);
			ps.setString(2, mcform.getCityName());
			ps.setString(3, mcform.getAbbr());
			try {
				File afile = new File(mcform.getCityMap());
				FileInputStream fs = new FileInputStream(afile);
				ps.setBinaryStream(4, fs, (int) afile.length());
			} catch (Exception e) {
				ps.setBinaryStream(4, null, 1024);
			}
			ps.setString(5, mcform.getDescription());
			ps.setInt(6, mcform.getCountryId());

			int i = ps.executeUpdate();
			if (i > 0)
				flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (Exception e) {
				LoggerManager.writeLogInfo(e);
			}
		}
		return flag;

	}

	public CoreList ViewCityMaster(String storepath) {
		CoreList v = new CoreList();
		java.sql.Connection con = null;
		CityMasterForm mcform = null;
		try {
			con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st
					.executeQuery("select cm.cityid,cm.cityname,cm.abbr,cm.citymap,cm.description,ca.countryname from CityMaster cm,countrymaster ca where cm.countryid=ca.countryid");

			while (rs.next()) {
				mcform = new CityMasterForm();
				int id = rs.getInt(1);
				mcform.setCityId(rs.getInt(1));
				mcform.setCityName(rs.getString(2));
				mcform.setAbbr(rs.getString(3));
				/*
				 * Blob b=rs.getBlob(4); byte
				 * b1[]=b.getBytes(1,(int)b.length()); OutputStream fout=new
				 * FileOutputStream(storepath+"/"+id+".gif"); fout.write(b1);
				 * mcform.setCityMap(id+".gif");
				 */
				mcform.setDescription(rs.getString(5));
				mcform.setCountryname(rs.getString(6));
				v.add(mcform);
			}

		} catch (Exception e) {

		} finally {
			try {
				con.close();
			} catch (Exception e) {
				LoggerManager.writeLogInfo(e);
			}
		}
		return v;

	}

	public CoreList ViewProfitsMaster() {
		CoreList v = new CoreList();
		java.sql.Connection con = null;
		CityMasterForm mcform = null;
		try {
			con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st
					.executeQuery("select unique(REPLACE(SUBSTR(BILLMASTER.BILLDATE, 8, 8),'/','')) as year from BILLMASTER order by year desc");
			int total =0,i = 1;
			
			while (rs.next()) {
				mcform = new CityMasterForm();
				mcform.setPyear(rs.getString(1));
				Statement stt = con.createStatement();
				ResultSet rss = stt
						.executeQuery("select * from BILLMASTER where REPLACE(SUBSTR(BILLMASTER.BILLDATE, 8, 8),'/','') = '"+rs.getString(1)+"'");
				while (rss.next()) {
					total = total+rss.getInt(7);
					i++;
				}		
				mcform.setPper(total/i);
				
				/*
				 * Blob b=rs.getBlob(4); byte
				 * b1[]=b.getBytes(1,(int)b.length()); OutputStream fout=new
				 * FileOutputStream(storepath+"/"+id+".gif"); fout.write(b1);
				 * mcform.setCityMap(id+".gif");
				 */

				v.add(mcform);
			}


		} catch (Exception e) {
System.out.println(e);
		} finally {
			try {
				con.close();
			} catch (Exception e) {
				LoggerManager.writeLogInfo(e);
			}
		}
		return v;

	}

	
	
	
	
	
	public CityMasterForm ViewCityMasterById(String storepath, int CityId) {
		CityMasterForm mcform = new CityMasterForm();
		java.sql.Connection con = null;

		try {

			con = getConnection();

			PreparedStatement ps = con
					.prepareStatement("select cm.cityid,cm.cityname,cm.abbr,cm.citymap,cm.description,cm.countryid,ca.countryname from CityMaster cm,countrymaster ca where cm.countryid=ca.countryid and cm.CityId = ? ");
			ps.setInt(1, CityId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				mcform = new CityMasterForm();
				int id = rs.getInt(1);
				mcform.setCityId(rs.getInt(1));
				mcform.setCityName(rs.getString(2));
				mcform.setAbbr(rs.getString(3));
				/*
				 * Blob b=rs.getBlob(4); byte
				 * b1[]=b.getBytes(1,(int)b.length()); OutputStream fout=new
				 * FileOutputStream(storepath+"/"+id+".gif"); fout.write(b1);
				 * mcform.setCityMap(id+".gif");
				 */
				mcform.setDescription(rs.getString(5));
				mcform.setCountryId(rs.getInt(6));
				mcform.setCountryname(rs.getString(7));

			}

		} catch (Exception e) {

		} finally {
			try {
				con.close();
			} catch (Exception e) {
				LoggerManager.writeLogInfo(e);
			}
		}
		return mcform;

	}

	public boolean deleteCityMaster(int CityId) {
		java.sql.Connection con = null;
		boolean flag = false;
		try {

			con = getConnection();

			PreparedStatement ps = con
					.prepareStatement("delete from CityMaster where CityId = ? ");
			ps.setInt(1, CityId);
			int i = ps.executeUpdate();
			if (i > 0)
				flag = true;

		} catch (Exception e) {
		} finally {
			try {
				con.close();
			} catch (Exception e) {
				LoggerManager.writeLogInfo(e);
			}
		}
		return flag;

	}

	public boolean UpdateCityMaster(CityMasterForm mcform) {
		java.sql.Connection con = null;
		boolean flag = false;
		try {
			
			con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("update CityMaster set cityname = ?,abbr = ?, citymap = ?,description = ?,countryid = ? where CityId = ? ");
			ps.setInt(6, mcform.getCityId());
			ps.setString(1, mcform.getCityName());
			ps.setString(2, mcform.getAbbr());
			try {
				String map = mcform.getCityMap();
				if (map.equalsIgnoreCase("")) {
					map = mcform.getCityMap1();
				}
				File afile = new File(map);
				FileInputStream fs = new FileInputStream(afile);
				ps.setBinaryStream(3, fs, (int) afile.length());
			} catch (Exception e) {
				ps.setBinaryStream(3, null, 1024);
			}
			ps.setString(4, mcform.getDescription());
			ps.setInt(5, mcform.getCountryId());
			int i = ps.executeUpdate();
			if (i > 0)
				flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (Exception e) {
				LoggerManager.writeLogInfo(e);
			}
		}
		return flag;

	}

	public String getCityName(int cityid) {
		Connection con = null;
		String cityname = "";
		try {
			con = getConnection();
			PreparedStatement pst = con
					.prepareStatement("Select cityname from citymaster where cityid=?");
			pst.setInt(1, cityid);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				cityname = rs.getString(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cityname;
	}
}
