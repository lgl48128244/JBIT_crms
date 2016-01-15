package com.accp.crm.dao;

import java.util.List;

import com.accp.crm.pojo.Users;

public interface UsersDao extends BaseDao {
	/**
	 * 用户登录
	 * @param users
	 * @return
	 */
	public List<Users> login(Users users);
	/**
	 * 添加用户
	 * @param users
	 * @return
	 */
	public boolean add(Users users);
	/**
	 * 通过id查找用户
	 * @param id
	 * @return
	 */
	public Users selectById(Integer id);
	/**
	 * 按角色查询用户
	 * @param RoleId
	 * @return
	 */
	public List<Users> selectByRoleId(Integer roleId);
	/**
	 * 更新用户
	 * @param users
	 * @return
	 */
	public boolean update(Users users);
	/**
	 * 删除用户
	 * @param users
	 * @return
	 */
	public boolean delete(Users users);
}
