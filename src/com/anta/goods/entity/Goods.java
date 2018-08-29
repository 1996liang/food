package com.anta.goods.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.anta.classify.entity.ThreeClassify;
import com.anta.classify.entity.TwoClassify;
import com.anta.goodsLabel.entity.GoodsLabel;
import com.anta.options.entity.GoodsOptions;
//1为上架0为下架
public class Goods {
	private Integer id;
	private String goodsName;
	private double latelyPrice;
	private double originalPrice;
	private String goodsDescribe;
	private String images;
	private Long surplus;
	private Long salesVolume;
	private Date groundingTime;
	private ThreeClassify threeClassify;
	private Integer status;
	//商品标签
	private Set<GoodsLabel> goodsLabels = new HashSet<GoodsLabel>();
	//商品选项
	private Set<GoodsOptions> goodsOptions = new HashSet<GoodsOptions>();
	//获取商品图面数组
	public String[] getImagesArray(){
		System.out.println(images);
		String[] s = images.split("`");
		System.out.println(s[0]);
		System.out.println(s.length);
		return s;
	}
	//获取商品描述图片数组
	public String[] getDescribeImageArray(){
		System.out.println(goodsDescribe);
		String[] s = goodsDescribe.split("`");
		System.out.println(s[0]);
		System.out.println(s.length);
		return s;
	}
	public Long getSurplus() {
		return surplus;
	}
	public void setSurplus(Long surplus) {
		this.surplus = surplus;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public double getLatelyPrice() {
		return latelyPrice;
	}
	public void setLatelyPrice(double latelyPrice) {
		this.latelyPrice = latelyPrice;
	}
	public double getOriginalPrice() {
		return originalPrice;
	}
	public void setOriginalPrice(double originalPrice) {
		this.originalPrice = originalPrice;
	}
	public String getGoodsDescribe() {
		return goodsDescribe;
	}
	public void setGoodsDescribe(String goodsDescribe) {
		this.goodsDescribe = goodsDescribe;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public Long getSalesVolume() {
		return salesVolume;
	}
	public void setSalesVolume(Long salesVolume) {
		this.salesVolume = salesVolume;
	}
	public Date getGroundingTime() {
		return groundingTime;
	}
	public void setGroundingTime(Date groundingTime) {
		this.groundingTime = groundingTime;
	}
	public ThreeClassify getThreeClassify() {
		return threeClassify;
	}
	public void setThreeClassify(ThreeClassify threeClassify) {
		this.threeClassify = threeClassify;
	}
	public Set<GoodsLabel> getGoodsLabels() {
		return goodsLabels;
	}
	public void setGoodsLabels(Set<GoodsLabel> goodsLabels) {
		this.goodsLabels = goodsLabels;
	}
	public Set<GoodsOptions> getGoodsOptions() {
		return goodsOptions;
	}
	public void setGoodsOptions(Set<GoodsOptions> goodsOptions) {
		this.goodsOptions = goodsOptions;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Goods(Integer id) {
		super();
		this.id = id;
	}
	public Goods() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
