package com.accp.crm.biz;

import java.util.List;
import com.accp.crm.pojo.Service;

public interface ServiceBiz {
	/**
	 * 添加服务
	 * @param service
	 * @return
	 */
	public boolean add(Service service);
	/**
	 * 获取总记录
	 * @param className
	 * @param service
	 * @return
	 */
	public int total(String className,Service service);
	
	/**
	 * 分页查看
	 * @param className
	 * @param pageNo
	 * @param pageSize
	 * @param service
	 * @return
	 */
	public List<Service> selectByPage(String className, int pageNo, int pageSize,Service service);
	/**
	 * 获取总页数
	 * @param line
	 * @param className
	 * @param service
	 * @return
	 */
	public int totalPage(int line, String className,Service service);
	/**
	 * 更新服务
	 * @param service
	 * @return
	 */
	public boolean update(Service service);
	/**
	 * 删除服务
	 * @param service
	 * @return
	 */
	public boolean delete(Service service);
	/**
	 * 按ID查找服务
	 * @param sid
	 * @return
	 */
	public Service selectById(Integer sid);
	/**
	 * 统计服务类别
	 * @param type
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List selectByType(String type);
}
