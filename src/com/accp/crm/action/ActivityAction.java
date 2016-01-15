package com.accp.crm.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import com.accp.crm.biz.ActivityBiz;
import com.accp.crm.biz.CustInfoBiz;
import com.accp.crm.pojo.Activity;
import com.accp.crm.pojo.CustInfo;
import com.opensymphony.xwork2.ModelDriven;

public class ActivityAction implements ModelDriven<Activity>, RequestAware {
	private ActivityBiz activityBiz;
	private CustInfoBiz custInfoBiz;
	
	public void setActivityBiz(ActivityBiz activityBiz) {
		this.activityBiz = activityBiz;
	}
	public void setCustInfoBiz(CustInfoBiz custInfoBiz) {
		this.custInfoBiz = custInfoBiz;
	}
	private Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	private Activity activity = new Activity();
	@Override
	public Activity getModel() {
		return activity;
	}
	/**
	 * 查询交往记录
	 * @return
	 */
	public String selectAll(){
		int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		try{
			CustInfo custInfo = custInfoBiz.selectById(id);
			List<Activity> list = activityBiz.selectByCust(custInfo.getCustno());
			request.put("custInfo", custInfo);
			request.put("list", list);
			return "selectAll";
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 转向添加页面
	 * @return
	 */
	public String toAdd(){
		int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		try{
			CustInfo custInfo = custInfoBiz.selectById(id);
			request.put("custInfo", custInfo);
			return "toAdd";
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 添加交往记录
	 * @return
	 */
	public String add(){
		try{
			activityBiz.add(activity);
			return selectAll();
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 删除交往记录
	 * @return
	 */
	public String delete(){
		int aid = Integer.parseInt(ServletActionContext.getRequest().getParameter("aid"));
		try{
			Activity activity = activityBiz.selectById(aid);
			activityBiz.delete(activity);
			return selectAll();
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 转向更新页面
	 * @return
	 */
	public String toUpdate(){
		int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		int aid = Integer.parseInt(ServletActionContext.getRequest().getParameter("aid"));
		try{
			Activity activity = activityBiz.selectById(aid);
			CustInfo custInfo = custInfoBiz.selectById(id);
			request.put("custInfo", custInfo);
			request.put("activity", activity);
			return "toUpdate";
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 更新交往记录
	 * @return
	 */
	public String update(){
		try{
			activityBiz.update(activity);
			return selectAll();
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
}
