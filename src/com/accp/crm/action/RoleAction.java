package com.accp.crm.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.hibernate.HibernateException;

import com.accp.crm.biz.RoleBiz;
import com.accp.crm.pojo.Power;
import com.accp.crm.pojo.Role;
import com.opensymphony.xwork2.ModelDriven;

public class RoleAction implements ModelDriven<Role>, RequestAware {
	private Role role = new Role();

	@Override
	public Role getModel() {
		return role;
	}

	private RoleBiz roleBiz;

	public void setRoleBiz(RoleBiz roleBiz) {
		this.roleBiz = roleBiz;
	}

	private Map<String, Object> request;

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	/**
	 * 获取所有角色
	 * @return
	 */
	public String getAll() {
		try {
			List<Role> list = roleBiz.selectAllRole();
			if (null != list) {
				request.put("list", list);
			}
			return "getAll";
		} catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 转向添加页面
	 * @return
	 */
	public String toAdd() {
		try {
			List<Power> powerList = roleBiz.selectAll();
			request.put("powerList", powerList);
			return "toAdd";
		} catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 添加角色
	 * @return
	 */
	public String add() {
		try {
			roleBiz.add(role);
		} catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
		return "add";
	}

	/**
	 * 去编辑页面
	 * @return
	 */
	public String toEdit() {
		Integer id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		try {
			Role role = roleBiz.selectById(id);
			if (null != role) {
				request.put("role", role);
			}
			List<Power> powerList = roleBiz.selectAll();
			request.put("powerList", powerList);
			return "toEdit";
		} catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 编辑角色
	 * @return
	 */
	public String update() {
		try {
			roleBiz.update(role);
			return "update";
		} catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 添加角色
	 * @return
	 */
	public String delete() {
		Integer id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		try {
			Role role = roleBiz.selectById(id);
			roleBiz.delete(role);
			return "delete";
		} catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 分页查询第一页
	 */
	public String firstPage() {
		try {
			int total = roleBiz.total("Role", role);
			int totalPage = roleBiz.totalPage(5, "Role", role);
			List<Role> list = roleBiz.selectByPage("Role", 1, 5, role);
			request.put("total", total);
			request.put("list", list);
			request.put("totalPage", totalPage);
			request.put("currentPage", 1);
			if (list.size() == 0) {
				request.put("mess", "查无记录");
			}
			return "firstPage";
		} catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 分页查询下一页
	 */
	public String nextPage() {
		int next = Integer.parseInt(ServletActionContext.getRequest().getParameter("next"));
		try {
			int total = roleBiz.total("Role", role);
			int totalPage = roleBiz.totalPage(5, "Role", role);
			List<Role> list = roleBiz.selectByPage("Role", next, 5, role);
			request.put("total", total);
			request.put("list", list);
			request.put("totalPage", totalPage);
			request.put("currentPage", next);
			return "nextPage";
		} catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}
}
