package com.accp.crm.dao;

import java.util.List;

import com.accp.crm.pojo.Power;

public interface PowerDao extends BaseDao {
	/**
	 * 获取所有权限
	 * @return
	 */
	public List<Power> selectAll();
	/**
	 * 通过ID获取权限
	 * @param powerid
	 * @return
	 */
	public Power selectById(String powerid);
}
