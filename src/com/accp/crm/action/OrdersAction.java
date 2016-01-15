package com.accp.crm.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import com.accp.crm.biz.CustInfoBiz;
import com.accp.crm.biz.OrderdetailBiz;
import com.accp.crm.biz.OrdersBiz;
import com.accp.crm.biz.ProductBiz;
import com.accp.crm.pojo.CustInfo;
import com.accp.crm.pojo.Orderdetail;
import com.accp.crm.pojo.Orders;
import com.accp.crm.pojo.Product;
import com.opensymphony.xwork2.ModelDriven;

public class OrdersAction implements ModelDriven<Orders>, RequestAware {
	private Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	private Orders orders = new Orders();
	@Override
	public Orders getModel() {
		return orders;
	}
	private OrdersBiz ordersBiz;
	private CustInfoBiz custInfoBiz;
	private OrderdetailBiz orderdetailBiz;
	private ProductBiz productBiz;
	
	public void setProductBiz(ProductBiz productBiz) {
		this.productBiz = productBiz;
	}
	public void setOrderdetailBiz(OrderdetailBiz orderdetailBiz) {
		this.orderdetailBiz = orderdetailBiz;
	}
	public void setCustInfoBiz(CustInfoBiz custInfoBiz) {
		this.custInfoBiz = custInfoBiz;
	}
	public void setOrdersBiz(OrdersBiz ordersBiz) {
		this.ordersBiz = ordersBiz;
	}
	/**
	 * 分页显示第一页
	 * @return
	 */
	public String firstPage(){
		Integer id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		try{
			CustInfo custInfo = custInfoBiz.selectById(id);
			int total = ordersBiz.totals("Orders", new String[] {}, new String[] {}, custInfo.getCustno());
			int totalPage = ordersBiz.totalPages(5, "Orders",custInfo.getCustno());
			List<Orders> list = ordersBiz.selectByPages("Orders", 1, 5,new String[] {}, new String[] {},custInfo.getCustno());
			request.put("custInfo", custInfo);
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
	 * 分页显示下一页
	 * @return
	 */
	public String nextPage(){
		Integer id = Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		Integer next = Integer.parseInt(ServletActionContext.getRequest().getParameter("next"));
		try{
			CustInfo custInfo = custInfoBiz.selectById(id);
			int total = ordersBiz.totals("Orders", new String[] {}, new String[] {}, custInfo.getCustno());
			int totalPage = ordersBiz.totalPages(5, "Orders",custInfo.getCustno());
			List<Orders> list = ordersBiz.selectByPages("Orders", next, 5,new String[] {}, new String[] {},custInfo.getCustno());
			request.put("custInfo", custInfo);
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
	 * 查看明细
	 * @return
	 */
	public String detail(){
		Integer oid = Integer.parseInt(ServletActionContext.getRequest().getParameter("oid"));
		try{
			List<Orderdetail> detail = orderdetailBiz.selectByOrderId(oid);
			Orders orders = ordersBiz.selectById(oid);
			List<Product> plist = new ArrayList<Product>();
			for(int i=0;null!=detail&&i<detail.size();i++){
				Product product = productBiz.selectById(detail.get(i).getProdid());
				plist.add(product);
			}
			request.put("plist", plist);
			request.put("detail", detail);
			request.put("orders", orders);
			return "detail";
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
}
