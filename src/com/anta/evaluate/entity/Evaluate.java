package com.anta.evaluate.entity;

import java.util.Date;

import com.anta.order.entity.OrderItem;

public class Evaluate {
	private Integer id;
	private String content;
	//1好评 2中评 3差评
	private Integer star;
	//时间
	private Date time;
	private OrderItem orderItem;
	private String Images;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getStar() {
		return star;
	}
	public void setStar(Integer star) {
		this.star = star;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public OrderItem getOrderItem() {
		return orderItem;
	}
	public void setOrderItem(OrderItem orderItem) {
		this.orderItem = orderItem;
	}
	public String getImages() {
		return Images;
	}
	public void setImages(String images) {
		Images = images;
	}
	
}
