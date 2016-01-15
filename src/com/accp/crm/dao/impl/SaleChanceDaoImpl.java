package com.accp.crm.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.accp.crm.dao.SaleChanceDao;
import com.accp.crm.pojo.SaleChance;

public class SaleChanceDaoImpl extends BaseDaoImpl implements SaleChanceDao {

	/**
	 * 添加销售机会
	 */
	public boolean add(SaleChance saleChance){
		boolean flag = false;
		getSession().save(saleChance);
		flag = true;
		return flag;
	}

	/**
	 * 通过ID查找销售机会
	 */
	public SaleChance selectById(Integer id) {
		SaleChance saleChance = (SaleChance) getSession().get(SaleChance.class, id);
		return saleChance;
	}

	/**
	 * 更新销售机会
	 */
	public boolean update(SaleChance saleChance) {
		boolean flag = false;
		getSession().update(saleChance);
		flag = true;
		return flag;
	}

	/**
	 * 删除销售机会
	 */
	public boolean delete(SaleChance saleChance) {
		boolean flag = false;
		getSession().delete(saleChance);
		flag = true;
		return flag;
	}

	/**
	 * 分页查看，获取总记录数。
	 */

	public int totals(String className,String[] keys,String[] values) {
		
		StringBuffer hql = new StringBuffer("select count(*) from ");
		hql.append(className).append(" where 1=1 ");
		for(int i=0;keys!=null&&i<keys.length;i++){
			hql.append(" and ").append(keys[i]).append(" like '%")
			.append(values[i]).append("%'");
		}
		hql.append(" and status = 0");
		Query query = this.getSession().createQuery(hql.toString());
		int total = Integer.parseInt(query.list().get(0).toString());
		return total;
	}
	/**
	 * 分页查看，查看首页
	 */
	
	public List selectByPages(String className, int pageNo, int pageSize,String []keys,String []values) {
		StringBuffer hql = new StringBuffer("from ");
		hql.append(className).append(" where 1=1 ");
		for(int i=0;keys!=null&&i<keys.length;i++){
			hql.append(" and ").append(keys[i]).append(" like '%")
			.append(values[i]).append("%'");
		}
		hql.append(" and status = 0");
		hql.append(" order by id");
		Query query = this.getSession().createQuery(hql.toString());
		query.setFirstResult((pageNo - 1) * pageSize);//每页显示的第一条记录
		query.setMaxResults(pageSize);//每页显示的记录数
		return query.list();
	}

}

