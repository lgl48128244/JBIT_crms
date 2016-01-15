package com.accp.crm.biz;

import java.util.List;

import com.accp.crm.pojo.Power;
import com.accp.crm.pojo.Role;

public interface RoleBiz {
	/**
	 * 通过ID获取角色
	 * @param id
	 * @return
	 */
	public Role selectById(Integer id);
	/**
	 * 获取所有角色
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
	/**
	 * 分页查看，获取总记录数。
	 *
	 */
	public int total(String className,Role role);
	
	/**
	 * 分页查看
	 * @param className
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public List<Role> selectByPage(String className, int pageNo, int pageSize,Role role);
	/**
	 * 获取总页数
	 * @param line
	 * @param className
	 * @return
	 */
	public int totalPage(int line, String className,Role role);
	/**
	 * 获取所有权限
	 * @return
	 */
	public List<Power> selectAll();
	/**
	 * 按ID获取权限
	 * @return
	 */
	public Power selectById(String powerid);
}
