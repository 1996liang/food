package com.anta.goodsLabel.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.anta.classify.entity.ThreeClassify;
import com.anta.dao.BaseDao;
import com.anta.goods.entity.Goods;
import com.anta.goodsLabel.entity.GoodsLabel;

@Repository
public class GoodsLabelDao extends BaseDao{
	//获取三级分类的商品的标签
	public List<GoodsLabel> getThreeClassifyGoodsLabels(ThreeClassify threeClassify){
		//通过三级分类获取商品中的标签
		String hql = "FROM Goods as g WHERE g.threeClassify = ?";
		List<Goods> goodsList = getSession().createQuery(hql).setEntity(0, threeClassify).list();
		List<GoodsLabel> list = new ArrayList<GoodsLabel>();
		for(Goods goods : goodsList){
			list.addAll(goods.getGoodsLabels());
		}
		//删除标签名重复的
		for(int i=0;i<list.size()-1;i++){
			GoodsLabel goodsLabel = list.get(i);
			for(int j=i+1;j<list.size();j++){
				if(goodsLabel.getLabelName().equals(list.get(j).getLabelName())){
					
					list.remove(j);
				}
			}
		}
		System.out.println(list.size());
		return list;
		//分门别类排好
//		List<GoodsLabel> one = new ArrayList<GoodsLabel>();
//		List<GoodsLabel> two = new ArrayList<GoodsLabel>();
//		List<GoodsLabel> three = new ArrayList<GoodsLabel>();
//		for(int i=0;i<list.size();i++){
//			GoodsLabel goodsLabel = list.get(i);
//			GoodsLabel goodsLabel1 = new GoodsLabel();
//			if(goodsLabel.getLabelName().contains("A")){
//				goodsLabel1.setLabelName(goodsLabel.getLabelName().substring(1));
//				one.add(goodsLabel1);
//			}else if(goodsLabel.getLabelName().contains("B")){
//				goodsLabel1.setLabelName(goodsLabel.getLabelName().substring(1));
//				two.add(goodsLabel1);
//			}else if(goodsLabel.getLabelName().contains("C")){
//				goodsLabel1.setLabelName(goodsLabel.getLabelName().substring(1));
//				three.add(goodsLabel1);
//			}
//		}
//		//保存数据
//		Map<String,List<GoodsLabel>> map = new HashMap<String,List<GoodsLabel>>();
//		map.put("one", one);
//		map.put("two", two);
//		map.put("three", three);
	}
	public Integer addGoodsLabel(GoodsLabel g){
		Integer id = (Integer) getSession().save(g);
		return id;
	}
}
