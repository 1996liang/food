package com.anta.orderInfo.action;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.anta.order.entity.Orders;
import com.anta.order.service.OrderService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component
public class OrderInfoAction extends ActionSupport{
	private Orders order;
	@Autowired
	private OrderService orderService;
	//获取订单详情信息
	public String getOrderInfo(){
		order = orderService.getOrderInfo(order);
		Map<String,Object> m =(Map<String, Object>) ActionContext.getContext().get("request");
		m.put("order", order);
		return "success";
	}

	
	public Orders getOrder() {
		return order;
	}
	public void setOrder(Orders order) {
		this.order = order;
	}
	
	
	
}
