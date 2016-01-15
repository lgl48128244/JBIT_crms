package com.accp.crm.dao;

import java.util.List;

import com.accp.crm.pojo.SaleChance;

public interface SaleChanceDao extends BaseDao{
	/**
	 * 添加销售机会
	 * @param saleChance
	 * @return
	 */
	public boolean add(SaleChance saleChance);
	/**
	 * 通过ID查找销售机会
	 * @param sid
	 * @return
	 */
	public SaleChance selectById(Integer sid);
	/**
	 * 更新销售机会信息
	 * @param saleChance
	 * @return
	 */
	public boolean update(SaleChance saleChance);
	/**
	 * 删除销售机会信息
	 * @param saleChance
	 * @return
	 */
	public boolean delete(SaleChance saleChance);
	/**
	 * 分页查看，获取总记录数。
	 * @param className
	 * @return
	 */
	public int totals(String className,String []keys,String []values);
	/**
	 * 分页查看，查看首页
	 * @param className
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List selectByPages(String className, int pageNo, int pageSize,String []keys,String []values);
	
}
