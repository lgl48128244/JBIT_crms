package com.accp.crm.biz;

import java.util.List;

import com.accp.crm.pojo.SaleChance;

public interface SaleChanceBiz {
	/**
	 * 添加销售机会
	 * @param saleChance
	 * @return
	 */
	public boolean add(SaleChance saleChance);
	/**
	 * 更新销售机会信息
	 * @param saleChance
	 * @return
	 */
	public boolean update(SaleChance saleChance);
	/**
	 * 通过ID查找销售机会
	 * @param sid
	 * @return
	 */
	public SaleChance selectById(Integer id);
	/**
	 * 删除销售机会
	 * @param saleChance
	 * @return
	 */
	public boolean delete(SaleChance saleChance);	
	/**
	 * 获取搜索总记录数
	 * @param className
	 * @param saleChance
	 * @return
	 */
	public int total(String className,SaleChance saleChance);
	/**
	 * 分页查看搜索内容首页
	 * @param className
	 * @param pageNo
	 * @param pageSize
	 * @param saleChance
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List searchByPage(String className, int pageNo, int pageSize,SaleChance saleChance);
	/**
	 * 获取搜索内容总页数
	 * @param line
	 * @param className
	 * @param saleChance
	 * @return
	 */
	public int searchNextPage(int line, String className,SaleChance saleChance);
	/**
	 * 获取搜索总记录数
	 * @param className
	 * @param saleChance
	 * @return
	 */
	public int totals(String className,SaleChance saleChance);
	/**
	 * 分页查看搜索内容首页
	 * @param className
	 * @param pageNo
	 * @param pageSize
	 * @param saleChance
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List searchByPages(String className, int pageNo, int pageSize,SaleChance saleChance);
	/**
	 * 获取搜索内容总页数
	 * @param line
	 * @param className
	 * @param saleChance
	 * @return
	 */
	public int searchNextPages(int line, String className,SaleChance saleChance);
}
