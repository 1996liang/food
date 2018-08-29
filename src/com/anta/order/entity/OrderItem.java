package com.anta.order.entity;

import java.util.HashSet;
import java.util.Set;

import com.anta.evaluate.entity.Evaluate;
import com.anta.goods.entity.Goods;
import com.anta.options.entity.GoodsOptions;
public class OrderItem {
	private Integer id;
	private Goods goods;
	private Orders order;
	private Integer quantity;
	private Float subtotal;
	private Evaluate evaluate;
	//商品选项
	private Set<GoodsOptions> goodsOptions = new HashSet<GoodsOptions>();
	
	public Set<GoodsOptions> getGoodsOptions() {
		return goodsOptions;
	}
	public void setGoodsOptions(Set<GoodsOptions> goodsOptions) {
		this.goodsOptions = goodsOptions;
	}
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
		System.out.println("5555555555555555");
		this.goods = goods;
	}
	public Orders getOrder() {
		return order;
	}
	public void setOrder(Orders order) {
		this.order = order;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Float getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(Float subtotal) {
		this.subtotal = subtotal;
	}
	public Evaluate getEvaluate() {
		return evaluate;
	}
	public void setEvaluate(Evaluate evaluate) {
		this.evaluate = evaluate;
	}
	public OrderItem(Integer id) {
		super();
		this.id = id;
	}
	public OrderItem() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
