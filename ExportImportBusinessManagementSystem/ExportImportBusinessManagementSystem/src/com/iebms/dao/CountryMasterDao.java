package com.iebms.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.*;

import com.iebms.dao.AbstractDataAccessObject;
import com.iebms.util.CoreList;
import com.iebms.util.LoggerManager;
import com.yourcompany.struts.form.CountryMasterForm;

public class CountryMasterDao extends AbstractDataAccessObject {
	public boolean insertCountryMaster(CountryMasterForm cmform) {
		java.sql.Connection con = null;
		boolean flag = false;
		try {
			int n = getSequenceID("CountryMaster", "CountryId");
			con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into CountryMaster values(?,?,?,?,?,?)");
			ps.setInt(1, n);
			ps.setString(2, cmform.getCountryName());
			ps.setString(3, cmform.getAbbr());

			try {
				File afile = new File(cmform.getCountryMap());
				FileInputStream fs = new FileInputStream(afile);
				ps.setBinaryStream(4, fs, (int) afile.length());
			} catch (Exception e) {
				ps.setBinaryStream(4, null, 1024);
			}
			ps.setInt(5, cmform.getCountryArea());
			ps.setString(6, cmform.getDescription());

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

	public CoreList ViewCountryMaster(String storepath) {
		CoreList v = new CoreList();
		java.sql.Connection con = null;
		CountryMasterForm cmform = null;
		try {
			con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from CountryMaster");

			while (rs.next()) {
				cmform = new CountryMasterForm();
				int id = rs.getInt(1);
				cmform.setCountryId(rs.getInt(1));
				cmform.setCountryName(rs.getString(2));
				cmform.setAbbr(rs.getString(3));
//				Blob b = rs.getBlob(4);
//				byte b1[] = b.getBytes(1, (int) b.length());
//				OutputStream fout = new FileOutputStream(storepath + "/" + id
//						+ ".gif");
//				fout.write(b1);
//				cmform.setCountryMap(id + ".gif");
				cmform.setCountryArea(rs.getInt(5));
				cmform.setDescription(rs.getString(6));
				v.add(cmform);
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

	public CountryMasterForm ViewCountryMasterById(String storepath,
			int CountryId) {
		CountryMasterForm cmform = new CountryMasterForm();
		java.sql.Connection con = null;

		try {

			con = getConnection();

			PreparedStatement ps = con
					.prepareStatement("select * from CountryMaster where CountryId = ? ");
			ps.setInt(1, CountryId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				cmform = new CountryMasterForm();
				int id = rs.getInt(1);
				cmform.setCountryId(rs.getInt(1));
				cmform.setCountryName(rs.getString(2));
				cmform.setAbbr(rs.getString(3));
				Blob b = rs.getBlob(4);
				byte b1[] = b.getBytes(1, (int) b.length());
				OutputStream fout = new FileOutputStream(storepath + "/" + id
						+ ".gif");
				fout.write(b1);
				cmform.setCountryMap(id + ".gif");
				cmform.setCountryArea(rs.getInt(5));
				cmform.setDescription(rs.getString(6));

			}

		} catch (Exception e) {

		} finally {
			try {
				con.close();
			} catch (Exception e) {
				LoggerManager.writeLogInfo(e);
			}
		}
		return cmform;

	}

	public boolean deleteCountryMaster(int CountryId) {
		java.sql.Connection con = null;
		boolean flag = false;
		try {

			con = getConnection();

			PreparedStatement ps = con
					.prepareStatement("delete from CountryMaster where CountryId = ? ");
			ps.setInt(1, CountryId);
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

	public boolean UpdateCountryMaster(CountryMasterForm cmform) {
		java.sql.Connection con = null;
		boolean flag = false;
		try {
			
			con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("update CountryMaster set Countryname = ?,abbr = ?, Countrymap = ?,countryarea = ?,description = ? where CountryId = ? ");
			ps.setInt(6, cmform.getCountryId());
			ps.setString(1, cmform.getCountryName());
			ps.setString(2, cmform.getAbbr());
			
			try{
			String map = cmform.getCountryMap();
			if (map.equalsIgnoreCase("")) {
				map = cmform.getCountryMap1();
			}
			File afile = new File(map);
			FileInputStream fs = new FileInputStream(afile);
			}catch (Exception e) {
				// TODO: handle exception
			}
			ps.setBinaryStream(3, null, 1024);
			ps.setInt(4, cmform.getCountryArea());
			ps.setString(5, cmform.getDescription());
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

	public String getCountryName(int countryid) {
		String countryname = "";
		Connection con = null;
		try {
			con = getConnection();
			PreparedStatement pst = con
					.prepareStatement("Select countryname from countrymaster where countryid=?");
			pst.setInt(1, countryid);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				countryname = rs.getString(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return countryname;
	}

	public CoreList ViewCountryIDs() {
		CoreList v = new CoreList();
		java.sql.Connection con = null;
		CountryMasterForm cmform = null;
		try {
			con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st
					.executeQuery("select countryid,countryname from CountryMaster");

			while (rs.next()) {
				cmform = new CountryMasterForm();
				int id = rs.getInt(1);
				cmform.setCountryId(rs.getInt(1));
				cmform.setCountryName(rs.getString(2));

				v.add(cmform);
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

}
