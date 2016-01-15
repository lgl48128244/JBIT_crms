package com.accp.crm.biz.impl;

import java.util.List;

import com.accp.crm.biz.LostBiz;
import com.accp.crm.dao.LostDao;
import com.accp.crm.pojo.Custlost;

public class LostBizImpl implements LostBiz {
	private LostDao lostDao;
	
	public void setLostDao(LostDao lostDao) {
		this.lostDao = lostDao;
	}
	/**
	 * 按ID查找流失客户
	 */
	@Override
	public Custlost selectById(Integer lostid) {
		return lostDao.selectById(lostid);
	}
	/**
	 * 更新状态
	 */
	@Override
	public boolean update(Custlost custlost) {
		return lostDao.update(custlost);
	}
	/**
	 * 获取总记录数
	 */
	@Override
	public int total(String className, Custlost custlost) {
		return lostDao.total(className, new String[] {"lostname","lostmanager","status"}, 
				new String[] {custlost.getLostname(),custlost.getLostmanager(),custlost.getStatus()});
	}
	/**
	 * 分页显示
	 */
	@Override
	public List searchByPage(String className, int pageNo, int pageSize,
			Custlost custlost) {
		return lostDao.selectByPage(className, pageNo, pageSize, new String[] {"lostname","lostmanager","status"}, 
				new String[] {custlost.getLostname(),custlost.getLostmanager(),custlost.getStatus()});
	}
	/**
	 * 获取总页数
	 */
	@Override
	public int totalPage(int line, String className, Custlost custlost) {
		int total = lostDao.total(className, new String[] {"lostname","lostmanager","status"}, 
				new String[] {custlost.getLostname(),custlost.getLostmanager(),custlost.getStatus()});
		int pageNo = total / line;
		if(total % line > 0){
			pageNo++;
		}
		return pageNo++;
	}
	/**
	 * 统计符合条件的总记录数
	 */
	@Override
	public int repttotal(String className,Custlost custlost) {
		return lostDao.repttotal(className, new String[] {"lostname","lostmanager"}, 
				new String[] {custlost.getLostname(),custlost.getLostmanager()});
	}
	/**
	 * 分页显示统计数据
	 */
	@Override
	public List reptselectByPage(String className, int pageNo, int pageSize,
			Custlost custlost) {
		return lostDao.reptselectByPage(className, pageNo, pageSize, new String[] {"lostname","lostmanager"}, 
				new String[] {custlost.getLostname(),custlost.getLostmanager()});
	}
	/**
	 * 获取统计总页数
	 */
	@Override
	public int repttotalPage(int line, String className, Custlost custlost) {
		int total = lostDao.repttotal(className, new String[] {"lostname","lostmanager"}, 
				new String[] {custlost.getLostname(),custlost.getLostmanager()});
		int pageNo = total / line;
		if(total % line > 0){
			pageNo++;
		}
		return pageNo++;
	}
}
