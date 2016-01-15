package com.accp.crm.biz;

import java.util.List;
import com.accp.crm.pojo.SalePlan;

public interface SalePlanBiz {
	/**
	 * 通过ID查找开发计划
	 * @param id
	 * @return
	 */
	public List<SalePlan> selectByChanceId(Integer chanceId);
	/**
	 * 查找开发计划
	 */
	public List<SalePlan> selectAll();
	/**
	 * 添加开发计划
	 * @param salePlan
	 * @return
	 * @throws Exception 
	 */
	public boolean add(SalePlan salePlan) throws Exception;
	/**
	 * 删除开发计划
	 * @param salePlan
	 * @return
	 * @throws Exception 
	 */
	public boolean delete(SalePlan salePlan) throws Exception;
	/**
	 * 通过ID查找开发计划
	 * @param id
	 * @return
	 */
	public SalePlan selectById(Integer id);
	/**
	 * 更新开发计划
	 * @param salePlan
	 * @return
	 * @throws Exception
	 */
	public boolean update(SalePlan salePlan) throws Exception;

}
