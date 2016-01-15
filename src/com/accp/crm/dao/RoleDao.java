package com.accp.crm.dao;

import java.util.List;

import com.accp.crm.pojo.Role;

public interface RoleDao extends BaseDao {
	/**
	 * 通过ID查询角色
	 * @param id
	 * @return
	 */
	public List<Role> selectById(Integer id);
	/**
	 * 查询所有角色
	 * @return
	 */
	public List<Role> selectAllRole();
	/**
	 * 添加角色
	 * @param role
	 * @return
	 */
	public boolean add(Role role);
	/**
	 * 更新角色
	 * @param role
	 * @return
	 */
	public boolean update(Role role);
	/**
	 * 删除角色
	 * @param role
	 * @return
	 */
	public boolean delete(Role role);
}
