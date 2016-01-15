package com.accp.crm.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import com.accp.crm.biz.CustInfoBiz;
import com.accp.crm.biz.DictionaryBiz;
import com.accp.crm.pojo.CustInfo;
import com.accp.crm.pojo.Dictionary;
import com.opensymphony.xwork2.ModelDriven;

public class CustInfoAction implements ModelDriven<CustInfo>, RequestAware {
	private CustInfoBiz custInfoBiz;
	private DictionaryBiz dictionaryBiz;
	
	public void setDictionaryBiz(DictionaryBiz dictionaryBiz) {
		this.dictionaryBiz = dictionaryBiz;
	}
	public void setCustInfoBiz(CustInfoBiz custInfoBiz) {
		this.custInfoBiz = custInfoBiz;
	}
	private Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	private CustInfo custInfo = new CustInfo();
	@Override
	public CustInfo getModel() {
		return custInfo;
	}
	/**
	 * 分页查询第一页
	 */
	public String firstPage(){
		try{
			int total = custInfoBiz.total("CustInfo",custInfo);
			int totalPage = custInfoBiz.totalPage(5, "CustInfo",custInfo);
			List<CustInfo> list = custInfoBiz.selectByPage("CustInfo", 1, 5,custInfo);
			List<Dictionary> regionList =dictionaryBiz.selectByType("地区");
			List<Dictionary> levelList =dictionaryBiz.selectByType("客户等级");
			request.put("regionList", regionList);
			request.put("levelList", levelList);
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
	 */
	public String nextPage(){
		int next = Integer.parseInt(ServletActionContext.getRequest().getParameter("next"));
		try{
			int total = custInfoBiz.total("CustInfo",custInfo);
			int totalPage = custInfoBiz.totalPage(5, "CustInfo",custInfo);
			List<CustInfo> list = custInfoBiz.selectByPage("CustInfo", next, 5,custInfo);
			List<Dictionary> regionList =dictionaryBiz.selectByType("地区");
			List<Dictionary> levelList =dictionaryBiz.selectByType("客户等级");
			request.put("regionList", regionList);
			request.put("levelList", levelList);
			request.put("total", total);
			request.put("list", list);
			request.put("totalPage", totalPage);
			request.put("currentPage", next);
			return "nextPage";
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 转到客户编辑页
	 * @return
	 */
	public String toEdit(){
		int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		try{
			CustInfo custInfo = custInfoBiz.selectById(id);
			List<Dictionary> regionList = dictionaryBiz.selectByType("地区");
			List<Dictionary> levelList = dictionaryBiz.selectByType("客户等级");
			List<Dictionary> satisfyList = dictionaryBiz.selectByType("客户满意度");
			List<Dictionary> creditList = dictionaryBiz.selectByType("客户信用度");
			request.put("custInfo", custInfo);
			request.put("regionList", regionList);
			request.put("levelList", levelList);
			request.put("satisfyList", satisfyList);
			request.put("creditList", creditList);
			return "toEdit";
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 更新客户
	 * @return
	 */
	public String update(){
		try{
			custInfoBiz.update(custInfo);
			custInfo.setCustno("");
			custInfo.setName("");
			custInfo.setLevelLabel("");
			custInfo.setRegion("");
			custInfo.setCustManager("");
			return firstPage();
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 删除客户
	 * @return
	 */
	public String delete(){
		int id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		try{
			CustInfo custInfo = custInfoBiz.selectById(id);
			custInfoBiz.delete(custInfo);
			return firstPage();
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
}
