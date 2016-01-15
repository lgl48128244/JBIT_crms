package com.accp.crm.dao.impl;

import java.util.ArrayList;
import java.util.List;
import com.accp.crm.dao.UsersDao;
import com.accp.crm.pojo.Users;

public class UsersDaoImpl extends BaseDaoImpl implements UsersDao {
	/**
	 * 用户登录
	 */
	public List<Users> login(Users user) {
		List<Users> list = new ArrayList<Users>();
			String hql = "from Users where uname=:uname and upwd=:upwd"; 
			list = this.getSession().createQuery(hql)
								.setString("uname", user.getUname())
								.setString("upwd", user.getUpwd())
								.list();
			return list;
	}
	/**
	 * 添加用户
	 */
	@Override
	public boolean add(Users users) {
		boolean flag = false;
		getSession().save(users);
		flag = true;
		return flag;
	}
	/**
	 * 通过ID查找用户
	 */
	@Override
	public Users selectById(Integer id) {
		List<Users> list = getSession().createQuery("from Users where id ="+id).list();
		return list.get(0);
	}
	/**
	 * 更新用户
	 */
	@Override
	public boolean update(Users users) {
		boolean flag = false;
		getSession().update(users);
		flag = true;
		return flag;
	}
	/**
	 * 删除用户
	 */
	@Override
	public boolean delete(Users users) {
		boolean flag = false;
		getSession().delete(users);
		flag = true;
		return flag;
	}
	/**
	 * 按角色查询用户
	 */
	@Override
	public List<Users> selectByRoleId(Integer roleId) {
		List<Users> list = getSession().createQuery("from Users where roleId ="+roleId).list();
		return list;
	}

}
