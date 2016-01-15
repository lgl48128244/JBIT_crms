package com.accp.crm.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.accp.crm.dao.BaseDao;

public class BaseDaoImpl implements BaseDao {

	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	/**
	 * 获取Session
	 */
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	/**
	 * 分页查看，获取总记录数。
	 */

	public int total(String className,String[] keys,String[] values) {
		
		StringBuffer hql = new StringBuffer("select count(*) from ");
		hql.append(className).append(" where 1=1 ");
		for(int i=0;keys!=null&&i<keys.length;i++){
			hql.append(" and ").append(keys[i]).append(" like '%")
			.append(values[i]).append("%'");
		}
		Query query = this.getSession().createQuery(hql.toString());
		int total = Integer.parseInt(query.list().get(0).toString());
		return total;
	}
	/**
	 * 分页查看，查看首页
	 */
	
	public List selectByPage(String className, int pageNo, int pageSize,String []keys,String []values) {
		StringBuffer hql = new StringBuffer("from ");
		hql.append(className).append(" where 1=1 ");
		for(int i=0;keys!=null&&i<keys.length;i++){
			hql.append(" and ").append(keys[i]).append(" like '%")
			.append(values[i]).append("%'");
		}
		hql.append(" order by id");
		Query query = this.getSession().createQuery(hql.toString());
		query.setFirstResult((pageNo - 1) * pageSize);//每页显示的第一条记录
		query.setMaxResults(pageSize);//每页显示的记录数
		return query.list();
	}

}
