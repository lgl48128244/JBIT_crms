package com.accp.crm.biz.impl;

import java.util.List;

import com.accp.crm.biz.ActivityBiz;
import com.accp.crm.dao.ActivityDao;
import com.accp.crm.pojo.Activity;

public class ActivityBizImpl implements ActivityBiz {
	private ActivityDao activityDao;
	public void setActivityDao(ActivityDao activityDao) {
		this.activityDao = activityDao;
	}
	/**
	 * 按客户查询交往记录
	 */
	@Override
	public List<Activity> selectByCust(String custno) {
		return activityDao.selectByCust(custno);
	}
	/**
	 * 按ID查询交往记录
	 */
	@Override
	public Activity selectById(Integer aid) {
		return activityDao.selectById(aid); 
	}
	/**
	 * 添加交往记录
	 */
	@Override
	public boolean add(Activity activity) {
		return activityDao.add(activity);
	}
	/**
	 * 删除交往记录
	 */
	@Override
	public boolean delete(Activity activity) {
		return activityDao.delete(activity);
	}
	/**
	 * 更新交往记录
	 */
	@Override
	public boolean update(Activity activity) {
		return activityDao.update(activity);
	}
	
}
