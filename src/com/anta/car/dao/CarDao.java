package com.anta.car.dao;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Repository;

import com.anta.car.entity.CarItem;
import com.anta.dao.BaseDao;
import com.anta.goods.entity.Goods;
import com.anta.options.entity.GoodsOptions;
import com.anta.user.entity.User;

@Repository
public class CarDao extends BaseDao{
	//添加购物车中商品
	public void addCart(Goods goods,User user,Set<GoodsOptions> goodsOptions,Integer quantity){
		CarItem car = new CarItem(goods, quantity, user, goodsOptions);
		getSession().save(car);
	}
	//根据购物车项的ID获取购物车项的全部资料
	public CarItem byIdGetCarItem(CarItem carItem){
		return (CarItem) getSession().get(CarItem.class, carItem.getId());
	}
	//统计购物车中同个商品，同个用户，同个商品选项的购物车项
	public Integer carSameGoodsQuantity(Goods goods,User user,Set<GoodsOptions> goodsOptions){
		CarItem c = this.getCartItem(goods, user, goodsOptions);
		 if(c!=null){
			 return 1;
		 }else{
			 return 0;
		 }
	}
	//修改购物车中商品的个数
	public void alterCartGoodsQuantity(CarItem carItem,Integer quantity){
		carItem = (CarItem) getSession().get(CarItem.class, carItem.getId());
		carItem.setQuantity(quantity);
		getSession().saveOrUpdate(carItem);
	}
	//获得购物车中同个商品，同个用户，同个商品选项的购物车项
	public CarItem getCartItem(Goods goods,User user,Set<GoodsOptions> goodsOptions){
		//首先获取同个商品，同个用户的购物车项
		String hql = "FROM CarItem as c WHERE c.goods=:goods AND c.user =:user";
		List<CarItem> l = getSession().createQuery(hql).setEntity("goods", goods).setEntity("user", user).list();
		List<Integer> i = new ArrayList<Integer>();
		//将该些购物车项的ID收集起来
		for(CarItem c : l){
			i.add(c.getId());
		}
		if(i.size()!=0){
			//查找这些购物车项的ID和选项的ID项对应的中间表项的购物和项ID（它应该是复数，毕竟商品选项可以多个）
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT o.carItem_id FROM options_caritem_item as o WHERE o.carItem_id in(:carItemID) ");
			for(int j=0;j<goodsOptions.size();j++){
				GoodsOptions go = (GoodsOptions) goodsOptions.toArray()[j];
				if(j==0){
					sql.append("AND GOODS_OPTIONS_ID = "+go.getId()+" ");
				}else{
					sql.append("OR GOODS_OPTIONS_ID = "+go.getId()+" ");
				}
			}
			System.out.println(i.size());
			//得到的这些ID中，应该都是同一个数字，所以只取一个
			List<Integer> ll =getSession().createSQLQuery(new String(sql)).setParameterList("carItemID", i).list();
			System.out.println(new String(sql));
			System.out.println(ll.size()+"*****"+goodsOptions.size());
			Integer id = null ;
			if(ll.size()!=0&&ll.size()==goodsOptions.size()){
				 id = ll.get(0);
				//返回该ID的购物车项
				return (CarItem) getSession().get(CarItem.class, id);
			}else{
				return null;
			}
		}else{
			return null;
		}
	}
	//获取用户购物车
	public List<CarItem> getUserCarItem(User user){
		String hql = "FROM CarItem as c WHERE c.user=:user";
		return getSession().createQuery(hql).setEntity("user", user).list();
	}
}
