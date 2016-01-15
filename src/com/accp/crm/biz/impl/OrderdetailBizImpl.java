package com.accp.crm.biz.impl;

import java.util.List;

import com.accp.crm.biz.OrderdetailBiz;
import com.accp.crm.dao.OrderdetailDao;
import com.accp.crm.pojo.Orderdetail;

public class OrderdetailBizImpl implements OrderdetailBiz {
	private OrderdetailDao orderdetailDao;

	public void setOrderdetailDao(OrderdetailDao orderdetailDao) {
		this.orderdetailDao = orderdetailDao;
	}
	/**
	 * 查询明细
	 */
	@Override
	public List<Orderdetail> selectByOrderId(Integer orderid) {
		return orderdetailDao.selectByOrderId(orderid);
	}
	
}
