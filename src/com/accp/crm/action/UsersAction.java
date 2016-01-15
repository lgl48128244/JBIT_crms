package com.accp.crm.action;

import java.util.List;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.HibernateException;
import com.accp.crm.biz.RoleBiz;
import com.accp.crm.biz.UsersBiz;
import com.accp.crm.pojo.Role;
import com.accp.crm.pojo.Users;
import com.opensymphony.xwork2.ModelDriven;

public class UsersAction implements ModelDriven<Users>, RequestAware, SessionAware {
	private Users users = new Users();

	@Override
	public Users getModel() {
		return users;
	}

	private RoleBiz roleBiz;

	public void setRoleBiz(RoleBiz roleBiz) {
		this.roleBiz = roleBiz;
	}

	private UsersBiz usersBiz;

	public void setUsersBiz(UsersBiz usersBiz) {
		this.usersBiz = usersBiz;
	}

	private Map<String, Object> request;
	private Map<String, Object> session;

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	/**
	 * 用户登录
	 * @return
	 */
	public String login() {
		Users user = null;
		Role userRole = null;
		try {
			user = usersBiz.login(users);
		} catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
		if (null != user) {
			session.put("user", user);
			try {
				userRole = roleBiz.selectById(user.getRoleId());
				if (null != userRole) {
					session.put("userRole", userRole);
				}
				return "login";
			} catch (HibernateException e) {
				e.printStackTrace();
				return "error";
			}
		}
		request.put("mess", "用户名或密码错误");
		return "relogin";
	}

	/**
	 * 注销用户
	 * @return
	 */
	public String logout() {
		session.remove("user");
		session.remove("userRole");
		return "logout";
	}

	/**
	 * 分页显示第一页
	 * @return
	 */
	public String selectFirstPage() {
		try {
			int total = usersBiz.total("Users", users);
			List<Users> list = usersBiz.selectByPage("Users", 1, 5, users);
			int totalPage = usersBiz.totalPage(5, "Users", users);
			request.put("list", list);
			request.put("total", total);
			request.put("totalPage", totalPage);
			request.put("currentPage", 1);
			if (list.size() == 0) {
				request.put("mess", "查无记录");
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
		return "selectFirstPage";
	}

	/**
	 * 分页显示下一页
	 * @return
	 */
	public String selectNextPage() {
		//		int next = (Integer) request.get("next");
		int next = Integer.parseInt(ServletActionContext.getRequest().getParameter("next"));
		try {
			int total = usersBiz.total("Users", users);
			List<Users> list = usersBiz.selectByPage("Users", next, 5, users);
			int totalPage = usersBiz.totalPage(5, "Users", users);
			request.put("total", total);
			request.put("list", list);
			request.put("totalPage", totalPage);
			request.put("currentPage", next);
		} catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
		return "selectNextPage";
	}

	/**
	 * 获取用户角色
	 */
	public String toAdd() {
		try {
			List<Role> list = roleBiz.selectAllRole();
			if (null != list) {
				request.put("roles", list);
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
		return "toAdd";
	}

	/**
	 * 添加用户
	 */
	public String add() {
		try {
			usersBiz.add(users);
		} catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
		return "add";
	}

	/**
	 * 查找某用户
	 */
	public String toEdit() {
		Integer id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		try {
			List<Role> list = roleBiz.selectAllRole();
			Users user = usersBiz.selectById(id);
			if (null != user) {
				request.put("user", user);
				request.put("roles", list);
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
		return "toEdit";
	}

	/**
	 * 更新用户
	 */
	public String update() {
		try {
			usersBiz.update(users);
			return "update";
		} catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}

	}

	/**
	 * 删除用户
	 */
	public String delete() {
		try {
			usersBiz.delete(users);
			return "delete";
		} catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 去修改密码页
	 * @return
	 */
	public String toPwd() {
		Integer id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		try {
			Users user = usersBiz.selectById(id);
			if (null != user) {
				request.put("user", user);
			}
			return "toPwd";
		} catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 修改密码
	 * @return
	 */
	public String ModifyPwd() {
		try {
			usersBiz.update(users);
			return "ModifyPwd";
		} catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}
}
