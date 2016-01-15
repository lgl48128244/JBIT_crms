package com.accp.crm.dao.impl;

import java.util.List;

import com.accp.crm.dao.ActivityDao;
import com.accp.crm.pojo.Activity;

public class ActivityDaoImpl extends BaseDaoImpl implements ActivityDao {
	/**
	 * 按客户查询交往记录
	 */
	@Override
	public List<Activity> selectByCust(String custno) {
		List<Activity> list = getSession().createQuery("from Activity where custno = '"+custno+"'").list();
		return list;
	}
	/**
	 * 按ID查找
	 */
	@Override
	public Activity selectById(Integer aid) {
		List<Activity> list = getSession().createQuery("from Activity where aid = "+aid).list();
		return list.get(0);
	}
	/**
	 * 添加
	 */
	@Override
	public boolean add(Activity activity) {
		boolean flag = false;
		getSession().save(activity);
		flag = true;
		return flag;
	}
	/**
	 * 删除
	 */
	@Override
	public boolean delete(Activity activity) {
		boolean flag = false;
		getSession().delete(activity);
		flag = true;
		return flag;
	}
	/**
	 * 更新
	 */
	@Override
	public boolean update(Activity activity) {
		boolean flag = false;
		getSession().update(activity);
		flag = true;
		return flag;
	}

}
