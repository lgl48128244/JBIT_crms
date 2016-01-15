package com.accp.crm.biz.impl;

import java.util.List;

import com.accp.crm.biz.OrdersBiz;
import com.accp.crm.dao.OrdersDao;
import com.accp.crm.pojo.Orders;

public class OrdersBizImpl implements OrdersBiz {
	private OrdersDao ordersDao;
	public void setOrdersDao(OrdersDao ordersDao) {
		this.ordersDao = ordersDao;
	}
	/**
	 * 获取总记录数
	 */
	@Override
	public int totals(String className, String[] keys, String[] values,
			String custno) {
		return ordersDao.totals(className, keys, values, custno);
	}
	/**
	 * 分页显示
	 */
	@Override
	public List<Orders> selectByPages(String className, int pageNo,
			int pageSize, String[] keys, String[] values, String custno) {
		return ordersDao.selectByPages(className, pageNo, pageSize, keys, values, custno);
	}
	/**
	 * 获取总页数
	 */
	@Override
	public int totalPages(int line, String className, String custno) {
		int total = ordersDao.totals(className, new String[] {}, new String[] {}, custno);
		int pageNo = total / line;
		if(total % line > 0){
			pageNo++;
		}
		return pageNo;
	}
	/**
	 * 按ID查询订单
	 */
	@Override
	public Orders selectById(Integer oid) {
		return ordersDao.selectById(oid);
	}
	/**
	 * 统计客户贡献
	 */
	@Override
	public List reptTotal(String cust, String year) {
		return ordersDao.reptTotal(cust, year);
	}
	
}	
