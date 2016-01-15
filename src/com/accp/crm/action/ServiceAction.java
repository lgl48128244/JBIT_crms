package com.accp.crm.action;

import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.hibernate.HibernateException;
import com.accp.crm.biz.ServiceBiz;
import com.accp.crm.biz.UsersBiz;
import com.accp.crm.pojo.Service;
import com.accp.crm.pojo.Users;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("serial")
public class ServiceAction extends ActionSupport implements ModelDriven<Service>, RequestAware {
	private Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	private Service service = new Service();
	@Override
	public Service getModel() {
		return service;
	}
	private UsersBiz usersBiz;
	private ServiceBiz serviceBiz;
	
	public void setUsersBiz(UsersBiz usersBiz) {
		this.usersBiz = usersBiz;
	}
	public void setServiceBiz(ServiceBiz serviceBiz) {
		this.serviceBiz = serviceBiz;
	}
	/**
	 * 转向添加服务页面
	 * @return
	 */
	public String add(){
		try{
			String status = "新创建";
			service.setStatus(status);
			serviceBiz.add(service);
			return "add";
		}catch(HibernateException e){
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 分页查询第一页
	 * @return
	 */
	public String firstPage(){
		try{
			int total = serviceBiz.total("Service",service);
			int totalPage = serviceBiz.totalPage(5, "Service",service);
			List<Service> list = serviceBiz.selectByPage("Service", 1, 5,service);
			List<Users> ulist = usersBiz.selectByRoleId(7);//7代表客服ID   查询所有客服姓名
			request.put("ulist", ulist);
			request.put("total", total);
			request.put("list", list);
			request.put("totalPage", totalPage);
			request.put("currentPage", 1);
			if(list.size() == 0){
				request.put("mess", "查无记录");
			}
			return "firstPage";
		}catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 分页查询下一页
	 * @return
	 */
	public String nextPage(){
		int next = Integer.parseInt(ServletActionContext.getRequest().getParameter("next"));
		try{
			int total = serviceBiz.total("Service",service);
			int totalPage = serviceBiz.totalPage(5, "Service",service);
			List<Service> list = serviceBiz.selectByPage("Service", next, 5,service);
			List<Users> ulist = usersBiz.selectByRoleId(7);//7代表客服ID   查询所有客服姓名
			request.put("ulist", ulist);
			request.put("total", total);
			request.put("list", list);
			request.put("totalPage", totalPage);
			request.put("currentPage", next);
			if(list.size() == 0){
				request.put("mess", "查无记录");
			}
			return "nextPage";
		}catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 分配服务处理
	 * @return
	 */
	public String dispatch(){
		int sid = Integer.parseInt(ServletActionContext.getRequest().getParameter("sid"));
		Service service = serviceBiz.selectById(sid);
		Date duetime = new Date();
		service.setDuetime(duetime);
		service.setDueto(duer);
		service.setStatus("已分配");
		try{
			serviceBiz.update(service);
			service.setCustname("");
			service.setTitle("");
			service.setType("");
			service.setCreatedate("");
			service.setStatus("");
			return firstPage();
		}catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 转向处理页面
	 * @return
	 */
	public String toDeal(){
		int sid = Integer.parseInt(ServletActionContext.getRequest().getParameter("sid"));
		try{
			Service service = serviceBiz.selectById(sid);
			request.put("service", service);
			return "toDeal";
		}catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 处理服务
	 * @return
	 */
	public String deal(){
		int sid = Integer.parseInt(ServletActionContext.getRequest().getParameter("sid"));
		Service service = serviceBiz.selectById(sid);
		service.setSdeal(deal);
		service.setDealdate(dealTime);
		service.setDealer(dealby);
		service.setStatus("已处理");
		try{
			serviceBiz.update(service);
			service.setCustname("");
			service.setTitle("");
			service.setType("");
			service.setCreatedate("");
			service.setStatus("");
			return firstPage();
		}catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 转向反馈页面
	 * @return
	 */
	public String toBack(){
		int sid = Integer.parseInt(ServletActionContext.getRequest().getParameter("sid"));
		try{
			Service service = serviceBiz.selectById(sid);
			request.put("service", service);
			return "toBack";
		}catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 处理服务
	 * @return
	 */
	public String back(){
		int sid = Integer.parseInt(ServletActionContext.getRequest().getParameter("sid"));
		Service service = serviceBiz.selectById(sid);
		service.setResult(sresult);
		service.setSatisfy(ssatisfy);
		service.setStatus("已归档");
		try{
			serviceBiz.update(service);
			service.setCustname("");
			service.setTitle("");
			service.setType("");
			service.setCreatedate("");
			service.setStatus("");
			return firstPage();
		}catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 转向明细页面
	 * @return
	 */
	public String toDetail(){
		int sid = Integer.parseInt(ServletActionContext.getRequest().getParameter("sid"));
		try{
			Service service = serviceBiz.selectById(sid);
			request.put("service", service);
			return "toDetail";
		}catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 删除服务
	 * @return
	 */
	public String delete(){
		int sid = Integer.parseInt(ServletActionContext.getRequest().getParameter("sid"));
		try{
			Service service = serviceBiz.selectById(sid);
			serviceBiz.delete(service);
			return firstPage();
		}catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	
	
	
	
	private String duer;
	private String deal;
	private String dealby;
	private Date dealTime;
	private String sresult;
	private String ssatisfy;
	
	public String getSresult() {
		return sresult;
	}
	public void setSresult(String sresult) {
		this.sresult = sresult;
	}
	public String getSsatisfy() {
		return ssatisfy;
	}
	public void setSsatisfy(String ssatisfy) {
		this.ssatisfy = ssatisfy;
	}
	public String getDeal() {
		return deal;
	}
	public void setDeal(String deal) {
		this.deal = deal;
	}
	public String getDealby() {
		return dealby;
	}
	public void setDealby(String dealby) {
		this.dealby = dealby;
	}
	public Date getDealTime() {
		return dealTime;
	}
	public void setDealTime(Date dealTime) {
		this.dealTime = dealTime;
	}
	public String getDuer() {
		return duer;
	}
	public void setDuer(String duer) {
		this.duer = duer;
	}
	
}
