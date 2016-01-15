package com.accp.crm.biz.impl;

import java.util.List;

import com.accp.crm.biz.ServiceBiz;
import com.accp.crm.dao.ServiceDao;
import com.accp.crm.pojo.Service;

public class ServiceBizImpl implements ServiceBiz {
	private ServiceDao serviceDao;
	public void setServiceDao(ServiceDao serviceDao) {
		this.serviceDao = serviceDao;
	}
	/**
	 * 添加服务
	 */
	@Override
	public boolean add(Service service) {
		return serviceDao.add(service);
	}
	/**
	 * 获取总记录数
	 */
	@Override
	public int total(String className, Service service) {
		return serviceDao.total(className, new String[] {"custname","title","type","createdate","status"},
				new String[] {service.getCustname(),service.getTitle(),service.getType(),service.getCreatedate().toString(),service.getStatus()});
	}
	/**
	 * 分页显示
	 */
	@Override
	public List<Service> selectByPage(String className, int pageNo,
			int pageSize, Service service) {
		return serviceDao.selectByPage(className, pageNo, pageSize, new String[] {"custname","title","type","createdate","status"},
				new String[] {service.getCustname(),service.getTitle(),service.getType(),service.getCreatedate().toString(),service.getStatus()});
	}
	/**
	 * 获取总页数
	 */
	@Override
	public int totalPage(int line, String className, Service service) {
		int total = serviceDao.total(className, new String[] {"custname","title","type","createdate","status"},
				new String[] {service.getCustname(),service.getTitle(),service.getType(),service.getCreatedate().toString(),service.getStatus()});
		int pageNo = total / line;
		if(total / line > 0){
			pageNo++;
		}
		return pageNo;
	}
	/**
	 * 更新服务
	 */
	@Override
	public boolean update(Service service) {
		return serviceDao.update(service);
	}
	/**
	 * 删除服务
	 */
	@Override
	public boolean delete(Service service) {
		return serviceDao.delete(service);
	}
	/**
	 * 按ID查找服务
	 */
	@Override
	public Service selectById(Integer sid) {
		return serviceDao.selectById(sid);
	}
	/**
	 * 服务类型统计
	 */
	@Override
	public List selectByType(String type) {
		return serviceDao.selectByType(type);
	}
	
}
