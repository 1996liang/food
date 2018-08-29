package com.anta.person.addressManage.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.anta.orderContact.entity.OrderContact;
import com.anta.orderContact.service.OrderContactService;
import com.anta.user.entity.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

@Component
public class AddressManageAction extends ActionSupport{
	private User user;
	private OrderContact orderContact;
	@Autowired
	private OrderContactService orderContactService;
	private InputStream inputStream;
	
	public String getUserOrderContact(){
		List<OrderContact> l =orderContactService.getUserOrderContact(user);
		ValueStack v = ActionContext.getContext().getValueStack();
		Map<String,Object> m =(Map<String, Object>) ActionContext.getContext().get("request");
		m.put("orderContact", l);
		v.set("orderContacts", l);
		return "success";
	}

	public String alterDefault(){
		orderContactService.alterDefault(orderContact, user);
		inputStream = new ByteArrayInputStream("success".getBytes());
		return "ajaxSuccess";
	}
	
	//删除订单联系方式
	public String deleteOrderContact() throws Exception{
		orderContactService.deleteOrderContact(orderContact);
		inputStream = new ByteArrayInputStream("success".getBytes("utf-8"));
		return "ajaxSuccess";
	}
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public OrderContact getOrderContact() {
		return orderContact;
	}

	public void setOrderContact(OrderContact orderContact) {
		this.orderContact = orderContact;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
}
