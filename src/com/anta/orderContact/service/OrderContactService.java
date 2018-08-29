package com.anta.orderContact.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anta.orderContact.dao.OrderContactDao;
import com.anta.orderContact.entity.OrderContact;
import com.anta.user.entity.User;

@Service
public class OrderContactService {
	@Autowired
	private OrderContactDao orderContactDao;
	//根据用户获取所有的订单联系方式
	public List<OrderContact> getUserOrderContact(User user){
		return orderContactDao.getUserOrderContact(user);
	}
	//添加订单联系方式
	public void addUserOrderContact(User user,OrderContact orderContact){
		orderContact.setUser(user);
		orderContact.setIsDefault(0);
		orderContactDao.addUserOrderContact(user, orderContact);
	}
	//根据订单联系方式ID获取该数据
	public OrderContact byIdGetOrderContact(OrderContact o){
		return orderContactDao.byIdGetOrderContact(o);
	}
	
	//根据ID更改默认订单联系方式
	public void alterDefault(OrderContact o ,User user){
		orderContactDao.alterDefault(o, user);
	}
	//根据ID修改订单联系方式
	public void alterOrderContact(OrderContact o){
		orderContactDao.alterOrderContact(o);
	}
	//删除订单联系方式
	public void deleteOrderContact(OrderContact o){
		orderContactDao.deleteOrderContact(o);
	}
}
