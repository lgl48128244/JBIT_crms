package com.accp.crm.dao;

import java.util.List;

import com.accp.crm.pojo.Orderdetail;

public interface OrderdetailDao extends BaseDao {
	/**
	 * 按订单编号查询明细
	 * @return
	 */
	public List<Orderdetail> selectByOrderId(Integer orderid);
}
