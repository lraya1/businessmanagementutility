package com.iebms.db;

import com.iebms.dao.AbstractDataAccessObject;

public class DBFactory
{
	public DBFactory()
	{
		new AbstractDataAccessObject().getConnection();
	}
}
