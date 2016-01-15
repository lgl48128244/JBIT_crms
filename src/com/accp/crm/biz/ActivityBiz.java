package com.accp.crm.biz;

import java.util.List;

import com.accp.crm.pojo.Activity;

public interface ActivityBiz {
	/**
	 * 按客户查询所有交往记录
	 * @return
	 */
	public List<Activity> selectByCust(String custno);
	/**
	 * 按ID查找交往记录
	 * @param aid
	 * @return
	 */
	public Activity selectById(Integer aid);
	/**
	 * 添加交往记录
	 * @param activity
	 * @return
	 */
	public boolean add(Activity activity);
	/**
	 * 删除交往记录
	 * @param activity
	 * @return
	 */
	public boolean delete(Activity activity);
	/**
	 * 更新交往记录
	 * @param activity
	 * @return
	 */
	public boolean update(Activity activity);
}
