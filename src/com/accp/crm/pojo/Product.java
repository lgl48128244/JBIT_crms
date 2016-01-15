package com.accp.crm.pojo;

public class Product {

	private Integer id;
	private String name = "";
	private String typeNo = "";
	private String grades;
	private String batch = "";
	private String unit;
	private Integer price;
	private String remark;
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(Integer id, String name, String typeNo, String grades,
			String batch, String unit, Integer price, String remark) {
		super();
		this.id = id;
		this.name = name;
		this.typeNo = typeNo;
		this.grades = grades;
		this.batch = batch;
		this.unit = unit;
		this.price = price;
		this.remark = remark;
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

	public String getTypeNo() {
		return typeNo;
	}

	public void setTypeNo(String typeNo) {
		this.typeNo = typeNo;
	}

	public String getGrades() {
		return grades;
	}

	public void setGrades(String grades) {
		this.grades = grades;
	}

	public String getBatch() {
		return batch;
	}

	public void setBatch(String batch) {
		this.batch = batch;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}
