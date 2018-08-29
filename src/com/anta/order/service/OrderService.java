package com.anta.order.service;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anta.goods.dao.GoodsDao;
import com.anta.goods.entity.Goods;
import com.anta.order.dao.OrderDao;
import com.anta.order.entity.OrderItem;
import com.anta.order.entity.Orders;
import com.anta.user.entity.User;

@Service
public class OrderService {
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private GoodsDao goodsDao;
	//创建订单
	public Orders createOrder(Set<OrderItem> s,Orders o){
		Double total = 0d;
		 DecimalFormat df = new DecimalFormat("#.00");
		for(OrderItem oi:s){
			//小计
			Goods dataGoods = goodsDao.getGoodsmsg(oi.getGoods());
			Float subtotal = (float) (dataGoods.getLatelyPrice()*oi.getQuantity());
			oi.setSubtotal(subtotal);
			//总计
			total+=subtotal;
		}
		total = (double)(Math.round(total*100)/100);
		o.setMoney(total);
		o.setStatus(1);
		o.setOrderItems(s);
		o.setOrderTime(new Date());
		orderDao.createOrder(o);
		return o;
	}
	//获取用户的所有订单
	public List<Orders> getUserAllOrder(User u){
		List<Orders> o = orderDao.getUserAllOrder(u);
		for(int i=0;i<o.size();i++){
			Double d = o.get(i).getMoney();
			String str = String.valueOf(d);
			o.get(i).setMoney(Double.parseDouble(str));
		}
		return o;
	}
	
	//根据订单ID获取订单信息
	public Orders getOrderInfo(Orders o){
		return orderDao.getOrderInfo(o);
	}
	//获取所有订单
	public List<Orders> getAllOrder(Integer page,Integer maxResult){
		Integer firstResult ;
		if(page==1||page<=0){
			firstResult = new Integer(1);
		}else{
			firstResult = new Integer((page-1)*maxResult+1);
		}
		System.out.println(firstResult);
		return orderDao.getAllOrder(firstResult, maxResult);
	}
	//获取所有未发货的订单
	public List<Orders> getUnfilledOrders(Integer page,Integer maxResult){
		Integer firstResult ;
		if(page==1||page<=0){
			firstResult = new Integer(1);
		}else{
			firstResult = new Integer((page-1)*maxResult+1);
		}
		System.out.println(firstResult);
		return orderDao.getUnfilledOrders(firstResult, maxResult);
	}
	//获取所有订单的总个数
	public Integer getOrderCount(){
		return orderDao.getOrderCount();
	}
	//获取所有未发货订单的总个数
	public Integer getUnfilledOrdersCount(){
		return orderDao.getUnfilledOrdersCount();
	}
	//更改为已发货
	public void alterfilledOrder(Integer id){
		orderDao.alterfilledOrder(id);
	}
}
