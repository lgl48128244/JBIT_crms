package com.accp.crm.pojo;

public class Storage {
	private Integer id;
	private String prod_id;
	private String prod_name = "";
	private String ware_house = "";
	private String ware;
	private Integer count;
	private String remark;
	
	public Storage() {
		super();
	}
	public Storage(Integer id, String prod_id,String prod_name, String ware_house, String ware,
			Integer count, String remark) {
		super();
		this.id = id;
		this.prod_id = prod_id;
		this.prod_name = prod_name;
		this.ware_house = ware_house;
		this.ware = ware;
		this.count = count;
		this.remark = remark;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProd_id() {
		return prod_id;
	}
	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getWare_house() {
		return ware_house;
	}
	public void setWare_house(String ware_house) {
		this.ware_house = ware_house;
	}
	public String getWare() {
		return ware;
	}
	public void setWare(String ware) {
		this.ware = ware;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
