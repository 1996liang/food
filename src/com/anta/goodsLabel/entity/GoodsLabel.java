package com.anta.goodsLabel.entity;

import java.util.HashSet;
import java.util.Set;

import com.anta.goods.entity.Goods;

public class GoodsLabel {
	private Integer id;
	private String labelName;
	private GoodsLabel superGoodsName;
	private Set<Goods> goods = new HashSet<Goods>();
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLabelName() {
		return labelName;
	}
	public void setLabelName(String labelName) {
		this.labelName = labelName;
	}
	public Set<Goods> getGoods() {
		return goods;
	}
	public void setGoods(Set<Goods> goods) {
		this.goods = goods;
	}
	public GoodsLabel getSuperGoodsName() {
		return superGoodsName;
	}
	public void setSuperGoodsName(GoodsLabel superGoodsName) {
		this.superGoodsName = superGoodsName;
	}
	
	
}
