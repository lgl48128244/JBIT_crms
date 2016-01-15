package com.accp.crm.dao;

import java.util.List;

import com.accp.crm.pojo.Dictionary;

public interface DictionaryDao extends BaseDao{
	/**
	 * 添加新的字典数据
	 * @param dictionary
	 * @return
	 */
	public boolean add(Dictionary dictionary);
	/**
	 * 通过ID获取字典数据
	 * @param id
	 * @return
	 */
	public Dictionary selectById(int id);
	/**
	 * 更新字典数据
	 * @param dictionary
	 * @return
	 */
	public boolean update(Dictionary dictionary);
	/**
	 * 删除字典数据
	 * @param dictionary
	 * @return
	 */
	public boolean delete(Dictionary dictionary);
	/**
	 * 按类型查找字典数据
	 * @param type
	 * @return
	 */
	public List<Dictionary> selectByType(String type);
	/**
	 * 查询所有字典数据类型
	 * @return
	 */
	public List<Dictionary> selectAllType();
}
