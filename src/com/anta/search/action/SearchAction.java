package com.anta.search.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.anta.classify.entity.ThreeClassify;
import com.anta.goods.entity.Goods;
import com.anta.goods.service.GoodsService;
import com.anta.goodsLabel.entity.GoodsLabel;
import com.anta.goodsLabel.service.GoodsLabelService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component
public class SearchAction extends ActionSupport{
	@Autowired
	private GoodsLabelService goodsLabelService;
	@Autowired
	private GoodsService goodsService;
	Integer page;
	private ThreeClassify threeClassify;
	String sortType;
	//根据三级分类搜索
	public String threeClassifySearch(){
		Integer maxResult = 4;
		List<Map<String,List<GoodsLabel>>> labelList = goodsLabelService.getGoodsLabels(threeClassify);
		List<Goods> list = goodsService.getThreeClassifyGoods(threeClassify, page,maxResult);
		Long page = goodsService.getThreeClassifyGoodsPage(threeClassify,maxResult);
		ActionContext.getContext().getSession().put("goodsLabel", labelList);
		ActionContext.getContext().getSession().put("goods", list);
		ActionContext.getContext().getSession().put("totalPage", page);
		ActionContext.getContext().getSession().put("nowPage", 1);
		return "success";
	}
	//根据三级分类的页数来进行搜索获取数据
	public String getThreeClassifySearchPage(){
		Integer maxResult = 4;
		List<Goods> list = goodsService.getThreeClassifyGoods(threeClassify, page,maxResult);
		ActionContext.getContext().getSession().put("goods", list);
		ActionContext.getContext().getSession().put("nowPage", page);
		return "success";
	}
	//根据前台点击的排序方式在数据库重新排序获取数据
	public String sort(){
		Integer maxResult = 4;
		List<Goods> list = null ;
		switch (sortType) {
			//销量排序
			case "salesSort":
				list =goodsService.sortAcquire(threeClassify,page,maxResult,"salesVolume");
				break;
			//价格排序
			case "priceSort":
				list =goodsService.sortAcquire(threeClassify,page,maxResult,"latelyPrice");
				break;
			//评价排序
			case "evalueateSort":
				
				break;
			//综合排序,以商品上架顺序排序
			default:
				list =goodsService.sortAcquire(threeClassify,page,maxResult,"id");
				break;
		}
		ActionContext.getContext().getSession().put("goods", list);
		ActionContext.getContext().getSession().put("nowPage", 1);
		return "success";
	}
	public ThreeClassify getThreeClassify() {
		return threeClassify;
	}
	public void setThreeClassify(ThreeClassify threeClassify) {
		this.threeClassify = threeClassify;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public String getSortType() {
		return sortType;
	}
	public void setSortType(String sortType) {
		this.sortType = sortType;
	}
	
	
}
