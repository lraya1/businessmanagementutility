package com.iebms.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.*;

import com.iebms.dao.AbstractDataAccessObject;
import com.iebms.util.CoreHash;
import com.iebms.util.CoreList;
import com.iebms.util.DateWrapper;
import com.iebms.util.LoggerManager;
import com.yourcompany.struts.form.GoodsDetailsForm;

public class GoodsDetailsDao extends AbstractDataAccessObject {
	public boolean insertGoodsDetails(GoodsDetailsForm pdform) {
		java.sql.Connection con = null;
		boolean flag = false;
		try {
			System.out.println("this is image" + pdform.getItemImage());
			System.out.println("this is Video" + pdform.getItemLaunchVideo());
			int n = getSequenceID("GoodsDetails", "ItemId");
			con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into GoodsDetails values(?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, n);
			ps.setString(2, DateWrapper.parseDate(new java.util.Date()));
			ps.setInt(3, pdform.getGoodsId());
			ps.setInt(4, pdform.getCountryId());
			ps.setString(5, pdform.getItemName());
			try {
				File afile = new File(pdform.getItemImage());
				FileInputStream fs = new FileInputStream(afile);
				ps.setBinaryStream(6, fs, (int) afile.length());
				File afile1 = new File(pdform.getItemLaunchVideo());
				FileInputStream fs1 = new FileInputStream(afile1);
				ps.setBinaryStream(7, fs1, (int) afile1.length());
			} catch (Exception e) {
				ps.setBinaryStream(6, null, 1024);
				ps.setBinaryStream(7, null, 1024);
				// TODO: handle exception
			}
			ps.setString(8, pdform.getItemDesc());
			ps.setInt(9, pdform.getPrice());

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

	public CoreList ViewGoodsDetails(String storepath) {
		CoreList v = new CoreList();
		java.sql.Connection con = null;
		GoodsDetailsForm pdform = null;
		try {
			con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st
					.executeQuery("select pm.Goodsname,cm.countryname,pd.Goodsid,pd.countryid,pd.itemid,pd.itemname,pd.itemimage,pd.itemregdate,pd.itemlaunchvideo,pd.itemdesc,pd.price,pd.ITEMREGDATE from Goodsmaster pm,countrymaster cm,Goodsdetails pd where pd.Goodsid=pm.Goodsid and pd.countryid=cm.countryid");

			while (rs.next()) {
				pdform = new GoodsDetailsForm();
				pdform.setGoodsName(rs.getString(1));
				pdform.setCountryname(rs.getString(2));
				pdform.setGoodsId(rs.getInt(3));
				pdform.setCountryId(rs.getInt(4));

				int id = rs.getInt(5);
				pdform.setItemRegDate(rs.getString(12));

				pdform.setItemId(id);
				pdform.setItemName(rs.getString(6));

				/*Blob b = rs.getBlob(7);
				byte b1[] = b.getBytes(1, (int) b.length());
				OutputStream fout = new FileOutputStream(storepath + "/" + id
						+ ".jpg");
				fout.write(b1);
				pdform.setItemImage(id + ".jpg");
				pdform.setItemRegDate(DateWrapper.parseDate(rs.getDate(8)));

				Blob b2 = rs.getBlob(9);
				byte b3[] = b2.getBytes(1, (int) b2.length());
				OutputStream fout1 = new FileOutputStream(storepath + "/" + id
						+ ".wmv");
				fout1.write(b3);
				pdform.setItemLaunchVideo(id + ".wmv");*/
				pdform.setItemDesc(rs.getString(10));
				pdform.setPrice(rs.getInt(11));
				v.add(pdform);
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				con.close();
			} catch (Exception e) {
				LoggerManager.writeLogInfo(e);
			}
		}
		return v;

	}

	public GoodsDetailsForm ViewGoodsDetailsById(String storepath, int ItemId) {
		GoodsDetailsForm pdform = new GoodsDetailsForm();
		java.sql.Connection con = null;

		try {

			con = getConnection();

			PreparedStatement ps = con
					.prepareStatement("select * from GoodsDetails where ItemId = ? ");
			ps.setInt(1, ItemId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				pdform = new GoodsDetailsForm();
				int id = rs.getInt(1);
				pdform.setItemId(rs.getInt(1));
				pdform.setItemRegDate(DateWrapper.parseDate(rs.getDate(2)));
				pdform.setGoodsId(rs.getInt(3));
				pdform.setCountryId(rs.getInt(4));
				pdform.setItemName(rs.getString(5));
		/*		Blob b = rs.getBlob(6);
				byte b1[] = b.getBytes(1, (int) b.length());
				OutputStream fout = new FileOutputStream(storepath + "/" + id
						+ ".gif");
				fout.write(b1);
				pdform.setItemImage(id + ".gif");
				Blob b2 = rs.getBlob(7);
				byte b3[] = b.getBytes(1, (int) b2.length());
				OutputStream fout1 = new FileOutputStream(storepath + "/" + id
						+ ".wav");*/
//				fout1.write(b3);
//				pdform.setItemLaunchVideo(id + ".wav");
				pdform.setItemDesc(rs.getString(8));
				pdform.setPrice(rs.getInt(9));

			}

		} catch (Exception e) {

		} finally {
			try {
				con.close();
			} catch (Exception e) {
				LoggerManager.writeLogInfo(e);
			}
		}
		return pdform;

	}

	public boolean deleteGoodsDetails(int ItemId) {
		java.sql.Connection con = null;
		boolean flag = false;
		try {

			con = getConnection();

			PreparedStatement ps = con
					.prepareStatement("delete from GoodsDetails where ItemId = ? ");
			ps.setInt(1, ItemId);
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

	public boolean UpdateGoodsDetails(GoodsDetailsForm pdform) {
		java.sql.Connection con = null;
		boolean flag = false;
		try {
			

			con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("update GoodsDetails set itemregdate = ?,Goodsid = ?, countryid = ?,itemname = ?,itemimage = ?,ITEMLAUNCHVIDEO = ?,itemdesc = ?,price = ? where ItemId = ? ");
			ps.setInt(9, pdform.getItemId());
			ps.setString(1, DateWrapper.parseDate(pdform.getItemRegDate()));
			ps.setInt(2, pdform.getGoodsId());
			ps.setInt(3, pdform.getCountryId());
			ps.setString(4, pdform.getItemName());
			
			try{
			String itemimage = pdform.getItemImage();
			System.out.println("asdgfjasgdfj" + itemimage + "Asdfasdf");
			if (itemimage.equalsIgnoreCase("")) {
				itemimage = pdform.getItemImage1();
			}
			String itemlanuch = pdform.getItemLaunchVideo();
			if (itemlanuch.equalsIgnoreCase("")) {
				itemlanuch = pdform.getItemlanuch1();
			}
			File afile = new File(itemimage);
			FileInputStream fs = new FileInputStream(afile);
			ps.setBinaryStream(5,null, 1024);
			File afile1 = new File(itemlanuch);
			FileInputStream fs1 = new FileInputStream(afile1);
			
			ps.setBinaryStream(6, null, 1024);
			}catch (Exception e) {
				ps.setBinaryStream(5,null, 1024);
				ps.setBinaryStream(6, null, 1024);			}
			ps.setString(7, pdform.getItemDesc());
			ps.setInt(8, pdform.getPrice());
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

	public CoreList ViewGoodsDetails(String storepath, int Goodsid,
			int countryid) {
		CoreList v = new CoreList();
		java.sql.Connection con = null;
		GoodsDetailsForm pdform = null;
		try {
			con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st
					.executeQuery("select pm.Goodsname,cm.countryname,pd.Goodsid,pd.countryid,pd.itemid,pd.itemname,pd.itemimage,pd.itemdesc,pd.price from Goodsmaster pm,countrymaster cm,Goodsdetails pd where pd.Goodsid=pm.Goodsid and pd.countryid=cm.countryid and pd.Goodsid="
							+ Goodsid + " and pd.countryid=" + countryid + "");

			while (rs.next()) {
				pdform = new GoodsDetailsForm();
				pdform.setGoodsName(rs.getString(1));
				pdform.setCountryname(rs.getString(2));
				pdform.setGoodsId(rs.getInt(3));
				pdform.setCountryId(rs.getInt(4));

				int id = rs.getInt(5);

				pdform.setItemId(id);
				pdform.setItemName(rs.getString(6));

				/*Blob b = rs.getBlob(7);
				byte b1[] = b.getBytes(1, (int) b.length());
				OutputStream fout = new FileOutputStream(storepath + "/" + id
						+ ".gif");
				fout.write(b1);
				pdform.setItemImage(id + ".gif");*/
				pdform.setItemDesc(rs.getString(8));
				pdform.setPrice(rs.getInt(9));
				v.add(pdform);
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				con.close();
			} catch (Exception e) {
				LoggerManager.writeLogInfo(e);
			}
		}
		return v;

	}

	public String getItemname(int itemid) {
		String itemname = "";
		Connection con = null;
		try {
			con = getConnection();
			PreparedStatement pst = con
					.prepareStatement("Select itemname from Goodsdetails where itemid="
							+ itemid);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				itemname = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return itemname;
	}

	public int getItemPrice(int itemid) {
		int itemprice = 0;
		Connection con = null;
		try {
			con = getConnection();
			PreparedStatement pst = con
					.prepareStatement("Select price from Goodsdetails where itemid="
							+ itemid);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				itemprice = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return itemprice;
	}

	public CoreHash listItems() {

		CoreHash aCoreList = new CoreHash();
		aCoreList.clear();
		int itemid;
		Statement st;
		Connection con = null;
		GoodsDetailsForm item = null;
		try {
			con = getConnection();
			st = con.createStatement();
			ResultSet rs = st
					.executeQuery("select itemid,Goodsid,itemname,itemdesc,ITEMREGDATE from Goodsdetails order by Goodsid");
			while (rs.next()) {
				itemid = rs.getInt(1);
				item = new GoodsDetailsForm();
				item.setGoodsId(rs.getInt(2));
				item.setItemId(itemid);
				String itemname = rs.getString(3);
				item.setItemName(itemname);
				item.setItemDesc(rs.getString(4));
				item.setItemRegDate(rs.getString(5));

				aCoreList.put(new Integer(itemid), itemname);
			}
		} catch (SQLException e) {
			LoggerManager.writeLogWarning(e);
		} finally {
			try {
				con.close();
			} catch (Exception e) {
				LoggerManager.writeLogWarning(e);
			}
		}
		return aCoreList;
	}

	public double getBalance(int itemid)

	{
		double balance = 0;
		Connection con = null;
		try {
			con = getConnection();
			PreparedStatement pst = con
					.prepareStatement("select price from Goodsdetails where itemid=?");
			pst.setInt(1, itemid);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				balance = rs.getDouble(1);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return balance;
	}
}
