package com.anta.index.action;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.anta.classify.entity.OneClassify;
import com.anta.classify.entity.ThreeClassify;
import com.anta.classify.entity.TwoClassify;
import com.anta.classify.service.ShopClassifyService;
import com.anta.goods.entity.Goods;
import com.anta.goods.service.GoodsService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
@Component
public class IndexAction extends ActionSupport{
	@Autowired
	private ShopClassifyService shopClassifyService;
	@Autowired
	private GoodsService goodsService;
	@Override
	public String execute() throws Exception {
		Integer maxResult = 8;
		//获取所有商品分类
		List<OneClassify> onelist =shopClassifyService.getOneClassifyList();
		//获取所有二级分类
		List<TwoClassify> twolist =shopClassifyService.getTwoClassifyList();
		//存放不同二级分类的不同商品
		Map<String,List<Goods>> goodsMap = new LinkedHashMap<String, List<Goods>>();
		for(TwoClassify two :twolist){
			//获取所有二级分类的商品，以销售量为排名，前8的商品上首页
			List<Goods> twoClassifyGoodsList = goodsService.getClassifyGoods(two.getId(),maxResult);
			goodsMap.put(two.getName(),twoClassifyGoodsList);
		}
		System.out.println(goodsMap.size()+"........");
		ActionContext.getContext().getSession().put("onelist", onelist);
		ActionContext.getContext().getSession().put("goodsMap", goodsMap);
//		ActionContext.getContext().getSession().put("nutList", nutList);;
//		ActionContext.getContext().getSession().put("seaFoodList", seaFoodList);;
		return SUCCESS;
	}
}

