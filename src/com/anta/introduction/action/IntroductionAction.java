package com.anta.introduction.action;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.anta.evaluate.entity.Evaluate;
import com.anta.evaluate.service.EvaluateService;
import com.anta.goods.entity.Goods;
import com.anta.goods.service.GoodsService;
import com.anta.options.entity.GoodsOptions;
import com.anta.options.service.GoodsOptionsService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component
public class IntroductionAction extends ActionSupport{
	@Autowired
	private GoodsService goodsService;
	@Autowired
	GoodsOptionsService goodsOptionsService;
	@Autowired
	EvaluateService evaluateService;
	private Goods goods;
	public String goodsIntroduction(){
		Goods dataGoods = goodsService.getGoodsmsg(goods);
		Set<Goods> likeGoodsSet = goodsService.getLikeGoodsList(goods, 1, 1);
		List<Map<GoodsOptions,List<GoodsOptions>>> goodsOptionsList = goodsOptionsService.getGoodsOptions(goods);
		List<Evaluate> evaluates = evaluateService.getGoodsEvaluate(goods);
		//好评，中评，差评，总评论数
		Integer star1 = evaluateService.getGoodsEvaluateStarCount(goods, 1);
		Integer star2 = evaluateService.getGoodsEvaluateStarCount(goods, 2);
		Integer star3 = evaluateService.getGoodsEvaluateStarCount(goods, 3);
		Integer evaluateCount = evaluateService.getGoodsEvaluateCount(goods);
		//注入属性
		ActionContext.getContext().getSession().put("goods", dataGoods);
		ActionContext.getContext().getSession().put("likeGoodsSet", likeGoodsSet);
		ActionContext.getContext().getSession().put("goodsOptionsList", goodsOptionsList);
		ActionContext.getContext().getSession().put("goodsEvaluateList", evaluates);
		ActionContext.getContext().getSession().put("star1", star1);
		ActionContext.getContext().getSession().put("star2", star2);
		ActionContext.getContext().getSession().put("star3", star3);
		ActionContext.getContext().getSession().put("evaluateCount", evaluateCount);
		return "success";
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	
}
