package com.accp.crm.action;

import java.util.List;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import com.accp.crm.biz.CustInfoBiz;
import com.accp.crm.biz.LinkmanBiz;
import com.accp.crm.pojo.CustInfo;
import com.accp.crm.pojo.Linkman;
import com.opensymphony.xwork2.ModelDriven;

public class LinkmanAction implements ModelDriven<Linkman>, RequestAware {
	private LinkmanBiz linkmanBiz;
	private CustInfoBiz custInfoBiz;
	
	public void setCustInfoBiz(CustInfoBiz custInfoBiz) {
		this.custInfoBiz = custInfoBiz;
	}
	public void setLinkmanBiz(LinkmanBiz linkmanBiz) {
		this.linkmanBiz = linkmanBiz;
	}
	private Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	private Linkman linkman = new Linkman();
	@Override
	public Linkman getModel() {
		return linkman;
	}
	/**
	 * 查询所有联系人
	 * @return
	 */
	public String selectAll(){
		int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		try{
			CustInfo custInfo = custInfoBiz.selectById(id);
			List<Linkman> list = linkmanBiz.selectByCustno(custInfo.getCustno());
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
	 * 添加联系人
	 * @return
	 */
	public String add(){
		try{
			linkmanBiz.add(linkman);
			return selectAll();
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 删除联系人
	 * @return
	 */
	public String delete(){
		int lid = Integer.parseInt(ServletActionContext.getRequest().getParameter("lid"));
		try{
			Linkman linkman = linkmanBiz.selectById(lid);
			linkmanBiz.delete(linkman);
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
		int lid = Integer.parseInt(ServletActionContext.getRequest().getParameter("lid"));
		try{
			Linkman linkman = linkmanBiz.selectById(lid);
			CustInfo custInfo = custInfoBiz.selectById(id);
			request.put("custInfo", custInfo);
			request.put("linkman", linkman);
			return "toUpdate";
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 更新联系人
	 * @return
	 */
	public String update(){
		try{
			linkmanBiz.update(linkman);
			return selectAll();
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
}
