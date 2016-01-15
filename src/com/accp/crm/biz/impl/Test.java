package com.accp.crm.biz.impl;

import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.accp.crm.biz.CustInfoBiz;

public class Test {

	/**
	 * @param args
	 */
	@SuppressWarnings("rawtypes")
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ClassPathXmlApplicationContext beans = new ClassPathXmlApplicationContext("applicationContext.xml");
		CustInfoBiz cbiz = (CustInfoBiz) beans.getBean("CustInfoBizImpl");
		List  list = cbiz.reptByType("levelLabel");
		for(int i=0;i<list.size();i++){	
		System.out.println(((Object[])list.get(i))[1]);
		}
	}

}
