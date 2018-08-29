package com.anta.orderManage.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.anta.order.entity.Orders;
import com.anta.order.service.OrderService;
import com.anta.user.entity.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component
public class OrderManageAction extends ActionSupport{
	private User user;
	@Autowired
	OrderService orderService;
	public String getUserAllOrder(){
		List<Orders> o =orderService.getUserAllOrder(user);
		Map<String,Object> m = (Map<String, Object>) ActionContext.getContext().get("request");
		m.put("allOrders", o);
		return "success";
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
