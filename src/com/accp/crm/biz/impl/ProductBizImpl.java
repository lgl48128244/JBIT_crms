package com.accp.crm.biz.impl;

import java.util.List;

import com.accp.crm.biz.ProductBiz;
import com.accp.crm.dao.ProductDao;
import com.accp.crm.pojo.Product;

public class ProductBizImpl implements ProductBiz {
	private ProductDao productDao;
	
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	/**
	 * 获取总记录数
	 */
	@Override
	public int total(String className,Product product) {
		return productDao.total(className,new String[] {"name","typeNo","batch"},new String[] {product.getName(),product.getTypeNo(),product.getBatch()});
	}
	/**
	 * 分页查询
	 */
	@Override
	public List selectByPage(String className, int pageNo, int pageSize,Product product) {
		return productDao.selectByPage(className, pageNo, pageSize,new String[] {"name","typeNo","batch"},new String[] {product.getName(),product.getTypeNo(),product.getBatch()});
	}
	/**
	 * 获取总页数
	 */
	@Override
	public int totalPage(int line, String className,Product product) {
		int total = productDao.total(className,new String[] {"name","typeNo","batch"},new String[] {product.getName(),product.getTypeNo(),product.getBatch()});
		int pageNo = total / line;
		if(total % line > 0){
			pageNo++;
		}
		return pageNo;
	}
	/**
	 * 查询所有商品信息
	 */
	@Override
	public List<Product> selectAll() {
		return productDao.selectAll();
	}
	/**
	 * 通过ID 查找商品
	 */
	@Override
	public Product selectById(Integer id) {
		return productDao.selectById(id);
	}

}
