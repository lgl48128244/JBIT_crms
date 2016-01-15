package com.accp.crm.dao;

import java.util.List;

import com.accp.crm.pojo.Linkman;

public interface LinkmanDao extends BaseDao {
	/**
	 * 查询某客户所有联系人
	 * @return
	 */
	public List<Linkman> selectByCustno(String custno);
	/**
	 * 添加联系人
	 * @param linkman
	 * @return
	 */
	public boolean add(Linkman linkman);
	/**
	 * 删除联系人
	 * @param linkman
	 * @return
	 */
	public boolean delete(Linkman linkman);
	/**
	 * 更新联系人
	 * @param linkman
	 * @return
	 */
	public boolean update(Linkman linkman);
	/**
	 * 通过ID查找联系人
	 * @param id
	 * @return
	 */
	public Linkman selectById(Integer id);
}
