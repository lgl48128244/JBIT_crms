package com.accp.crm.dao;

import java.util.List;

import com.accp.crm.pojo.Product;

public interface ProductDao extends BaseDao{
	/**
	 * 查询所有产品信息
	 * @return
	 */
	public List<Product> selectAll();
	/**
	 * 通过id查询产品
	 * @param id
	 * @return
	 */
	public Product selectById(Integer id);
}
