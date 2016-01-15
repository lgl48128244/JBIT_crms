package com.accp.crm.pojo;

import java.util.Date;

public class Custlost {

	// Fields

	private Integer lostid;
	private String lostno;
	private String lostname = "";
	private String lostmanager = "";
	private Date lastorderdate;
	private Date lostdate;
	private String delay;
	private String reason;
	private String status = "";

	// Constructors

	/** default constructor */
	public Custlost() {
	}
	/** full constructor */
	public Custlost(Integer lostid, String lostno, String lostname,
			String lostmanager, Date lastorderdate, Date lostdate,
			String delay, String reason, String status) {
		this.lostid = lostid;
		this.lostno = lostno;
		this.lostname = lostname;
		this.lostmanager = lostmanager;
		this.lastorderdate = lastorderdate;
		this.lostdate = lostdate;
		this.delay = delay;
		this.reason = reason;
		this.status = status;
	}

	// Property accessors

	public Integer getLostid() {
		return this.lostid;
	}

	public void setLostid(Integer lostid) {
		this.lostid = lostid;
	}

	public String getLostno() {
		return this.lostno;
	}

	public void setLostno(String lostno) {
		this.lostno = lostno;
	}

	public String getLostname() {
		return this.lostname;
	}

	public void setLostname(String lostname) {
		this.lostname = lostname;
	}

	public String getLostmanager() {
		return this.lostmanager;
	}

	public void setLostmanager(String lostmanager) {
		this.lostmanager = lostmanager;
	}

	public Date getLastorderdate() {
		return this.lastorderdate;
	}

	public void setLastorderdate(Date lastorderdate) {
		this.lastorderdate = lastorderdate;
	}

	public Date getLostdate() {
		return this.lostdate;
	}

	public void setLostdate(Date lostdate) {
		this.lostdate = lostdate;
	}

	public String getDelay() {
		return this.delay;
	}

	public void setDelay(String delay) {
		this.delay = delay;
	}

	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}