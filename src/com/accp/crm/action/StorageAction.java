package com.accp.crm.action;

import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.RequestAware;
import org.hibernate.HibernateException;
import com.accp.crm.biz.StorageBiz;
import com.accp.crm.pojo.Storage;
import com.opensymphony.xwork2.ModelDriven;

public class StorageAction implements ModelDriven<Storage>, RequestAware {
	private int next;
	
	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}
	private Map<String,Object> request;
	@Override
	public void setRequest(Map<String, Object> request){
		this.request = request;
	}
	Storage storage = new Storage();
	@Override
	public Storage getModel() {
		return storage;
	}
	
	private StorageBiz storageBiz;
	public void setStorageBiz(StorageBiz storageBiz) {
		this.storageBiz = storageBiz;
	}

	/**
	 * 分页查询第一页
	 */
	public String firstPage(){
		try{
			int total = storageBiz.total("Storage",storage);
			int totalPage = storageBiz.totalPage(5, "Storage",storage);
			List<Storage> list = storageBiz.selectByPage("Storage", 1, 5,storage);
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
	 * 分页查询第一页
	 */
	public String nextPage(){
		int next = (Integer) request.get("next");
		try{
			int total = storageBiz.total("Storage",storage);
			int totalPage = storageBiz.totalPage(5, "Storage",storage);
			List<Storage> list = storageBiz.selectByPage("Storage", next, 5,storage);
			request.put("total", total);
			request.put("list", list);
			request.put("totalPage", totalPage);
			request.put("currentPage", next);
			if(list.size() == 0){
				request.put("mess", "查无记录");
			}
			return "firstPage";
		}catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}
}
