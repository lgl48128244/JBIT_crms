package com.accp.crm.pojo;

public class Power {

	// Fields

	private String powerid;
	private String powerdesc;
	private String url;

	// Constructors

	/** default constructor */
	public Power() {
	}

	/** full constructor */
	public Power(String powerid, String powerdesc, String url) {
		this.powerid = powerid;
		this.powerdesc = powerdesc;
		this.url = url;
	}

	// Property accessors

	public String getPowerid() {
		return this.powerid;
	}

	public void setPowerid(String powerid) {
		this.powerid = powerid;
	}

	public String getPowerdesc() {
		return this.powerdesc;
	}

	public void setPowerdesc(String powerdesc) {
		this.powerdesc = powerdesc;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}