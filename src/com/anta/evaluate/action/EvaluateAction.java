package com.anta.evaluate.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.anta.evaluate.entity.Evaluate;
import com.anta.evaluate.service.EvaluateService;
import com.anta.order.entity.OrderItem;
import com.anta.order.entity.Orders;
import com.anta.order.service.OrderService;
import com.anta.user.entity.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component
public class EvaluateAction extends ActionSupport{
	@Autowired
	private EvaluateService evaluateService;
	@Autowired
	private OrderService orderService;
	private List<OrderItem> orderItems;
	private List<Evaluate> evaluates;
	private Orders order;
	private InputStream inputStream;
	private User user;
	//评价商品
	public String evaluateGoods(){
		for(int i=0;i<evaluates.size();i++){
			Evaluate e = evaluates.get(i);
			e.setOrderItem(orderItems.get(i));
			evaluateService.saveEvaluate(e);
		}
		inputStream = new ByteArrayInputStream("success".getBytes());
		return "ajaxSuccess";
	}
	//转评价页面
	public String redirectPage(){
		Orders o = orderService.getOrderInfo(order);
		Map<String,Object> m = (Map<String, Object>) ActionContext.getContext().get("request");
		m.put("orders", o);
		return "redirectPage";
	}
	//转成功页面
	public String redirectSuccess(){
		Map<String,Object> m = (Map<String, Object>) ActionContext.getContext().get("request");
		m.put("evaluateSuccess", "success");
		return "redirectSuccess";
	}
	//获取用户的所有评价
	public String getUserEvaluate(){
		List<Evaluate> l = evaluateService.getUserEvaluate(user);
		System.out.println(l.size()+"来咯");
		Map<String,Object> m = (Map<String, Object>) ActionContext.getContext().get("request");
		m.put("evaluates", l);
		return "userEvaluate";
	}
	
	
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<OrderItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(String strOrderItems) {
		String[] strArray = strOrderItems.split("/");
		List<OrderItem> orderItems = new ArrayList<OrderItem>();
		for(int i=0;i<strArray.length;i++){
			orderItems.add(new OrderItem(Integer.parseInt(strArray[i])));
		}
		this.orderItems = orderItems;
	}
	public Orders getOrder() {
		return order;
	}
	public void setOrder(Orders order) {
		System.out.println(order);
		this.order = order;
	}
	public List<Evaluate> getEvaluates() {
		return evaluates;
	}
	public void setEvaluates(String jsonEvaluates) {
		String[] strArray = jsonEvaluates.split("/");
		List<Evaluate> evaluates = new ArrayList<Evaluate>();
		for(String str:strArray){
			evaluates.add(JSON.parseObject(str, Evaluate.class));
		}
		this.evaluates = evaluates;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
}
