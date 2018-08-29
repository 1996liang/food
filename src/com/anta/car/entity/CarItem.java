package com.anta.car.entity;

import java.util.HashSet;
import java.util.Set;

import com.anta.goods.entity.Goods;
import com.anta.options.entity.GoodsOptions;
import com.anta.user.entity.User;

public class CarItem {
	private Integer id;
	private Goods goods;
	private Integer quantity;
	private User user;
	private Set<GoodsOptions> goodsOptions = new HashSet<GoodsOptions>();
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<GoodsOptions> getGoodsOptions() {
		return goodsOptions;
	}
	public void setGoodsOptions(Set<GoodsOptions> goodsOptions) {
		this.goodsOptions = goodsOptions;
	}
	public CarItem() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CarItem(Goods goods, Integer quantity, User user,
			Set<GoodsOptions> goodsOptions) {
		super();
		this.goods = goods;
		this.quantity = quantity;
		this.user = user;
		this.goodsOptions = goodsOptions;
	}
	public CarItem(Integer id) {
		super();
		this.id = id;
	}
	
}
