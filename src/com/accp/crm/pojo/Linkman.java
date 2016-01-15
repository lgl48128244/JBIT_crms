package com.accp.crm.pojo;

public class Linkman {

	// Fields

	private Integer lid;
	private String custno;
	private String custname;
	private String name;
	private String sex;
	private String position;
	private String tel;
	private String mobile;
	private String remark;

	// Constructors

	/** default constructor */
	public Linkman() {
	}

	/** full constructor */
	public Linkman(Integer lid, String custno, String custname, String name,
			String sex, String position, String tel, String mobile,
			String remark) {
		this.lid = lid;
		this.custno = custno;
		this.custname = custname;
		this.name = name;
		this.sex = sex;
		this.position = position;
		this.tel = tel;
		this.mobile = mobile;
		this.remark = remark;
	}

	// Property accessors

	
	public String getCustno() {
		return this.custno;
	}

	public Integer getLid() {
		return lid;
	}

	public void setLid(Integer lid) {
		this.lid = lid;
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

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}