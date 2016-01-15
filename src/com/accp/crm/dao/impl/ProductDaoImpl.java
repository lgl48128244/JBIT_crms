package com.accp.crm.dao.impl;

import java.util.List;

import com.accp.crm.dao.ProductDao;
import com.accp.crm.pojo.Product;

public class ProductDaoImpl extends BaseDaoImpl implements ProductDao {
	/**
	 * 查询所有商品信息
	 */
	@Override
	public List<Product> selectAll() {
		List<Product> list = getSession().createQuery("from Product").list();
		return list;
	}
	/**
	 * 通过ID查询产品
	 */
	@Override
	public Product selectById(Integer id) {
		List<Product> list = getSession().createQuery("from Product where id = "+id).list();
		return list.get(0);
	}

}
