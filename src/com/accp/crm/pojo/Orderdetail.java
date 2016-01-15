package com.accp.crm.pojo;

public class Orderdetail{

	// Fields

	private Integer did;
	private Integer orderid;
	private Integer prodid;
	private Integer count;
	private String unit;
	private Integer total;

	// Constructors

	/** default constructor */
	public Orderdetail() {
	}	
	public Orderdetail(Integer did, Integer orderid, Integer prodid,
			Integer count, String unit, Integer total) {
		super();
		this.did = did;
		this.orderid = orderid;
		this.prodid = prodid;
		this.count = count;
		this.unit = unit;
		this.total = total;
	}



	public Integer getDid() {
		return did;
	}

	public void setDid(Integer did) {
		this.did = did;
	}

	public Integer getOrderid() {
		return orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public Integer getProdid() {
		return prodid;
	}

	public void setProdid(Integer prodid) {
		this.prodid = prodid;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	
}