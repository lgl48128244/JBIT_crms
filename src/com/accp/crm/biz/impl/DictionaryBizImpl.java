package com.accp.crm.biz.impl;

import java.util.List;

import com.accp.crm.biz.DictionaryBiz;
import com.accp.crm.dao.DictionaryDao;
import com.accp.crm.pojo.Dictionary;

public class DictionaryBizImpl implements DictionaryBiz {
	private DictionaryDao dictionaryDao;

	public void setDictionaryDao(DictionaryDao dictionaryDao) {
		this.dictionaryDao = dictionaryDao;
	}
	/**
	 * 获取总记录数
	 */
	@Override
	public int total(String className, Dictionary dictionary) {
		return dictionaryDao.total(className, new String[] {"dict_type","dict_item","dict_value"}, new String[] {dictionary.getDict_type(),dictionary.getDict_item(),dictionary.getDict_value()});
	}
	/**
	 * 分页查询
	 */
	@Override
	public List<Dictionary> selectByPage(String className, int pageNo,
			int pageSize, Dictionary dictionary) {
		return dictionaryDao.selectByPage(className, pageNo, pageSize, new String[] {"dict_type","dict_item","dict_value"}, new String[] {dictionary.getDict_type(),dictionary.getDict_item(),dictionary.getDict_value()});
	}
	/**
	 * 获取总页数
	 */
	@Override
	public int totalPage(int line, String className, Dictionary dictionary) {
		int total = dictionaryDao.total(className,new String[] {"dict_type","dict_item","dict_value"}, new String[] {dictionary.getDict_type(),dictionary.getDict_item(),dictionary.getDict_value()});
		int pageNo = total / line;
		if(total % line > 0){
			pageNo++;
		}
		return pageNo;
	}
	/**
	 * 添加字典数据
	 */
	@Override
	public boolean add(Dictionary dictionary) {
		return dictionaryDao.add(dictionary);
	}
	/**
	 * 获取某个字典数据
	 */
	@Override
	public Dictionary selectById(int id) {
		return dictionaryDao.selectById(id);
	}
	/**
	 * 更新字典数据
	 */
	@Override
	public boolean update(Dictionary dictionary) {
		return dictionaryDao.update(dictionary);
	}
	/**
	 * 删除
	 */
	@Override
	public boolean delete(Dictionary dictionary) {
		return dictionaryDao.delete(dictionary);
	}
	/**
	 * 按类型查找
	 */
	@Override
	public List<Dictionary> selectByType(String type) {
		return dictionaryDao.selectByType(type);
	}
	/**
	 * 查询所有字典数据类型
	 */
	@Override
	public List<Dictionary> selectAllType() {
		return dictionaryDao.selectAllType();
	}
	
}
