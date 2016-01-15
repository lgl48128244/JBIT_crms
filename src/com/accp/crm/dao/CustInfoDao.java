package com.accp.crm.dao;

import java.util.List;

import com.accp.crm.pojo.CustInfo;


public interface CustInfoDao extends BaseDao {
	/**
	 * 添加客户
	 * @param custInfo
	 * @return
	 */
	public boolean add(CustInfo custInfo);
	/**
	 * 通过ID查找客户
	 * @return
	 */
	public CustInfo selectById(Integer id);
	/**
	 * 更新客户信息
	 * @param custInfo
	 * @return
	 */
	public boolean update(CustInfo custInfo);
	/**
	 * 删除客户
	 * @param custInfo
	 * @return
	 */
	public boolean delete(CustInfo custInfo);
	/**
	 * 按类型统计客户
	 * @param type
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List reptByType(String type);
}
