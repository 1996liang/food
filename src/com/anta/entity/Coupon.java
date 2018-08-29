package com.anta.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.anta.goods.entity.Goods;

public class Coupon {
	private Integer id;
	private Set<Goods> goods = new HashSet<Goods>();
	private Integer isAllMall;
	private Integer quantity;
	private Integer sum;
	private Date endTime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public Set<Goods> getGoods() {
		return goods;
	}
	public void setGoods(Set<Goods> goods) {
		this.goods = goods;
	}
	public Integer getIsAllMall() {
		return isAllMall;
	}
	public void setIsAllMall(Integer isAllMall) {
		this.isAllMall = isAllMall;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getSum() {
		return sum;
	}
	public void setSum(Integer sum) {
		this.sum = sum;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
}
