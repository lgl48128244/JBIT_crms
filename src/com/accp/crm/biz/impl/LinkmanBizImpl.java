package com.accp.crm.biz.impl;

import java.util.List;

import com.accp.crm.biz.LinkmanBiz;
import com.accp.crm.dao.LinkmanDao;
import com.accp.crm.pojo.Linkman;

public class LinkmanBizImpl implements LinkmanBiz {
	private LinkmanDao linkmanDao;

	public void setLinkmanDao(LinkmanDao linkmanDao) {
		this.linkmanDao = linkmanDao;
	}
	/**
	 * 查询某客户所有联系人
	 */
	@Override
	public List<Linkman> selectByCustno(String custno) {
		return linkmanDao.selectByCustno(custno);
	}
	/**
	 * 添加联系人
	 */
	@Override
	public boolean add(Linkman linkman) {
		return linkmanDao.add(linkman);
	}
	/**
	 * 删除联系人
	 */
	@Override
	public boolean delete(Linkman linkman) {
		return linkmanDao.delete(linkman);
	}
	/**
	 * 更新联系人
	 */
	@Override
	public boolean update(Linkman linkman) {
		return linkmanDao.update(linkman);
	}
	/**
	 * 通过ID查找联系人
	 */
	@Override
	public Linkman selectById(Integer id) {
		return linkmanDao.selectById(id);
	}
	
}
