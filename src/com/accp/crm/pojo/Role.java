package com.accp.crm.pojo;

public class Role {
	private String id = "";
	private String roleName = "";
	private String roleDesc;
	
	public Role() {
		super();
	}

	public Role(String id, String roleName, String roleDesc) {
		super();
		this.id = id;
		this.roleName = roleName;
		this.roleDesc = roleDesc;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDesc() {
		return roleDesc;
	}

	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}
	
	
}
