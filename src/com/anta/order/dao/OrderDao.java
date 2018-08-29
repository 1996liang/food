package com.anta.order.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.anta.dao.BaseDao;
import com.anta.goods.entity.Goods;
import com.anta.order.entity.OrderItem;
import com.anta.order.entity.Orders;
import com.anta.user.entity.User;

@Repository
public class OrderDao extends BaseDao{

	public void createOrder(Orders order){
		for(OrderItem orderItem :order.getOrderItems()){
			getSession().save(orderItem);
		}
		getSession().save(order);
	}
	
	//获取用户的所有订单
	public List<Orders> getUserAllOrder(User u){
		String hql = "FROM Orders as o WHERE o.user=:user";
		return getSession().createQuery(hql).setEntity("user", u).list();
	}
	//根据订单ID获取订单信息
	public Orders getOrderInfo(Orders o){
		return (Orders) getSession().get(Orders.class, o.getId());
	}
	//获取所有订单
	public List<Orders> getAllOrder(Integer firstResult,Integer maxResult){
		String hql = "FROM Orders as o Order By o.orderTime DESC";
		return getSession().createQuery(hql).setMaxResults(maxResult).setFirstResult(firstResult).list();
	}
	//获取所有未发货的订单
	public List<Orders> getUnfilledOrders(Integer firstResult,Integer maxResult){
		String hql = "FROM Orders as o WHERE o.status=1 Order By o.orderTime DESC";
		return getSession().createQuery(hql).setMaxResults(maxResult).setFirstResult(firstResult).list();
	}
	//获取所有订单的总个数
	public Integer getOrderCount(){
		String hql = "SELECT count(id) FROM Orders as o";
		int count = ((Number) getSession().createQuery(hql).uniqueResult()).intValue();
		return count;
	}
	//获取所有未发货的订单总个数
	public Integer getUnfilledOrdersCount(){
		String hql = "SELECT count(id) FROM Orders as o WHERE o.status=1";
		int count = ((Number) getSession().createQuery(hql).uniqueResult()).intValue();
		return count;
	}
	//更改为已发货
	public void alterfilledOrder(Integer id){
		Orders o = (Orders) getSession().get(Orders.class, id);
		o.setStatus(2);
	}
}
