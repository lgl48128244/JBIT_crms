package com.accp.crm.pojo;

public class Dictionary {
	private int dict_id;
	private String dict_type = "";
	private String dict_item = "";
	private String dict_value = "";
	private int dict_isEdit;
	
	public Dictionary() {
		super();
		
	}
	public Dictionary(String dict_type) {
		super();
		this.dict_type=dict_type;
	}
	public Dictionary(int dict_id, String dict_type, String dict_item,
			String dict_value, int dict_isEdit) {
		super();
		this.dict_id = dict_id;
		this.dict_type = dict_type;
		this.dict_item = dict_item;
		this.dict_value = dict_value;
		this.dict_isEdit = dict_isEdit;
	}
	public int getDict_id() {
		return dict_id;
	}
	public void setDict_id(int dict_id) {
		this.dict_id = dict_id;
	}
	public String getDict_type() {
		return dict_type;
	}
	public void setDict_type(String dict_type) {
		this.dict_type = dict_type;
	}
	public String getDict_item() {
		return dict_item;
	}
	public void setDict_item(String dict_item) {
		this.dict_item = dict_item;
	}
	public String getDict_value() {
		return dict_value;
	}
	public void setDict_value(String dict_value) {
		this.dict_value = dict_value;
	}
	public int getDict_isEdit() {
		return dict_isEdit;
	}
	public void setDict_isEdit(int dict_isEdit) {
		this.dict_isEdit = dict_isEdit;
	}
	
}
