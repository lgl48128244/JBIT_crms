package com.accp.crm.biz;

import java.util.List;

import com.accp.crm.pojo.Custlost;

public interface LostBiz {
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
	 * 获取搜索总记录数
	 * @param className
	 * @param custlost
	 * @return
	 */
	public int total(String className,Custlost custlost);
	/**
	 * 分页查看搜索内容首页
	 * @param className
	 * @param pageNo
	 * @param pageSize
	 * @param custlost
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List searchByPage(String className, int pageNo, int pageSize,Custlost custlost);
	/**
	 * 获取搜索内容总页数
	 * @param line
	 * @param className
	 * @param custlost
	 * @return
	 */
	public int totalPage(int line, String className,Custlost custlost);
	
	
	/**
	 * 统计符合条件的总记录数
	 * @param className
	 * @param keys
	 * @param values
	 * @return
	 */
	public int repttotal(String className,Custlost custlost);
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
	public List reptselectByPage(String className, int pageNo, int pageSize,Custlost custlost);
	/**
	 * 获取统计总记录数
	 * @param line
	 * @param className
	 * @param custlost
	 * @return
	 */
	public int repttotalPage(int line, String className, Custlost custlost);
}
