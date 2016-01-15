package com.accp.crm.dao.impl;

import java.util.List;

import com.accp.crm.dao.DictionaryDao;
import com.accp.crm.pojo.Dictionary;

public class DictionaryDaoImpl extends BaseDaoImpl implements DictionaryDao {
	/**
	 * 添加新的字典数据
	 */
	@Override
	public boolean add(Dictionary dictionary) {
		boolean flag = false;
		getSession().save(dictionary);
		flag = true;
		return flag;
	}
	/**
	 * 获取某个字典数据
	 */
	@Override
	public Dictionary selectById(int id) {
		List<Dictionary> list = getSession().createQuery("from Dictionary where dict_id = "+id).list();
		return list.get(0);
	}
	/**
	 * 更新字典数据
	 */
	@Override
	public boolean update(Dictionary dictionary) {
		boolean flag = false;
		getSession().update(dictionary);
		flag = true;
		return flag;
	}
	/**
	 * 删除
	 */
	@Override
	public boolean delete(Dictionary dictionary) {
		boolean flag = false;
		getSession().delete(dictionary);
		flag = true;
		return flag;
	}
	/**
	 * 按类型查找
	 */
	@Override
	public List<Dictionary> selectByType(String type) {
		List<Dictionary> list = getSession().createQuery("from Dictionary where dict_type = '"+type+"'").list();
		return list;
	}
	/**
	 * 查询所有字典类型
	 */
	@Override
	public List<Dictionary> selectAllType() {
		List<Dictionary> list = getSession().createQuery("select new Dictionary(dict_type) from Dictionary group by dict_type" ).list();
		return list;
	}

}
