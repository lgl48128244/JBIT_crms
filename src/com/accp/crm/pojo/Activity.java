package com.accp.crm.pojo;

import java.util.Date;

public class Activity {

	// Fields

	private Integer aid;
	private String custno;
	private String custname;
	private Date actdate;
	private String place;
	private String title;
	private String actdesc;
	private String remark;

	// Constructors

	/** default constructor */
	public Activity() {
	}

	/** full constructor */
	public Activity(Integer aid, String custno, String custname,
			Date actdate, String place, String title, String actdesc,
			String remark) {
		this.aid = aid;
		this.custno = custno;
		this.custname = custname;
		this.actdate = actdate;
		this.place = place;
		this.title = title;
		this.actdesc = actdesc;
		this.remark = remark;
	}

	// Property accessors

	public Integer getAid() {
		return this.aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public String getCustno() {
		return this.custno;
	}

	public void setCustno(String custno) {
		this.custno = custno;
	}

	public String getCustname() {
		return this.custname;
	}

	public void setCustname(String custname) {
		this.custname = custname;
	}

	public Date getActdate() {
		return this.actdate;
	}

	public void setActdate(Date actdate) {
		this.actdate = actdate;
	}

	public String getPlace() {
		return this.place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getActdesc() {
		return this.actdesc;
	}

	public void setActdesc(String actdesc) {
		this.actdesc = actdesc;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}