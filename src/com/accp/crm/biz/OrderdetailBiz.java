package com.accp.crm.biz;

import java.util.List;

import com.accp.crm.pojo.Orderdetail;

public interface OrderdetailBiz {
	/**
	 * 按订单编号查询明细
	 * @return
	 */
	public List<Orderdetail> selectByOrderId(Integer orderid);
}
