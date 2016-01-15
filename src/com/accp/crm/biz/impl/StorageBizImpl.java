package com.accp.crm.biz.impl;

import java.util.List;

import com.accp.crm.biz.StorageBiz;
import com.accp.crm.dao.StorageDao;
import com.accp.crm.pojo.Storage;

public class StorageBizImpl implements StorageBiz {
	private StorageDao storageDao;

	public void setStorageDao(StorageDao storageDao) {
		this.storageDao = storageDao;
	}
	/**
	 * 获取总记录数
	 */
	@Override
	public int total(String className, Storage storage) {
		return storageDao.total(className, new String[] {"prod_name","ware_house"}, new String[] {storage.getProd_name(),storage.getWare_house()});
	}
	/**
	 * 分页显示
	 */
	@Override
	public List selectByPage(String className, int pageNo, int pageSize,
			Storage storage) {
		return storageDao.selectByPage(className, pageNo, pageSize, new String[] {"prod_name","ware_house"}, new String[] {storage.getProd_name(),storage.getWare_house()});
	}
	/**
	 * 查询总页数
	 */
	@Override
	public int totalPage(int line, String className, Storage storage) {
		int total = storageDao.total(className, new String[] {"prod_name","ware_house"}, new String[] {storage.getProd_name(),storage.getWare_house()});
		int pageNo = total / line;
		if(total % line > 0){
			pageNo++;
		}
		return pageNo;
	}
	
	
}
