package com.accp.crm.dao.impl;

import java.util.List;

import com.accp.crm.dao.SalePlanDao;
import com.accp.crm.pojo.SalePlan;

public class SalePlanDaoImpl extends BaseDaoImpl implements SalePlanDao {
	/**
	 * 通过ID查找开发计划
	 */
	@Override
	public List<SalePlan> selectByChanceId(Integer chanceId) {
		List<SalePlan> list = getSession().createQuery("from SalePlan where chanceId ="+chanceId).list();
		return list;
	}
	/**
	 * 查询所有开发计划
	 */
	@Override
	public List<SalePlan> selectAll() {
		List<SalePlan> list = getSession().createQuery("from SalePlan").list();
		return list;
	}
	/**
	 * 添加开发计划
	 */
	@Override
	public boolean add(SalePlan salePlan) throws Exception {
		boolean flag = false;
		getSession().save(salePlan);
		flag = true;
		return flag;
	}
	/**
	 * 删除开发计划
	 */
	@Override
	public boolean delete(SalePlan salePlan) throws Exception{
		boolean flag = false;
		getSession().delete(salePlan);
		flag = true;
		return flag;
	}
	/**
	 * 通过id查找开发计划
	 */
	@Override
	public SalePlan selectById(Integer id) {
		List<SalePlan> list = getSession().createQuery("from SalePlan where planId = "+id).list();
		return list.get(0);
	}
	/**
	 * 更新开发计划
	 */
	@Override
	public boolean update(SalePlan salePlan) throws Exception {
		boolean flag = false;
		getSession().update(salePlan);
		flag = true;
		return flag;
	}
	
	
}
