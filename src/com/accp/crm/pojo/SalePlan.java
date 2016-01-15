package com.accp.crm.pojo;

import java.util.Date;

public class SalePlan {
	private Integer planId;
	private Integer chanceId;
	private Date time;
	private String planContent;
	private String result;
	private String status;
	
	
	public SalePlan() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SalePlan(Integer planId, Integer chanceId,Date time, String planContent, String result,
			String status) {
		super();
		this.planId = planId;
		this.chanceId=chanceId;
		this.time = time;
		this.planContent = planContent;
		this.result = result;
		this.status = status;
	}

	
	public Integer getPlanId() {
		return planId;
	}
	public void setPlanId(Integer planId) {
		this.planId = planId;
	}
	public Integer getChanceId() {
		return chanceId;
	}
	public void setChanceId(Integer chanceId) {
		this.chanceId = chanceId;
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
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
}
