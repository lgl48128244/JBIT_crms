package com.accp.crm.biz.impl;

import java.util.List;

import com.accp.crm.biz.SaleChanceBiz;
import com.accp.crm.dao.SaleChanceDao;
import com.accp.crm.pojo.SaleChance;

public class SaleChanceBizImpl implements SaleChanceBiz {
	private SaleChanceDao saleChanceDao;

	public void setSaleChanceDao(SaleChanceDao saleChanceDao) {
		this.saleChanceDao = saleChanceDao;
	}
	/**
	 * 添加销售机会
	 */
	@Override
	public boolean add(SaleChance saleChance) {
		return saleChanceDao.add(saleChance);
	}
	/**
	 * 更新销售机会信息
	 * @param saleChance
	 * @return
	 */
	@Override
	public boolean update(SaleChance saleChance) {
		return saleChanceDao.update(saleChance);
	}
	/**
	 * 通过ID查找销售机会
	 * @param sid
	 * @return
	 */
	@Override
	public SaleChance selectById(Integer id) {
		return saleChanceDao.selectById(id);
	}
	/**
	 * 删除销售机会信息
	 * @param saleChance
	 * @return
	 */
	@Override
	public boolean delete(SaleChance saleChance) {
		return saleChanceDao.delete(saleChance);
	}
	
	/**
	 * 获取搜索总记录数(所有状态)
	 */
	@Override
	public int total(String className,SaleChance saleChance) {
		return saleChanceDao.total(className, new String[] {"name","resume","linkMan"},new String[] {saleChance.getName(),saleChance.getResume(),saleChance.getLinkMan()});
	}
	/**
	 * 分页查看搜索内容首页(所有状态)
	 */
	@Override
	public List<SaleChance> searchByPage(String className, int pageNo, int pageSize,SaleChance saleChance) {
		return saleChanceDao.selectByPage(className, pageNo, pageSize, new String[] {"name","resume","linkMan"},new String[] {saleChance.getName(),saleChance.getResume(),saleChance.getLinkMan()});
	}
	/**
	 * 分页查看搜索内容下一页(所有状态)
	 * @param line
	 * @param className
	 * @return
	 */
	@Override
	public int searchNextPage(int line, String className,SaleChance saleChance) {
		int total = saleChanceDao.total(className, new String[] {"name","resume","linkMan"},new String[] {saleChance.getName(),saleChance.getResume(),saleChance.getLinkMan()});
		int pageNo = total / line;
		if(total % line >0){
			pageNo++;
		}
		return pageNo;
	}
	/**
	 * 获取搜索总记录数(所有状态)
	 */
	@Override
	public int totals(String className,SaleChance saleChance) {
		return saleChanceDao.totals(className, new String[] {"name","resume","linkMan"},new String[] {saleChance.getName(),saleChance.getResume(),saleChance.getLinkMan()});
	}
	/**
	 * 分页查看搜索内容首页(所有状态)
	 */
	@Override
	public List<SaleChance> searchByPages(String className, int pageNo, int pageSize,SaleChance saleChance) {
		return saleChanceDao.selectByPages(className, pageNo, pageSize, new String[] {"name","resume","linkMan"},new String[] {saleChance.getName(),saleChance.getResume(),saleChance.getLinkMan()});
	}
	/**
	 * 分页查看搜索内容下一页(所有状态)
	 * @param line
	 * @param className
	 * @return
	 */
	@Override
	public int searchNextPages(int line, String className,SaleChance saleChance) {
		int total = saleChanceDao.totals(className, new String[] {"name","resume","linkMan"},new String[] {saleChance.getName(),saleChance.getResume(),saleChance.getLinkMan()});
		int pageNo = total / line;
		if(total % line >0){
			pageNo++;
		}
		return pageNo;
	}


	
	
}
