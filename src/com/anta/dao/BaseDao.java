package com.anta.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class BaseDao {
	@Autowired
	private SessionFactory sessionFactory;
	public Session getSession(){
		//???sessionFactory.getCurrentSession��ȡ����
		return sessionFactory.getCurrentSession();
	}
}
