package com.accp.crm.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.hibernate.HibernateException;

import com.accp.crm.biz.DictionaryBiz;
import com.accp.crm.pojo.Dictionary;
import com.opensymphony.xwork2.ModelDriven;

public class DictionaryAction implements ModelDriven<Dictionary>, RequestAware {
	private DictionaryBiz dictionaryBiz;
	
	
	public void setDictionaryBiz(DictionaryBiz dictionaryBiz) {
		this.dictionaryBiz = dictionaryBiz;
	}
	private Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	private Dictionary dictionary = new Dictionary();
	@Override
	public Dictionary getModel() {
		return dictionary;
	}
	private int next;
	
	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}

	/**
	 * 分页查询第一页
	 */
	public String firstPage(){
		try{
			int total = dictionaryBiz.total("Dictionary",dictionary);
			int totalPage = dictionaryBiz.totalPage(5, "Dictionary",dictionary);
			List<Dictionary> list = dictionaryBiz.selectByPage("Dictionary", 1, 5,dictionary);
			request.put("total", total);
			request.put("list", list);
			request.put("totalPage", totalPage);
			request.put("currentPage", 1);
			if(list.size() == 0){
				request.put("mess", "查无记录");
			}
			return "firstPage";
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 分页查询下一页
	 */
	public String nextPage(){
		int next = (Integer) request.get("next");
		try{
			int total = dictionaryBiz.total("Dictionary",dictionary);
			int totalPage = dictionaryBiz.totalPage(5, "Dictionary",dictionary);
			List<Dictionary> list = dictionaryBiz.selectByPage("Dictionary", next, 5,dictionary);
			request.put("total", total);
			request.put("list", list);
			request.put("totalPage", totalPage);
			request.put("currentPage", next);
			return "nextPage";
		}catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 去添加页
	 * @return
	 */
	public String toAdd(){
		try{
			List<Dictionary> list = dictionaryBiz.selectAllType();
			request.put("list", list);
			request.put("dict", dictionary);
			return "toAdd";
		}catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 添加新的字典数据
	 * @return
	 */
	public String add(){
		try{
			dictionary.setDict_isEdit(dictisEdit?1:0);
			dictionaryBiz.add(dictionary);
			return "add";
		}catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 去编辑页
	 * @return
	 */
	public String toedit(){
		int id = (Integer) request.get("dict_id");
		try{
			Dictionary dictionary = dictionaryBiz.selectById(id);
			List<Dictionary> list = dictionaryBiz.selectAllType();
			request.put("list", list);
			request.put("dict", dictionary);
			return "toedit";
		}catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 更新字典数据
	 * @return
	 */
	public String update(){
		try{
			dictionary.setDict_isEdit(dictisEdit?1:0);//通过真假判断1或0
			dictionaryBiz.update(dictionary);
			return "update";
		}catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}
	/**
	 * 删除
	 * @return
	 */
	public String delete(){
		try{
			dictionaryBiz.delete(dictionary);
			return "delete";
		}catch (HibernateException e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	private boolean dictisEdit;


	public boolean isDictisEdit() {
		return dictisEdit;
	}

	public void setDictisEdit(boolean dictisEdit) {
		this.dictisEdit = dictisEdit;
	}
	
}
