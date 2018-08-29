package com.anta.orderContact.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.anta.dao.BaseDao;
import com.anta.orderContact.entity.OrderContact;
import com.anta.user.entity.User;

@Repository
public class OrderContactDao extends BaseDao{
	//根据用户获取所有的订单联系方式
	public List<OrderContact> getUserOrderContact(User user){
		String hql = "FROM OrderContact as oc WHERE oc.user=:user";
		return getSession().createQuery(hql).setEntity("user", user).list();
	}
	//添加订单联系方式
	public void addUserOrderContact(User user,OrderContact orderContact){
		getSession().save(orderContact);
	}
	//根据订单联系方式ID获取该数据
	public OrderContact byIdGetOrderContact(OrderContact o){
		return (OrderContact) getSession().get(OrderContact.class, o.getId());
	}
	//根据ID更改默认订单联系方式
	public void alterDefault(OrderContact o,User user){
		//首先取消原本的默认订单联系方式
		String hql = "FROM OrderContact as o WHERE o.user=:user AND o.isDefault=1";
		OrderContact oldDefaultAddress = (OrderContact) getSession().createQuery(hql).setEntity("user",user).uniqueResult();
		oldDefaultAddress.setIsDefault(0);
		//然后根据id设新的默认订单联系方式
		OrderContact newDefaultAddress = (OrderContact) getSession().get(OrderContact.class, o.getId());
		newDefaultAddress.setIsDefault(1);
	}
	//根据ID修改订单联系方式
	public void alterOrderContact(OrderContact o){
		OrderContact dataOrderContact = (OrderContact) getSession().get(OrderContact.class, o.getId());
		dataOrderContact.setPhone(o.getPhone());
		dataOrderContact.setAddress(o.getAddress());
		dataOrderContact.setConsigneeName(o.getConsigneeName());
	}
	//删除订单联系方式
	public void deleteOrderContact(OrderContact o){
		getSession().delete(o);
	}
}
