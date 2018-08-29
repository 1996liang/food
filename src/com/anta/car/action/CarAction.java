package com.anta.car.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.anta.car.entity.CarItem;
import com.anta.car.service.CarService;
import com.anta.goods.entity.Goods;
import com.anta.options.entity.GoodsOptions;
import com.anta.user.entity.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component
public class CarAction extends ActionSupport{
	@Autowired
	CarService carService;
	CarItem carItem;
	User user;
	Goods goods;
	Set<GoodsOptions> goodsOptions;
	Integer quantity;
	private InputStream inputStream;
	public String addCart(){
		try{
			carService.addCart(goods, user, goodsOptions, quantity);
			List<CarItem> l = carService.getUserCarItem(user);
			ActionContext.getContext().getSession().put("carItem", l);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "success";
	}
	public String alterCartGoodsQuantity() throws Exception{
		carService.alterCartGoodsQuantity(carItem, quantity);
		inputStream = new ByteArrayInputStream(new String("success").getBytes("utf-8"));
		return "ajaxSuccess";
	}
	public String getCart(){
		List<CarItem> l = carService.getUserCarItem(user);
		ActionContext.getContext().getSession().put("carItem", l);
		return "success";
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public Set<GoodsOptions> getGoodsOptions() {
		return goodsOptions;
	}
	//注意，前台只是传递以,为分隔的一个字符串，该字符串是商品选项的ID值的集合
	public void setGoodsOptions(String goodsOptions) {
		System.out.println(goodsOptions);
		Set<GoodsOptions> s = new HashSet<GoodsOptions>();
		String[] ids = goodsOptions.split(",");
		for(String id:ids){
			s.add(new GoodsOptions(Integer.parseInt(id)));
		}
		this.goodsOptions = s;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public CarItem getCarItem() {
		return carItem;
	}
	public void setCarItem(CarItem carItem) {
		this.carItem = carItem;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
}
