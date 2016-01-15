package com.accp.crm.dao.impl;

import java.util.List;

import com.accp.crm.dao.PowerDao;
import com.accp.crm.pojo.Power;

public class PowerDaoImpl extends BaseDaoImpl implements PowerDao {
	/**
	 * 获取全部权限
	 */
	@Override
	public List<Power> selectAll() {
		List<Power> list = getSession().createQuery("from Power").list();
		return list;
	}
	/**
	 * 通过ID获取权限
	 */
	@Override
	public Power selectById(String powerid) {
		List<Power> list = getSession().createQuery("from Power where powerid = '"+powerid+"'").list();
		return list.get(0);
	}

}
