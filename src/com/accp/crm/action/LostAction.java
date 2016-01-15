package com.accp.crm.action;

import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import com.accp.crm.biz.LostBiz;
import com.accp.crm.pojo.Custlost;
import com.opensymphony.xwork2.ModelDriven;

public class LostAction implements ModelDriven<Custlost>, RequestAware {
	private Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	private Custlost custlost = new Custlost();
	@Override
	public Custlost getModel() {
		return custlost;
	}
	private LostBiz lostBiz;
	public void setLostBiz(LostBiz lostBiz) {
		this.lostBiz = lostBiz;
	}
	/**
	 * 分页查询第一页
	 * @return
	 */
	public String firstPage(){
		try{
			int total = lostBiz.total("Custlost",custlost);
			int totalPage = lostBiz.totalPage(5, "Custlost",custlost);
			List<Custlost> list = lostBiz.searchByPage("Custlost", 1, 5,custlost);
			request.put("total", total);
			request.put("list", list);
			request.put("totalPage", totalPage);
			request.put("currentPage", 1);
			if(list.size() == 0){
				request.put("mess", "查无记录");
			}
			return "firstPage";
		}catch (Exception e) {
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
			int total = lostBiz.total("Custlost",custlost);
			int totalPage = lostBiz.totalPage(5, "Custlost",custlost);
			List<Custlost> list = lostBiz.searchByPage("Custlost", next, 5,custlost);
			request.put("total", total);
			request.put("list", list);
			request.put("totalPage", totalPage);
			request.put("currentPage", next);
			if(list.size() == 0){
				request.put("mess", "查无记录");
			}
			return "nextPage";
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 转向确认流失页面
	 * @return
	 */
	public String toConfirm(){
		int lostid = Integer.parseInt(ServletActionContext.getRequest().getParameter("lostid"));
		try{
			Custlost custlost = lostBiz.selectById(lostid);
			request.put("custlost", custlost);
			return "toConfirm";
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 确认流失
	 * @return
	 */
	public String confirm(){
		try{
			Date lostdate = new Date();
			String status = "已经流失";
			custlost.setLostdate(lostdate);
			custlost.setStatus(status);
			lostBiz.update(custlost);
			custlost.setLostname("");//设置为空，适应通用模糊查询
			custlost.setLostmanager("");
			custlost.setStatus("");
			return firstPage();
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 转向暂缓流失页面
	 * @return
	 */
	public String toDelay(){
		int lostid = Integer.parseInt(ServletActionContext.getRequest().getParameter("lostid"));
		try{
			Custlost custlost = lostBiz.selectById(lostid);
			request.put("custlost", custlost);
			return "toDelay";
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 暂缓流失
	 * @return
	 */
	public String delay(){
		String delay = ServletActionContext.getRequest().getParameter("delay");
		Integer lostid = Integer.parseInt(ServletActionContext.getRequest().getParameter("lostid"));
		Custlost custlost = lostBiz.selectById(lostid);
		custlost.setStatus("暂缓流失");
		custlost.setDelay(custlost.getDelay()+"<br/><br/>"+delay);
		try{
			lostBiz.update(custlost);
			custlost.setLostname("");//设置为空，适应通用模糊查询
			custlost.setLostmanager("");
			custlost.setStatus("");
			return firstPage();
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 转向流失列表
	 * @return
	 */
	public String toDetail(){
		int lostid = Integer.parseInt(ServletActionContext.getRequest().getParameter("lostid"));
		try{
			Custlost custlost = lostBiz.selectById(lostid);
			request.put("custlost", custlost);
			return "toDetail";
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
}
