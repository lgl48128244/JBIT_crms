package com.accp.crm.biz.impl;

import java.util.List;

import com.accp.crm.biz.UsersBiz;
import com.accp.crm.dao.UsersDao;
import com.accp.crm.pojo.Users;

public class UsersBizImpl implements UsersBiz {
	private UsersDao usersDao;
	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}
	/**
	 * 用户登录
	 */
	@Override
	public Users login(Users users) {
		
		List<Users> list = usersDao.login(users);
		if(list.size() >0){
			Users user = list.get(0);
			return user;
			
		}
		return null;
	}
	/**
	 * 获取用户的总记录数
	 */
	@Override
	public int total(String className,Users users) {
		return usersDao.total(className,new String[] {"id","realName"},new String[] {users.getId(),users.getRealName()});
	}
	/**
	 * 分页显示第一页
	 */
	@Override
	public List<Users> selectByPage(String className, int pageNo, int pageSize,Users users) {
		return usersDao.selectByPage(className, pageNo, pageSize,new String[] {"id","realName"},new String[] {users.getId(),users.getRealName()});
	}
	/**
	 * 分页显示下一页
	 */
	@Override
	public int totalPage(int line, String className,Users users) {
		int total = usersDao.total(className,new String[] {"id","realName"},new String[] {users.getId(),users.getRealName()});
		int pageNo = total / line;
		if(total % line > 0){
			pageNo++;
		}
		return pageNo;
	}
	/**
	 * 添加用户
	 */
	@Override
	public boolean add(Users users) {
		return usersDao.add(users);
	}
	/**
	 * 通过ID查找用户
	 */
	@Override
	public Users selectById(Integer id) {
		return usersDao.selectById(id);
	}
	/**
	 * 更新用户信息
	 */
	@Override
	public boolean update(Users users) {
		return usersDao.update(users);
	}
	/**
	 * 删除用户
	 */
	@Override
	public boolean delete(Users users) {
		return usersDao.delete(users);
	}
	/**
	 * 按角色查询用户
	 */
	@Override
	public List<Users> selectByRoleId(Integer roleId) {
		List<Users> list = usersDao.selectByRoleId(roleId);
		return list;
	}

}
