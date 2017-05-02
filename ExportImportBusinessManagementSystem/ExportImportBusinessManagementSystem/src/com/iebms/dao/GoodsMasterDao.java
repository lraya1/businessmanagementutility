package com.iebms.dao;

import java.sql.*;

import com.iebms.dao.AbstractDataAccessObject;
import com.iebms.util.CoreHash;
import com.iebms.util.CoreList;
import com.iebms.util.LoggerManager;
import com.yourcompany.struts.form.GoodsMasterForm;

public class GoodsMasterDao extends AbstractDataAccessObject {
	public boolean insertGoodsMaster(GoodsMasterForm rModel) {
		java.sql.Connection con = null;
		boolean flag = false;
		try {
			int n = getSequenceID("GoodsMaster", "goodsId");
			con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into Goodsmaster values(?,?,?)");
			ps.setInt(1, n);
			ps.setString(2, rModel.getGoodsName());
			ps.setString(3, rModel.getGoodsDesc());
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

	public CoreList ViewGoodsMaster() {
		CoreList v = new CoreList();
		java.sql.Connection con = null;
		GoodsMasterForm rModel = null;
		try {
			con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from GoodsMaster");

			while (rs.next()) {
				rModel = new GoodsMasterForm();
				rModel.setGoodsId(rs.getInt(1));
				rModel.setGoodsName(rs.getString(2));
				rModel.setGoodsDesc(rs.getString(3));

				v.add(rModel);
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

	public GoodsMasterForm ViewGoodsMasterById(int GoodsId) {
		GoodsMasterForm rModel = new GoodsMasterForm();
		java.sql.Connection con = null;

		try {

			con = getConnection();
			Statement st = con.createStatement();
			PreparedStatement ps = con
					.prepareStatement("select * from GoodsMaster where GoodsId = ? ");
			ps.setInt(1, GoodsId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				rModel.setGoodsId(rs.getInt(1));
				rModel.setGoodsName(rs.getString(2));
				rModel.setGoodsDesc(rs.getString(3));

			}

		} catch (Exception e) {

		} finally {
			try {
				con.close();
			} catch (Exception e) {
				LoggerManager.writeLogInfo(e);
			}
		}
		return rModel;

	}

	public boolean deleteGoodsMaster(int GoodsId) {
		java.sql.Connection con = null;
		boolean flag = false;
		try {

			con = getConnection();

			PreparedStatement ps = con
					.prepareStatement("delete from GoodsMaster where GoodsId = ? ");
			ps.setInt(1, GoodsId);
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

	public boolean UpdateGoodsMaster(GoodsMasterForm rModel) {
		java.sql.Connection con = null;
		boolean flag = false;
		try {

			con = getConnection();
			PreparedStatement ps = con
					.prepareStatement("update GoodsMaster set GoodsName = ?,GoodsDesc = ? where GoodsId = ? ");
			ps.setString(1, rModel.getGoodsName());
			ps.setString(2, rModel.getGoodsDesc());
			ps.setInt(3, rModel.getGoodsId());
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

	public String getGoodsName(int Goodsid) {
		String goodsName = "";
		Connection con = null;
		try {
			con = getConnection();
			PreparedStatement pst = con
					.prepareStatement("Select Goodsname from Goodsmaster where Goodsid=?");
			pst.setInt(1, Goodsid);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				goodsName = rs.getString(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return goodsName;
	}

	public CoreHash listCategoryNames() {
		CoreHash aCoreHash = new CoreHash();
		aCoreHash.clear();
		int categoryid;
		Statement st;
		Connection con = null;
		try {
			con = getConnection();
			st = con.createStatement();
			ResultSet rs = st
					.executeQuery("select Goodsid,Goodsname from Goodsmaster order by Goodsid");
			while (rs.next()) {
				aCoreHash.put(new Integer(rs.getInt(1)), rs.getString(2));
			}
		} catch (SQLException e) {
			LoggerManager.writeLogWarning(e);
		} finally {
			try {
				con.close();
			} catch (SQLException se) {
				LoggerManager.writeLogWarning(se);
			}
		}
		return aCoreHash;
	}

}
