package com.accp.crm.pojo;

import java.util.Date;

public class Service {

	// Fields

	private Integer sid;
	private String type = "";
	private String title = "";
	private String custno;
	private String custname = "";
	private String status = "";
	private String srequest;
	private String creater;
	private String createdate = "";
	private String dueto;
	private Date duetime;
	private String sdeal;
	private String dealer;
	private Date dealdate;
	private String result;
	private String satisfy;
	// Constructors

	/** default constructor */
	public Service() {
	}
	public Service(String type,long sid) {
		this.type = type;
		this.sid=(int) sid;
	}
	/** full constructor */
	public Service(Integer sid, String type, String title, String custno,
			String custname, String status, String srequest, String creater,
			String createdate, String dueto, Date duetime, String sdeal,
			String dealer, Date dealdate, String result, String satisfy) {
		this.sid = sid;
		this.type = type;
		this.title = title;
		this.custno = custno;
		this.custname = custname;
		this.status = status;
		this.srequest = srequest;
		this.creater = creater;
		this.createdate = createdate;
		this.dueto = dueto;
		this.duetime = duetime;
		this.sdeal = sdeal;
		this.dealer = dealer;
		this.dealdate = dealdate;
		this.result = result;
		this.satisfy = satisfy;
	}

	// Property accessors

	public Integer getSid() {
		return this.sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSrequest() {
		return this.srequest;
	}

	public void setSrequest(String srequest) {
		this.srequest = srequest;
	}

	public String getCreater() {
		return this.creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public String getCreatedate() {
		return this.createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public String getDueto() {
		return this.dueto;
	}

	public void setDueto(String dueto) {
		this.dueto = dueto;
	}

	public Date getDuetime() {
		return this.duetime;
	}

	public void setDuetime(Date duetime) {
		this.duetime = duetime;
	}

	public String getSdeal() {
		return this.sdeal;
	}

	public void setSdeal(String sdeal) {
		this.sdeal = sdeal;
	}

	public String getDealer() {
		return this.dealer;
	}

	public void setDealer(String dealer) {
		this.dealer = dealer;
	}

	public Date getDealdate() {
		return this.dealdate;
	}

	public void setDealdate(Date dealdate) {
		this.dealdate = dealdate;
	}

	public String getResult() {
		return this.result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getSatisfy() {
		return this.satisfy;
	}

	public void setSatisfy(String satisfy) {
		this.satisfy = satisfy;
	}

}