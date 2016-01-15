package com.accp.crm.action;

import org.apache.struts2.ServletActionContext;
//import com.accp.crm.biz.RoleBiz;
import com.accp.crm.pojo.Role;
import com.accp.crm.pojo.Users;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@SuppressWarnings("serial")
public class RoleInterceptor extends AbstractInterceptor{
//	private RoleBiz roleBiz;
//	
//	public void setRoleBiz(RoleBiz roleBiz) {
//		this.roleBiz = roleBiz;
//	}
	private String msg;
	
	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	@Override
	public String intercept(ActionInvocation invoc) throws Exception {
		String url = ServletActionContext.getRequest().getRequestURL().toString();
		if(url.indexOf("/userlogin") >= 0){
			return invoc.invoke();
		}
		Users user = (Users) ServletActionContext.getRequest().getSession().getAttribute("user");//获取当前用户
		if(user == null){
			return "login";
		}
		Role userRole = (Role) ServletActionContext.getRequest().getSession().getAttribute("userRole");
		String power = userRole.getRoleDesc();//通过角色获取角色权限
		String[] powers = power.split(",");//分割成数组
		for(int i=0;i<powers.length;i++){
			if(url.indexOf(powers[i]) >=0){ //遍历数组中的字符串（action）是否有与url中匹配的，
				return invoc.invoke();//有则有权限，通过。
			}	
		}
		
		return "rolewrong";//否则拦截，去权限不足页面
	}


}
