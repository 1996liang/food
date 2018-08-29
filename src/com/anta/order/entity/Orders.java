package com.anta.order.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.anta.entity.Coupon;
import com.anta.entity.FastMail;
import com.anta.goods.entity.Goods;
import com.anta.orderContact.entity.OrderContact;
import com.anta.user.entity.User;
//status,0订单已生成，未结账，1订单已生成，已结账 2订单已生成，商家已发货 3.用户已收货，用户未评价4.订单已生成，订单已结束5.订单失败（中途退款）
public class Orders {
	private Integer id;
	private Date orderTime;
	private Double money;
	private Integer status;
	private OrderContact orderContact;
	private String words;
	private String fastMailCode;
	private FastMail fastMailBrand;
	private Coupon coupon;
	private User user;
	private String payCode;
	private Set<OrderItem> orderItems = new HashSet<OrderItem>();
	
	public FastMail getFastMailBrand() {
		return fastMailBrand;
	}
	public void setFastMailBrand(FastMail fastMailBrand) {
		this.fastMailBrand = fastMailBrand;
	}
	public Set<OrderItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
	public String getPayCode() {
		return payCode;
	}
	public void setPayCode(String payCode) {
		this.payCode = payCode;
	}
	public Coupon getCoupon() {
		return coupon;
	}
	public void setCoupon(Coupon coupon) {
		this.coupon = coupon;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getWords() {
		return words;
	}
	public void setWords(String words) {
		this.words = words;
	}
	public String getFastMailCode() {
		return fastMailCode;
	}
	public void setFastMailCode(String fastMailCode) {
		this.fastMailCode = fastMailCode;
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
	
}
