package com.anta.car.service;

import java.math.BigInteger;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anta.car.dao.CarDao;
import com.anta.car.entity.CarItem;
import com.anta.goods.entity.Goods;
import com.anta.options.entity.GoodsOptions;
import com.anta.user.entity.User;

@Service
public class CarService {
	
	@Autowired
	private CarDao carDao ;
	public void addCart(Goods goods,User user,Set<GoodsOptions> goodsOptions,Integer quantity){
		Integer dataQuantity = carDao.carSameGoodsQuantity(goods,user,goodsOptions);
		if(dataQuantity==0){
			carDao.addCart(goods,user,goodsOptions,quantity);
		}else{
			CarItem dataCarItem = carDao.getCartItem(goods, user, goodsOptions);
			quantity = dataCarItem.getQuantity()+quantity;
			carDao.alterCartGoodsQuantity(dataCarItem, quantity);
		}
	}
	//获取用户购物车
	public List<CarItem> getUserCarItem(User user){
		return carDao.getUserCarItem(user);
	}
	//修改购物车中商品的个数
	public void alterCartGoodsQuantity(CarItem carItem,Integer quantity){
		carDao.alterCartGoodsQuantity(carItem, quantity);
	}
	//根据购物车项的ID获取购物车项的全部资料
	public CarItem byIdGetCarItem(CarItem carItem){
		return carDao.byIdGetCarItem(carItem);
	}
}
