package com.accp.crm.biz;

import java.util.List;

import com.accp.crm.pojo.Storage;

public interface StorageBiz {
	/**
	 * 分页查看，获取总记录数。
	 *
	 */
	public int total(String className,Storage storage);
	
	/**
	 * 分页查看
	 * @param className
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List selectByPage(String className, int pageNo, int pageSize,Storage storage);
	/**
	 * 获取总页数
	 * @param line
	 * @param className
	 * @return
	 */
	public int totalPage(int line, String className,Storage storage);
}
