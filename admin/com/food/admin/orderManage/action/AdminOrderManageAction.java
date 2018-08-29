package com.food.admin.orderManage.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.anta.order.entity.Orders;
import com.anta.order.service.OrderService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component
public class AdminOrderManageAction extends ActionSupport{
	//用于分页
	private Integer page=1;
	private Integer maxResult=10;
	private Integer id;
	@Autowired
	OrderService orderService;
	private InputStream inputStream;
	public String getAllOrder(){
		List<Orders> l =orderService.getAllOrder(page, maxResult);
		Integer count = orderService.getOrderCount();
		Map<String, Object> m = (Map<String, Object>) ActionContext
				.getContext().get("request");
		m.put("orderList", l);
		m.put("page", page);
		m.put("maxResult", maxResult);
		m.put("count", count);
		return "allOrderList";
	}
	public String getUnfilledOrders(){
		List<Orders> l =orderService.getUnfilledOrders(page, maxResult);
		Integer count = orderService.getUnfilledOrdersCount();
		Map<String, Object> m = (Map<String, Object>) ActionContext
				.getContext().get("request");
		System.out.println(l+"未完成");
		m.put("orderList", l);
		m.put("page", page);
		m.put("maxResult", maxResult);
		m.put("count", count);
		return "getUnfilledOrders";
	}
	public String alterfilledOrder() throws Exception{
		orderService.alterfilledOrder(id);
		inputStream = new ByteArrayInputStream(JSON.toJSONString("success").getBytes("utf-8"));
		return "ajaxSuccess";
	}
	public String allByIdGetOrderInfo(){
		Orders o = new Orders();
		o.setId(id);
		o =orderService.getOrderInfo(o);
		Integer count;
		if(o==null){
			count=0;
		}else{
			count=1;
		}
		Map<String, Object> m = (Map<String, Object>) ActionContext
				.getContext().get("request");
		m.put("orderList", o);
		
		m.put("count", count);
		return "allOrderList";
	}
	public String unByIdGetOrderInfo(){
		Orders o = new Orders();
		o.setId(id);
		o =orderService.getOrderInfo(o);
		Map<String, Object> m = (Map<String, Object>) ActionContext
				.getContext().get("request");
		Integer count;
		if(o==null){
			count=0;
		}else{
			count=1;
		}
		m.put("orderList", o);
		m.put("count", count);
		return "getUnfilledOrders";
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getMaxResult() {
		return maxResult;
	}
	public void setMaxResult(Integer maxResult) {
		this.maxResult = maxResult;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
}
