package com.accp.crm.dao.impl;

import java.util.List;

import com.accp.crm.dao.CustInfoDao;
import com.accp.crm.pojo.CustInfo;

public class CustInfoDaoImpl extends BaseDaoImpl implements CustInfoDao {
	/**
	 * 添加客户
	 */
	@Override
	public boolean add(CustInfo custInfo) {
		boolean flag = false;
		getSession().save(custInfo);
		flag = true;
		return flag;
	}
	/**
	 * 通过ID查找
	 */
	@Override
	public CustInfo selectById(Integer id) {
		List<CustInfo> list = getSession().createQuery("from CustInfo where id = "+id).list();
		return list.get(0);
	}
	/**
	 * 更新
	 */
	@Override
	public boolean update(CustInfo custInfo) {
		boolean flag = false;
		getSession().update(custInfo);
		flag = true;
		return flag;
	}
	/**
	 * 删除
	 */
	@Override
	public boolean delete(CustInfo custInfo) {
		boolean flag = false;
		getSession().delete(custInfo);
		flag = true;
		return flag;
	}
	/**
	 * 按类型统计客户
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public List reptByType(String type) {
		String hql = "select new CustInfo("+type+" as type,count(*) as total) from CustInfo group by "+type;
		List list = getSession().createQuery(hql).list();
		return list;
	}
	
}
