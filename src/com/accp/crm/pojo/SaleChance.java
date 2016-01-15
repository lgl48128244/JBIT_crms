package com.accp.crm.pojo;

import java.util.Date;

public class SaleChance {
	private Integer id;
	private String name = "";
	private String resume = "";
	private String linkMan = "";
	private String tel;
	private String createMan;
	private String assignMan = "未指派";
	private Date assignTime = new Date();
	private String chanceFrom;
	private String chanceDesc;
	private Integer probability; //成功概率
	private Integer status = 0;  //开发状态
	private Date createTime = new Date();
	
	
	public SaleChance() {
		super();
	}
	public SaleChance(Integer id, String name, String resume, String linkMan,
			String tel, String createMan, String assignMan, Date assignTime,
			String chanceFrom, String chanceDesc, Integer probability,Integer status,
			Date createTime) {
		super();
		this.id = id;
		this.name = name;
		this.resume = resume;
		this.linkMan = linkMan;
		this.tel = tel;
		this.createMan = createMan;
		this.assignMan = assignMan;
		this.assignTime = assignTime;
		this.chanceFrom = chanceFrom;
		this.chanceDesc = chanceDesc;
		this.probability = probability;
		this.status = status;
		this.createTime = createTime;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	public String getLinkMan() {
		return linkMan;
	}
	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getCreateMan() {
		return createMan;
	}
	public void setCreateMan(String createMan) {
		this.createMan = createMan;
	}
	public String getAssignMan() {
		return assignMan;
	}
	public void setAssignMan(String assignMan) {
		this.assignMan = assignMan;
	}
	public Date getAssignTime() {
		return assignTime;
	}
	public void setAssignTime(Date assignTime) {
		this.assignTime = assignTime;
	}
	public String getChanceFrom() {
		return chanceFrom;
	}
	public void setChanceFrom(String chanceFrom) {
		this.chanceFrom = chanceFrom;
	}
	public String getChanceDesc() {
		return chanceDesc;
	}
	public void setChanceDesc(String chanceDesc) {
		this.chanceDesc = chanceDesc;
	}
	public Integer getProbability() {
		return probability;
	}
	public void setProbability(Integer probability) {
		this.probability = probability;
	}
	
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	
	
}
