package com.accp.crm.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.accp.crm.dao.OrdersDao;
import com.accp.crm.pojo.Orders;

public class OrdersDaoImpl extends BaseDaoImpl implements OrdersDao {
	/**
	 * 分页查询总订单数
	 */
	@Override
	public int totals(String className, String[] keys, String[] values,String custno) {
		StringBuffer hql = new StringBuffer("select count(*) from ");
		hql.append(className).append(" where 1=1 ");
		for(int i=0;keys!=null&&i<keys.length;i++){
			hql.append(" and ").append(keys[i]).append(" like '%")
			.append(values[i]).append("%'");
		}
		hql.append(" and custno = '").append(custno).append("'");
		Query query = this.getSession().createQuery(hql.toString());
//		int total = query.list().size();
		int total = Integer.parseInt(query.list().get(0).toString());
		return total;
	}
	/**
	 * 分页查询
	 */
	@Override
	public List<Orders> selectByPages(String className, int pageNo, int pageSize,
			String[] keys, String[] values,String custno) {
		StringBuffer hql = new StringBuffer("from ");
		hql.append(className).append(" where 1=1 ");
		for(int i=0;keys!=null&&i<keys.length;i++){
			hql.append(" and ").append(keys[i]).append(" like '%")
			.append(values[i]).append("%'");
		}
		hql.append(" and custno = '").append(custno).append("' ");
		hql.append(" order by id");
		Query query = this.getSession().createQuery(hql.toString());
		query.setFirstResult((pageNo - 1) * pageSize);//每页显示的第一条记录
		query.setMaxResults(pageSize);//每页显示的记录数
		return query.list();
	}
	/**
	 * 按ID查询订单
	 */
	@Override
	public Orders selectById(Integer oid) {
		List<Orders> list = getSession().createQuery("from Orders where oid = "+oid).list();
		return list.get(0);
	}
	/**
	 * 统计客户贡献
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public List reptTotal(String cust, String year) {
		String hql = "select new Orders(o.custname,sum(d.total)) from Orders o,Orderdetail d where 1=1 and d.orderid = o.oid and custname like '%"+cust+"%' and odate like '%"+year+"%' group by o.custname";
		
		List list = getSession().createQuery(hql).list();
		return list;
	}

}
