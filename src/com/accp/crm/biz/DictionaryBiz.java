package com.accp.crm.biz;

import java.util.List;

import com.accp.crm.pojo.Dictionary;

public interface DictionaryBiz {
	/**
	 * 分页查看，获取总记录数。
	 *
	 */
	public int total(String className,Dictionary dictionary);
	
	/**
	 * 分页查看
	 * @param className
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public List<Dictionary> selectByPage(String className, int pageNo, int pageSize,Dictionary dictionary);
	/**
	 * 获取总页数
	 * @param line
	 * @param className
	 * @return
	 */
	public int totalPage(int line, String className,Dictionary dictionary);
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
