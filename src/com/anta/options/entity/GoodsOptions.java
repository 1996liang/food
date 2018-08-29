package com.anta.options.entity;

import com.anta.goods.entity.Goods;

public class GoodsOptions {
	private Integer id;
	private Goods goods; 
	private String name;
	private GoodsOptions goodsOptions;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public GoodsOptions getGoodsOptions() {
		return goodsOptions;
	}
	public void setGoodsOptions(GoodsOptions goodsOptions) {
		this.goodsOptions = goodsOptions;
	}
	public GoodsOptions(Integer id) {
		super();
		this.id = id;
	}
	public GoodsOptions() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
