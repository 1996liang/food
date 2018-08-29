package com.anta.pay.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.anta.car.entity.CarItem;
import com.anta.car.service.CarService;
import com.anta.order.entity.OrderItem;
import com.anta.order.entity.Orders;
import com.anta.order.service.OrderService;
import com.anta.orderContact.entity.OrderContact;
import com.anta.orderContact.service.OrderContactService;
import com.anta.user.entity.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
@Component
public class PayAction extends ActionSupport{
	private Set<CarItem> carItems;
	private User user;
	@Autowired
	private CarService carService;
	@Autowired
	private OrderContactService orderContactService;
	@Autowired
	private OrderService orderService;
	private Set<OrderItem> orderItems;
	private Orders order;
	private InputStream inputStream;
	//结算页面
	public String payPage(){
		List<CarItem> dataCarItems = new ArrayList<CarItem>();
		for(CarItem c :carItems){
			c= carService.byIdGetCarItem(c);
			dataCarItems.add(c);
		}
		List<OrderContact> orderContacts = orderContactService.getUserOrderContact(user);
		ActionContext.getContext().getSession().put("orderCarItem", dataCarItems);
		ActionContext.getContext().getSession().put("orderContacts", orderContacts);
		return "success";
	}
	
	public String createOrder() throws Exception{
		order = orderService.createOrder(orderItems, order);
		OrderContact o = orderContactService.byIdGetOrderContact(order.getOrderContact());
		ActionContext.getContext().getSession().put("paySuccessOrderContact", o);
		ActionContext.getContext().getSession().put("paySuccessTotal", order.getMoney());
		String msg = "createSuccess";
		inputStream = new ByteArrayInputStream(msg.getBytes());
		return "ajaxSuccess";
	}
	
	public String redirectSuccessPage(){
		return "redirectSuccessPage";
	}
	public Set<OrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(String JSONStr) {
		String[] strArray = JSONStr.split("/");
		Set<OrderItem> orderItems = new HashSet<OrderItem>();
		for(String str:strArray){
			orderItems.add(JSON.parseObject(str, OrderItem.class));
		}
		this.orderItems = orderItems;
	}

	public Orders getOrder() {
		return order;
	}

	public void setOrder(Orders order) {
		this.order = order;
	}

	public Set<CarItem> getCarItems() {
		return carItems;
	}
	public void setCarItems(String carItemIds) {
		Set<CarItem> carItems = new HashSet<CarItem>();
		String[] ids = carItemIds.split(",");
		for(String id:ids){
			carItems.add(new CarItem(Integer.parseInt(id)));
		}
		this.carItems = carItems;
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
