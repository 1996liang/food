package com.anta.evaluate.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.anta.dao.BaseDao;
import com.anta.evaluate.entity.Evaluate;
import com.anta.goods.entity.Goods;
import com.anta.user.entity.User;

@Repository
public class EvaluateDao extends BaseDao{
	
	public void saveEvaluate(Evaluate e){
		getSession().save(e);
	}
	
	public List<Evaluate> getGoodsEvaluate(Goods g){
		String hql = "FROM Evaluate as e WHERE e.orderItem.goods=:goods";
		return getSession().createQuery(hql).setEntity("goods", g).list();
		
	}
	
	//获取用户的所有评价
	public List<Evaluate> getUserEvaluate(User u){
		String hql = "FROM Evaluate as e WHERE e.orderItem.order.user=:user";
		return getSession().createQuery(hql).setEntity("user", u).list();
	}
	
	//获取商品的评星数
	public Integer getGoodsEvaluateStarCount(Goods g,Integer star){
		String hql = "SELECT count(id) FROM Evaluate as e WHERE e.orderItem.goods=:goods AND e.star=:star";
		int count = ((Number) getSession().createQuery(hql).setEntity("goods", g).setInteger("star", star).uniqueResult()).intValue();
		return count;
	}
	//获取商品的总评论数
	public Integer getGoodsEvaluateCount(Goods g){
		String hql = "SELECT count(id) FROM Evaluate as e WHERE e.orderItem.goods=:goods ";
		int count = ((Number) getSession().createQuery(hql).setEntity("goods", g).uniqueResult()).intValue();
		return count;
	}
}

