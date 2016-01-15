package com.accp.crm.dao.impl;

import java.util.List;

import com.accp.crm.dao.ServiceDao;
import com.accp.crm.pojo.Service;

public class ServiceDaoImpl extends BaseDaoImpl implements ServiceDao {
	/**
	 * 添加服务
	 */
	@Override
	public boolean add(Service service) {
		boolean flag = false;
		getSession().save(service);
		flag = true;
		return flag;
	}
	/**
	 * 更新服务
	 */
	@Override
	public boolean update(Service service) {
		boolean flag = false;
		getSession().update(service);
		flag = true;
		return flag;
	}
	/**
	 * 删除服务
	 */
	@Override
	public boolean delete(Service service) {
		boolean flag = false;
		getSession().delete(service);
		flag = true;
		return flag;
	}
	/**
	 * 按ID查找服务
	 */
	@Override
	public Service selectById(Integer sid) {
		List<Service> list = getSession().createQuery("from Service where sid = "+sid).list();
		return list.get(0);
	}
	/**
	 * 统计服务类别
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public List selectByType(String year) {
		String hql = "select new Service(type,count(*) as total) from Service where createdate like '%"+year+"%' group by type";
		List list = getSession().createQuery(hql).list();
		return list;
	}

}
