package com.accp.crm.dao.impl;

import java.util.List;

import com.accp.crm.dao.LinkmanDao;
import com.accp.crm.pojo.Linkman;

public class LinkmanDaoImpl extends BaseDaoImpl implements LinkmanDao {
	/**
	 * 查询某客户所有联系人
	 */
	@Override
	public List<Linkman> selectByCustno(String custno) {
		List<Linkman> list = getSession().createQuery("from Linkman where custno = '"+custno+"' order by id").list();
		return list;
	}
	/**
	 * 添加联系人
	 */
	@Override
	public boolean add(Linkman linkman) {
		boolean flag = false;
		getSession().save(linkman);
		flag = true;
		return flag;
	}
	/**
	 * 删除联系人
	 */
	@Override
	public boolean delete(Linkman linkman) {
		boolean flag = false;
		getSession().delete(linkman);
		flag = true;
		return flag;
	}
	/**
	 * 更新联系人
	 */
	@Override
	public boolean update(Linkman linkman) {
		boolean flag = false;
		getSession().update(linkman);
		flag = true;
		return flag;
	}
	/**
	 * 通过ID查找联系人
	 */
	@Override
	public Linkman selectById(Integer id) {
		List<Linkman> list = getSession().createQuery("from Linkman where id = "+id).list();
		return list.get(0);
	}
	

}
