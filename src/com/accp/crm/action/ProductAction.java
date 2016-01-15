package com.accp.crm.action;

import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.RequestAware;

import com.accp.crm.biz.ProductBiz;
import com.accp.crm.pojo.Product;
import com.opensymphony.xwork2.ModelDriven;

public class ProductAction implements ModelDriven<Product>, RequestAware {
	private ProductBiz productBiz;
	public void setProductBiz(ProductBiz productBiz) {
		this.productBiz = productBiz;
	}
	private Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	Product product = new Product();
	@Override
	public Product getModel() {
		return product;
	}
	private int next;
	
	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}
	
	/**
	 * 分页查询第一页
	 */
	public String firstPage(){
		try{
			int total = productBiz.total("Product",product);
			int totalPage = productBiz.totalPage(5, "Product",product);
			List<Product> list = productBiz.selectByPage("Product", 1, 5,product);
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
		int next = (Integer) request.get("next");
		try{
			int total = productBiz.total("Product",product);
			int totalPage = productBiz.totalPage(5, "Product",product);
			List<Product> list = productBiz.selectByPage("Product", next, 5,product);
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
}
