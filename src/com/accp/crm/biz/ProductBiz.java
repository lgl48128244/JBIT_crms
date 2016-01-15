package com.accp.crm.biz;

import java.util.List;

import com.accp.crm.pojo.Product;

public interface ProductBiz {
	/**
	 * 分页查看，获取总记录数。
	 *
	 */
	public int total(String className,Product product);
	
	/**
	 * 分页查看
	 * @param className
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List selectByPage(String className, int pageNo, int pageSize,Product product);
	/**
	 * 获取总页数
	 * @param line
	 * @param className
	 * @return
	 */
	public int totalPage(int line, String className,Product product);
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
