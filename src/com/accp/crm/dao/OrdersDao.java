package com.accp.crm.dao;

import java.util.List;
import com.accp.crm.pojo.Orders;


public interface OrdersDao extends BaseDao {
	/**
	 * 分页查看，获取总记录数。
	 * @param className
	 * @return
	 */
	public int totals(String className,String []keys,String []values,String custno);
	/**
	 * 分页查看，查看首页
	 * @param className
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public List<Orders> selectByPages(String className, int pageNo, int pageSize,String []keys,String []values,String custno);
	/**
	 * 按ID查询订单
	 * @param oid
	 * @return
	 */
	public Orders selectById(Integer oid);
	/**
	 * 统计客户贡献
	 * @param cust
	 * @param year
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List reptTotal(String cust,String year);
}
