package com.anta.entity;

import com.anta.goods.entity.Goods;

public class ActivityGoods {
	private Integer id;
	private Goods goods;
	private String ActivityKeyWords;
	private Integer isRecommend;
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
	public String getActivityKeyWords() {
		return ActivityKeyWords;
	}
	public void setActivityKeyWords(String activityKeyWords) {
		ActivityKeyWords = activityKeyWords;
	}
	public Integer getIsRecommend() {
		return isRecommend;
	}
	public void setIsRecommend(Integer isRecommend) {
		this.isRecommend = isRecommend;
	}
	
}
