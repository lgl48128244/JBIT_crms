package com.accp.crm.action;

import java.util.List;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import com.accp.crm.biz.SaleChanceBiz;
import com.accp.crm.biz.UsersBiz;
import com.accp.crm.pojo.SaleChance;
import com.accp.crm.pojo.Users;
import com.opensymphony.xwork2.ModelDriven;

public class SaleChanceAction implements ModelDriven<SaleChance>, RequestAware{
	private int next;
	public int getNext() {
		return next;
	}
	public void setNext(int next) {
		this.next = next;
	}
	
	private SaleChanceBiz saleChanceBiz;
	private UsersBiz usersBiz;
	public void setUsersBiz(UsersBiz usersBiz) {
		this.usersBiz = usersBiz;
	}
	public void setSaleChanceBiz(SaleChanceBiz saleChanceBiz) {
		this.saleChanceBiz = saleChanceBiz;
	}
	private SaleChance saleChance = new SaleChance();
	@Override
	public SaleChance getModel() {
		return saleChance;
	}
	private Map<String, Object> request;
	
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	
	/**
	 * 添加销售机会
	 */
	public String add(){
		try{
			saleChanceBiz.add(saleChance);
			saleChance.setName("");
			saleChance.setResume("");
			saleChance.setLinkMan("");
			return searchFirstPage();
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 通过ID查找销售机会
	 */
	public String selectById(){
		try{
//			Integer id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
			int id = saleChance.getId();
			SaleChance saleChance = saleChanceBiz.selectById(id);
			if(null != saleChance){
				request.put("saleChance", saleChance);
			}
			return "selectById";
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 获取指派销售机会
	 */
	public String appointById(){
		Integer roleId = Integer.parseInt(ServletActionContext.getRequest().getParameter("roleId"));
		Integer id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		try{
			List<Users> list = usersBiz.selectByRoleId(roleId);
			if(null != list){
				request.put("roleList", list);
			}
			SaleChance saleChance = saleChanceBiz.selectById(id);
			request.put("saleChance", saleChance);
			return "appointById";
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 更新销售机会
	 */
	public String update(){
		try{
			saleChanceBiz.update(saleChance);
			saleChance.setName("");
			saleChance.setResume("");
			saleChance.setLinkMan("");
			return searchFirstPage();
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 删除销售机会
	 */
	public String delete(){
		try{
			Integer id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
			SaleChance saleChance = saleChanceBiz.selectById(id);
			saleChanceBiz.delete(saleChance);
			return searchFirstPage();
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 组合查询第一页
	 * @return
	 */
	public String searchFirstPage(){
		try{
			int total = saleChanceBiz.totals("SaleChance", saleChance);
			List<SaleChance> list = saleChanceBiz.searchByPages("SaleChance", 1, 5,saleChance);
			int totalPage = saleChanceBiz.searchNextPages(5, "SaleChance", saleChance);
			request.put("list", list);
			request.put("total", total);
			request.put("currentPage", 1);
			request.put("totalPage",totalPage );
			if(list.size() == 0){
				request.put("mess", "查无记录");
			}
			return "searchFirstPage";
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 组合查询下一页
	 * @return
	 */
	public String searchNextPage(){
		try{
			int total = saleChanceBiz.totals("SaleChance",saleChance);
			List<SaleChance> list = saleChanceBiz.searchByPages("SaleChance", next, 5,saleChance);
			int totalPage = saleChanceBiz.searchNextPages(5, "SaleChance",saleChance);
			request.put("list", list);
			request.put("total", total);
			request.put("currentPage", next);
			request.put("totalPage",totalPage );
			return "searchNextPage";
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	}

}
