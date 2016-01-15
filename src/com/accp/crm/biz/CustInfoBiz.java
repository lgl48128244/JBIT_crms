package com.accp.crm.biz;

import java.util.List;

import com.accp.crm.pojo.CustInfo;

public interface CustInfoBiz {
	/**
	 * 添加客户
	 * @param custInfo
	 * @return
	 */
	public boolean add(CustInfo custInfo);
	/**
	 * 获取总记录
	 * @param className
	 * @param custInfo
	 * @return
	 */
	public int total(String className,CustInfo custInfo);
	
	/**
	 * 分页查看
	 * @param className
	 * @param pageNo
	 * @param pageSize
	 * @param custInfo
	 * @return
	 */
	public List<CustInfo> selectByPage(String className, int pageNo, int pageSize,CustInfo custInfo);
	/**
	 * 获取总页数
	 * @param line
	 * @param className
	 * @param custInfo
	 * @return
	 */
	public int totalPage(int line, String className,CustInfo custInfo);
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
