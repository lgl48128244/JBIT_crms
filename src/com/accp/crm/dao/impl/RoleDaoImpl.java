package com.accp.crm.dao.impl;

import java.util.ArrayList;
import java.util.List;
import com.accp.crm.dao.RoleDao;
import com.accp.crm.pojo.Role;

public class RoleDaoImpl extends BaseDaoImpl implements RoleDao {
	/**
	 * 通过ID查询
	 */
	@Override
	public List<Role> selectById(Integer id) {
		String hql = "from Role where id ="+id;
		List<Role> list = getSession().createQuery(hql).list();
		return list;
	}
	/**
	 * 查询所有角色
	 */
	@Override
	public List<Role> selectAllRole() {
		List<Role> list = new ArrayList<Role>();
		list = getSession().createQuery("from Role order by id").list();
		return list;
	}
	/**
	 * 添加角色
	 */
	@Override
	public boolean add(Role role) {
		boolean flag = false;
		getSession().save(role);
		flag = true;
		return flag;
	}
	/**
	 * 更新角色
	 */
	@Override
	public boolean update(Role role) {
		boolean flag = false;
		getSession().update(role);
		flag = true;
		return flag;
	}
	/**
	 * 删除角色
	 */
	@Override
	public boolean delete(Role role) {
		boolean flag = false;
		getSession().delete(role);
		flag = true;
		return flag;
	}

}
