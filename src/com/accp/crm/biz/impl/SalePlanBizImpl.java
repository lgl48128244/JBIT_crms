package com.accp.crm.biz.impl;

import java.util.List;

import com.accp.crm.biz.SalePlanBiz;
import com.accp.crm.dao.SalePlanDao;
import com.accp.crm.pojo.SalePlan;

public class SalePlanBizImpl implements SalePlanBiz {
	private SalePlanDao salePlanDao;
	public void setSalePlanDao(SalePlanDao salePlanDao) {
		this.salePlanDao = salePlanDao;
	}
	/**
	 * 通过ID查找开发计划
	 */
	@Override
	public List<SalePlan> selectByChanceId(Integer chanceId) {
		return salePlanDao.selectByChanceId(chanceId);
	}
	/**
	 * 查询所有开发计划
	 */
	@Override
	public List<SalePlan> selectAll() {
		return salePlanDao.selectAll();
	}
	/**
	 * 添加开发计划
	 * @throws Exception 
	 */
	@Override
	public boolean add(SalePlan salePlan) throws Exception {
		return salePlanDao.add(salePlan);
	}
	/**
	 * 删除开发计划
	 */
	@Override
	public boolean delete(SalePlan salePlan) throws Exception {
		return salePlanDao.delete(salePlan);
	}
	/**
	 * 通过ID查找开发计划
	 */
	@Override
	public SalePlan selectById(Integer id) {
		return salePlanDao.selectById(id);
	}
	/**
	 * 更新开发计划
	 */
	@Override
	public boolean update(SalePlan salePlan) throws Exception {
		return salePlanDao.update(salePlan);
	}
	

}
