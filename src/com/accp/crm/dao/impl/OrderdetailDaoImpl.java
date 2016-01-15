package com.accp.crm.dao.impl;

import java.util.List;

import com.accp.crm.dao.OrderdetailDao;
import com.accp.crm.pojo.Orderdetail;

public class OrderdetailDaoImpl extends BaseDaoImpl implements OrderdetailDao {
	/**
	 * 查询明细
	 */
	@Override
	public List<Orderdetail> selectByOrderId(Integer orderid) {
		List<Orderdetail> list = getSession().createQuery("from Orderdetail where orderid = "+orderid).list();
		return list;
	}

}
