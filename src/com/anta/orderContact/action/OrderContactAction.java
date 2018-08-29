package com.anta.orderContact.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.anta.orderContact.entity.OrderContact;
import com.anta.orderContact.service.OrderContactService;
import com.anta.user.entity.User;
import com.opensymphony.xwork2.ActionSupport;

@Component
public class OrderContactAction extends ActionSupport{
	
	@Autowired
	OrderContactService orderContactService;
	OrderContact orderContact;
	User user;
	InputStream inputStream;
	//通过ajax添加订单联系方式或者修改更新订单联系方式
	public String ajaxAddOrderContact() throws Exception{
		//如果订单有id，那么该订单应该更新
		if(orderContact.getId()==null){
			System.out.println("添加");
			orderContactService.addUserOrderContact(user, orderContact);
			orderContact=null;
		}else{
			System.out.println(orderContact.getId());
			System.out.println("更新");
			orderContactService.alterOrderContact(orderContact);
			orderContact=null;
		}
		inputStream = new ByteArrayInputStream("success".getBytes("utf-8"));
		return "ajaxSuccess";
	}
	public OrderContact getOrderContact() {
		return orderContact;
	}
	public void setOrderContact(OrderContact orderContact) {
		this.orderContact = orderContact;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
}
