package com.accp.crm.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.accp.crm.dao.LostDao;
import com.accp.crm.pojo.Custlost;

public class LostDaoImpl extends BaseDaoImpl implements LostDao {
	/**
	 * 按ID查询流失客户
	 */
	@Override
	public Custlost selectById(Integer lostid) {
		List<Custlost> list = getSession().createQuery("from Custlost where lostid = "+lostid).list();
		return list.get(0);
	}
	/**
	 * 更新流失状态
	 */
	@Override
	public boolean update(Custlost custlost) {
		boolean flag = false;
		getSession().update(custlost);
		flag = true;
		return flag;
	}
	
	/**
	 * 分页查看，获取总记录数。
	 */

	public int repttotal(String className,String[] keys,String[] values) {
		
		StringBuffer hql = new StringBuffer("select count(*) from ");
		hql.append(className).append(" where 1=1 ");
		for(int i=0;keys!=null&&i<keys.length;i++){
			hql.append(" and ").append(keys[i]).append(" like '%")
			.append(values[i]).append("%'");
		}
		hql.append(" and status = '已经流失'");
		Query query = this.getSession().createQuery(hql.toString());
		int total = Integer.parseInt(query.list().get(0).toString());
		return total;
	}
	/**
	 * 分页查看，查看首页
	 */
	
	public List reptselectByPage(String className, int pageNo, int pageSize,String []keys,String []values) {
		StringBuffer hql = new StringBuffer("from ");
		hql.append(className).append(" where 1=1 ");
		for(int i=0;keys!=null&&i<keys.length;i++){
			hql.append(" and ").append(keys[i]).append(" like '%")
			.append(values[i]).append("%'");
		}
		hql.append(" and status = '已经流失'");
		hql.append(" order by id");
		Query query = this.getSession().createQuery(hql.toString());
		query.setFirstResult((pageNo - 1) * pageSize);//每页显示的第一条记录
		query.setMaxResults(pageSize);//每页显示的记录数
		return query.list();
	}
}
