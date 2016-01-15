package com.accp.crm.dao;

import java.util.List;

import com.accp.crm.pojo.Custlost;

public interface LostDao extends BaseDao {
	/**
	 * 按ID查找流失客户
	 * @param lostid
	 * @return
	 */
	public Custlost selectById(Integer lostid);
	/**
	 * 更新流失状态
	 * @param custlost
	 * @return
	 */
	public boolean update(Custlost custlost);
	/**
	 * 统计符合条件的总记录数
	 * @param className
	 * @param keys
	 * @param values
	 * @return
	 */
	public int repttotal(String className,String[] keys,String[] values);
	/**
	 * 分页显示统计数据
	 * @param className
	 * @param pageNo
	 * @param pageSize
	 * @param keys
	 * @param values
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List reptselectByPage(String className, int pageNo, int pageSize,String []keys,String []values);
}
