package com.accp.crm.biz.impl;

import java.util.List;

import com.accp.crm.biz.CustInfoBiz;
import com.accp.crm.dao.CustInfoDao;
import com.accp.crm.pojo.CustInfo;

public class CustInfoBizImpl implements CustInfoBiz {
	private CustInfoDao custInfoDao;

	public void setCustInfoDao(CustInfoDao custInfoDao) {
		this.custInfoDao = custInfoDao;
	}
	/**
	 * 添加客户
	 */
	@Override
	public boolean add(CustInfo custInfo) {
		return custInfoDao.add(custInfo);
	}
	/**
	 * 获取总记录数
	 */
	@Override
	public int total(String className, CustInfo custInfo) {
		return custInfoDao.total(className, new String[] {"custno","name","region","custManager","levelLabel"},
				new String[] {custInfo.getCustno(),custInfo.getName(),custInfo.getRegion(),custInfo.getCustManager(),custInfo.getLevelLabel()});
	}
	/**
	 * 分页查询
	 */
	@Override
	public List<CustInfo> selectByPage(String className, int pageNo,
			int pageSize, CustInfo custInfo) {
		return custInfoDao.selectByPage(className, pageNo, pageSize,new String[] {"custno","name","region","custManager","levelLabel"},
				new String[] {custInfo.getCustno(),custInfo.getName(),custInfo.getRegion(),custInfo.getCustManager(),custInfo.getLevelLabel()});
	}
	/**
	 * 获取总页数
	 */
	@Override
	public int totalPage(int line, String className, CustInfo custInfo) {
		int total = custInfoDao.total(className, new String[] {"custno","name","region","custManager","levelLabel"},
				new String[] {custInfo.getCustno(),custInfo.getName(),custInfo.getRegion(),custInfo.getCustManager(),custInfo.getLevelLabel()});
		int pageNo = total / line;
		if(total % line > 0){
			pageNo++;
		}
		return pageNo;
	}
	/**
	 * 通过ID查找客户
	 */
	@Override
	public CustInfo selectById(Integer id) {
		return custInfoDao.selectById(id);
	}
	/**
	 * 更新客户
	 */
	@Override
	public boolean update(CustInfo custInfo) {
		return custInfoDao.update(custInfo);
	}
	/**
	 * 删除客户
	 */
	@Override
	public boolean delete(CustInfo custInfo) {
		return custInfoDao.delete(custInfo);
	}
	/**
	 * 更具类型统计客户
	 */
	@Override
	public List reptByType(String type) {
		return custInfoDao.reptByType(type);
	}
	
}
