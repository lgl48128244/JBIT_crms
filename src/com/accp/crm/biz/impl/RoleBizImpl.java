package com.accp.crm.biz.impl;

import java.util.List;

import com.accp.crm.biz.RoleBiz;
import com.accp.crm.dao.PowerDao;
import com.accp.crm.dao.RoleDao;
import com.accp.crm.pojo.Power;
import com.accp.crm.pojo.Role;

public class RoleBizImpl implements RoleBiz {
	private RoleDao roleDao;
	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}
	private PowerDao powerDao;
	
	public void setPowerDao(PowerDao powerDao) {
		this.powerDao = powerDao;
	}
	/**
	 * 获取某个角色
	 */
	@Override
	public Role selectById(Integer id) {
		List<Role> list = roleDao.selectById(id);
		if(list.size() > 0){
			return list.get(0);
		}
		return null;
	}
	/**
	 * 获取所有角色
	 */
	@Override
	public List<Role> selectAllRole() {
		List<Role> list = roleDao.selectAllRole();
		return list;
	}
	/**
	 * 添加角色
	 */
	@Override
	public boolean add(Role role) {
		return roleDao.add(role);
	}
	/**
	 * 更新角色
	 */
	@Override
	public boolean update(Role role) {
		return roleDao.update(role);
	}
	/**
	 * 删除角色
	 */
	@Override
	public boolean delete(Role role) {
		return roleDao.delete(role);
	}
	/**
	 * 获取总记录数
	 */
	@Override
	public int total(String className, Role role) {
		return roleDao.total(className, new String[] {"id","roleName"}, new String[] {role.getId(),role.getRoleName()});
	}
	/**
	 * 分页查询
	 */
	@Override
	public List<Role> selectByPage(String className, int pageNo, int pageSize,
			Role role) {
		return roleDao.selectByPage(className, pageNo, pageSize, new String[] {"id","roleName"}, new String[] {role.getId(),role.getRoleName()});
	}
	/**
	 * 获取总页数
	 */
	@Override
	public int totalPage(int line, String className, Role role) {
		int total = roleDao.total(className, new String[] {"id","roleName"}, new String[] {role.getId(),role.getRoleName()});
		int pageNo = total / line;
		if(total % line > 0){
			pageNo++;
		}
		return pageNo;
	}
	/**
	 * 获取所有权限
	 * @return
	 */
	public List<Power> selectAll(){
		return powerDao.selectAll();
	}
	/**
	 * 按ID获取权限
	 * @return
	 */
	public Power selectById(String powerid){
		return powerDao.selectById(powerid);
	}
}
