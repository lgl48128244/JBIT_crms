package com.accp.crm.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.hibernate.HibernateException;

import com.accp.crm.biz.CustInfoBiz;
import com.accp.crm.biz.LinkmanBiz;
import com.accp.crm.biz.SaleChanceBiz;
import com.accp.crm.biz.SalePlanBiz;
import com.accp.crm.pojo.CustInfo;
import com.accp.crm.pojo.Linkman;
import com.accp.crm.pojo.SaleChance;
import com.accp.crm.pojo.SalePlan;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("serial")
public class SalePlanAction extends ActionSupport implements ModelDriven<SaleChance>, RequestAware {
	private SalePlanBiz salePlanBiz;
	private SaleChanceBiz saleChanceBiz;
	private CustInfoBiz custInfoBiz;
	private LinkmanBiz linkmanBiz;
	
	public void setLinkmanBiz(LinkmanBiz linkmanBiz) {
		this.linkmanBiz = linkmanBiz;
	}
	public void setCustInfoBiz(CustInfoBiz custInfoBiz) {
		this.custInfoBiz = custInfoBiz;
	}
	public void setSalePlanBiz(SalePlanBiz salePlanBiz) {
		this.salePlanBiz = salePlanBiz;
	}
	public void setSaleChanceBiz(SaleChanceBiz saleChanceBiz) {
		this.saleChanceBiz = saleChanceBiz;
	}
	private Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	private SaleChance saleChance = new SaleChance();
	@Override
	public SaleChance getModel() {
		return saleChance;
	}
	private Integer planId;
	private Date time;
	private String planContent;
	private int chanceId;
	private String result;
	
	
	public Integer getPlanId() {
		return planId;
	}
	public void setPlanId(Integer planId) {
		this.planId = planId;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getPlanContent() {
		return planContent;
	}
	public void setPlanContent(String planContent) {
		this.planContent = planContent;
	}
	public int getChanceId() {
		return chanceId;
	}
	public void setChanceId(int chanceId) {
		this.chanceId = chanceId;
	}
	/**
	 * 分页查询第一页
	 * @return
	 */
	public String firstPage(){
		try{
			int total = saleChanceBiz.total("SaleChance",saleChance);
			List<SaleChance> list = saleChanceBiz.searchByPage("SaleChance", 1, 5,saleChance);
			int totalPage =saleChanceBiz.searchNextPage(5, "SaleChance",saleChance);
			List<SalePlan> salePlan = salePlanBiz.selectAll();
			request.put("salePlan", salePlan);
			request.put("total", total);
			request.put("list", list);
			request.put("totalPage", totalPage);
			request.put("currentPage", 1);
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
		return "firstPage";
	}
	/**
	 * 分页查询下一页
	 * @return
	 */
	public String nextPage(){
		int next = Integer.parseInt(ServletActionContext.getRequest().getParameter("next"));
		try{
			int total = saleChanceBiz.total("SaleChance",saleChance);
			List<SaleChance> list = saleChanceBiz.searchByPage("SaleChance", next, 5,saleChance);
			int totalPage =saleChanceBiz.searchNextPage(5, "SaleChance",saleChance);
			request.put("total", total);
			request.put("list", list);
			request.put("totalPage", totalPage);
			request.put("currentPage", next);
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
		return "nextPage";
	}
	/**
	 * 去添加开发计划页
	 * @return
	 */
	public String toAdd(){
		Integer id = Integer.parseInt(ServletActionContext.getRequest().getParameter("chanceId"));
		try{
			SaleChance chance = saleChanceBiz.selectById(id);
			List<SalePlan> planList = salePlanBiz.selectByChanceId(id);
			request.put("chance", chance);
			request.put("planList", planList);
			return "toAdd";
			
		}catch(HibernateException e){
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 添加开发计划
	 * @return
	 */
	public String add(){
			try{
				SalePlan salePlan = new SalePlan();
				salePlan.setTime(time);
				salePlan.setPlanContent(planContent);
				salePlan.setChanceId(chanceId);
				salePlanBiz.add(salePlan);
				return toAdd();
			}catch(Exception e){
				e.printStackTrace();
				return "error";
			}
	}
	/**
	 * 删除开发计划
	 * @return
	 */
	public String delete(){
		int planId = Integer.parseInt(ServletActionContext.getRequest().getParameter("planId"));
		System.out.println(planId);
		try{
			SalePlan salePlan = salePlanBiz.selectById(planId);
			salePlanBiz.delete(salePlan);
			return toAdd();
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 去执行计划页
	 * @return
	 */
	public String toDoPlan(){
		Integer id = Integer.parseInt(ServletActionContext.getRequest().getParameter("chanceId"));
		try{
			SaleChance chance = saleChanceBiz.selectById(id);
			List<SalePlan> planList = salePlanBiz.selectByChanceId(id);
			request.put("chance", chance);
			request.put("planList", planList);
			return "toDoPlan";
			
		}catch(HibernateException e){
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 去计划详单页
	 * @return
	 */
	public String toDetail(){
		Integer id = Integer.parseInt(ServletActionContext.getRequest().getParameter("chanceId"));
		try{
			SaleChance chance = saleChanceBiz.selectById(id);
			List<SalePlan> planList = salePlanBiz.selectByChanceId(id);
			request.put("chance", chance);
			request.put("planList", planList);
			return "toDetail";
			
		}catch(HibernateException e){
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 更新计划执行结果
	 * @return
	 */
	public String update(){
		try{
			SalePlan salePlan = salePlanBiz.selectById(planId);
			salePlan.setResult(result);
			salePlanBiz.update(salePlan);
			return toDoPlan();
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 销售计划归档
	 * @return
	 */
	public String updateFail(){
		Integer chanceId = Integer.parseInt(ServletActionContext.getRequest().getParameter("chanceId"));
		try{
			SaleChance saleChance = saleChanceBiz.selectById(chanceId);
			saleChance.setStatus(2);
			saleChanceBiz.update(saleChance);
			return firstPage();
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 销售计划开发成功
	 * @return
	 */
	public String updateSuccess(){
		Integer chanceId = Integer.parseInt(ServletActionContext.getRequest().getParameter("chanceId"));
		try{
			SaleChance saleChance = saleChanceBiz.selectById(chanceId);
			saleChance.setStatus(1);
			saleChanceBiz.update(saleChance);
			SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String nowTime = sf.format(new Date());
			nowTime = nowTime.substring(2, 4) + nowTime.substring(5, 7)
					+ nowTime.substring(8, 10) + nowTime.substring(11, 13)
					+ nowTime.substring(14, 16) + nowTime.substring(17, 19);
			String custno = "KH" + nowTime + (int) (Math.random() * 1000);//动态产生客户编号
			String region = " "; //模糊查询项设置为空
			String levelLabel = " ";
			CustInfo custInfo = new CustInfo();
			custInfo.setCustno(custno);
			custInfo.setName(saleChance.getName());
			custInfo.setCustManager(saleChance.getLinkMan());
			custInfo.setTel(saleChance.getTel());
			custInfo.setRegion(region);
			custInfo.setLevelLabel(levelLabel);
			custInfoBiz.add(custInfo);//该开发成功的机会，添加为新客户
			Linkman linkman = new Linkman();
			linkman.setCustname(saleChance.getName());
			linkman.setCustno(custno);
			linkman.setName(saleChance.getLinkMan());
			linkman.setMobile(saleChance.getTel());
			linkman.setPosition("经理");
			linkman.setSex("女");
			linkmanBiz.add(linkman);//添加联系人到联系人列表
			return firstPage();
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	}
}
