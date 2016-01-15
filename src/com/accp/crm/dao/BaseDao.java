package com.accp.crm.dao;

import java.util.List;

import org.hibernate.Session;

public interface BaseDao {
	/**
	 * 获取Session
	 * @return
	 */
	public Session getSession();
	/**
	 * 分页查看，获取总记录数。
	 * @param className
	 * @return
	 */
	public int total(String className,String []keys,String []values);
	/**
	 * 分页查看，查看首页
	 * @param className
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List selectByPage(String className, int pageNo, int pageSize,String []keys,String []values);

}
