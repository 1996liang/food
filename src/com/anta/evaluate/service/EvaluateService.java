package com.anta.evaluate.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anta.evaluate.dao.EvaluateDao;
import com.anta.evaluate.entity.Evaluate;
import com.anta.goods.entity.Goods;
import com.anta.user.entity.User;

@Service
public class EvaluateService {

	@Autowired
	EvaluateDao evaluateDao;
	public void saveEvaluate(Evaluate e){
		e.setTime(new Date());
		evaluateDao.saveEvaluate(e);
	}
	public List<Evaluate> getGoodsEvaluate(Goods g){
		return evaluateDao.getGoodsEvaluate(g);
	}
	//获取用户的所有评价
	public List<Evaluate> getUserEvaluate(User u){
		return evaluateDao.getUserEvaluate(u);
	}
	//获取商品的评星数
	public Integer getGoodsEvaluateStarCount(Goods g,Integer star){
		return evaluateDao.getGoodsEvaluateStarCount(g,star);
	}
	//获取商品的总评论数
	public Integer getGoodsEvaluateCount(Goods g){
		return evaluateDao.getGoodsEvaluateCount(g);
	}
}
