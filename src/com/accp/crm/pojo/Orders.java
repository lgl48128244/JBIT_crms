package com.accp.crm.pojo;

public class Orders {

	// Fields

	private Integer oid;
	private String custno;
	private String custname;
	private String odate;
	private String address;
	private Integer status;

	// Constructors

	/** default constructor */
	public Orders() {
	}
	
	public Orders(String custname, long status) {
		super();
		this.custname = custname;
		this.status = (int)status;
	}
	/** full constructor */
	public Orders(Integer oid, String custno, String custname, String odate,
			String address, Integer status) {
		this.oid = oid;
		this.custno = custno;
		this.custname = custname;
		this.odate = odate;
		this.address = address;
		this.status = status;
	}

	// Property accessors

	public Integer getOid() {
		return this.oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
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

	public String getOdate() {
		return this.odate;
	}

	public void setOdate(String odate) {
		this.odate = odate;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}