package com.accp.crm.action;

import java.util.List;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.hibernate.HibernateException;
import com.accp.crm.biz.CustInfoBiz;
import com.accp.crm.biz.LostBiz;
import com.accp.crm.biz.OrdersBiz;
import com.accp.crm.biz.ServiceBiz;
import com.accp.crm.pojo.Custlost;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ReptAction extends ActionSupport implements RequestAware {
	private Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	private OrdersBiz ordersBiz;
	private ServiceBiz serviceBiz;
	private CustInfoBiz custInfoBiz;
	private LostBiz lostBiz;
	
	public void setOrdersBiz(OrdersBiz ordersBiz) {
		this.ordersBiz = ordersBiz;
	}
	public void setLostBiz(LostBiz lostBiz) {
		this.lostBiz = lostBiz;
	}
	public void setServiceBiz(ServiceBiz serviceBiz) {
		this.serviceBiz = serviceBiz;
	}
	public void setCustInfoBiz(CustInfoBiz custInfoBiz) {
		this.custInfoBiz = custInfoBiz;
	}
	/**
	 * 客户贡献统计
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public String custTotal(){
		String cust = ServletActionContext.getRequest().getParameter("cust");
		String year = ServletActionContext.getRequest().getParameter("year");
		try{
			List reptList = ordersBiz.reptTotal(cust, year);
			request.put("orderList", reptList);
			return "custTotal";
		}catch(HibernateException e){
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 客户构成（类型）统计
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public String custType(){
		String type = ServletActionContext.getRequest().getParameter("type");
		try{
			List reptList = custInfoBiz.reptByType(type);
			request.put("reptList", reptList);
			return "custType";
		}catch(HibernateException e){
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 服务类别统计
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public String servType(){
		String year = ServletActionContext.getRequest().getParameter("year");
		try{
			List reptList = serviceBiz.selectByType(year);
			request.put("reptList", reptList);
			return "servType";
		}catch(HibernateException e){
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 统计流失客户分页显示第一页
	 * @return
	 */
	public String firstPage(){
		String lostname = ServletActionContext.getRequest().getParameter("lostname");
		String lostmanager = ServletActionContext.getRequest().getParameter("lostmanager");
		Custlost custlost = new Custlost();
		custlost.setLostname(lostname);
		custlost.setLostmanager(lostmanager);
		try{
			int total = lostBiz.repttotal("Custlost",custlost);
			int totalPage = lostBiz.repttotalPage(5, "Custlost",custlost);
			List<Custlost> list = lostBiz.reptselectByPage("Custlost", 1, 5,custlost);
			request.put("total", total);
			request.put("list", list);
			request.put("totalPage", totalPage);
			request.put("currentPage", 1);
			if(list.size() == 0){
				request.put("mess", "查无记录");
			}
			return "firstPage";
		}catch(HibernateException e){
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 统计流失客户分页显示下一页
	 * @return
	 */
	public String nextPage(){
		int next = Integer.parseInt(ServletActionContext.getRequest().getParameter("next"));
		String lostname = ServletActionContext.getRequest().getParameter("lostname");
		String lostmanager = ServletActionContext.getRequest().getParameter("lostmanager");
		Custlost custlost = new Custlost();
		custlost.setLostname(lostname);
		custlost.setLostmanager(lostmanager);
		try{
			int total = lostBiz.repttotal("Custlost",custlost);
			int totalPage = lostBiz.repttotalPage(5, "Custlost",custlost);
			List<Custlost> list = lostBiz.reptselectByPage("Custlost", next, 5,custlost);
			request.put("total", total);
			request.put("list", list);
			request.put("totalPage", totalPage);
			request.put("currentPage", next);
			if(list.size() == 0){
				request.put("mess", "查无记录");
			}
			return "nextPage";
		}catch(HibernateException e){
			e.printStackTrace();
			return "error";
		}
	}
	
	
	
	private String type;
	private String total;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	
}
