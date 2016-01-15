package com.accp.crm.dao;

import java.util.List;

import com.accp.crm.pojo.Service;

public interface ServiceDao extends BaseDao {
	/**
	 * 添加服务
	 * @param service
	 * @return
	 */
	public boolean add(Service service);
	/**
	 * 更新服务
	 * @param service
	 * @return
	 */
	public boolean update(Service service);
	/**
	 * 删除服务
	 * @param service
	 * @return
	 */
	public boolean delete(Service service);
	/**
	 * 按ID查找服务
	 * @param sid
	 * @return
	 */
	public Service selectById(Integer sid);
	/**
	 * 统计服务类别
	 * @param type
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List selectByType(String type);
	
}
