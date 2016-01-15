package com.accp.crm.biz;

import java.util.List;

import com.accp.crm.pojo.Users;

public interface UsersBiz {
	/**
	 * 用户登录
	 * @param user
	 * @return
	 */
	public Users login(Users users);
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
	/**
	 * 按角色查询用户
	 * @param RoleId
	 * @return
	 */
	public List<Users> selectByRoleId(Integer roleId);
	/**
	 * 分页查看，获取总记录数。
	 *
	 */
	public int total(String className,Users users);
	
	/**
	 * 分页查看
	 * @param className
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public List<Users> selectByPage(String className, int pageNo, int pageSize,Users users);
	/**
	 * 获取总页数
	 * @param line
	 * @param className
	 * @return
	 */
	public int totalPage(int line, String className,Users users);
}
