package com.anta.goodsLabel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anta.classify.entity.ThreeClassify;
import com.anta.goods.entity.Goods;
import com.anta.goodsLabel.dao.GoodsLabelDao;
import com.anta.goodsLabel.entity.GoodsLabel;
import com.anta.options.entity.GoodsOptions;

@Service
public class GoodsLabelService {
	@Autowired
	private GoodsLabelDao goodsLabelDao;
	//获取三级分类商品的标签
	public List<Map<String,List<GoodsLabel>>> getGoodsLabels(ThreeClassify threeClassify){
		List<GoodsLabel> list = goodsLabelDao.getThreeClassifyGoodsLabels(threeClassify);
		System.out.println(list.size()+"list");
		Set<String> superLabels = new HashSet<String>();
		List<Map<String,List<GoodsLabel>>> goodsLabelList = new ArrayList<Map<String,List<GoodsLabel>>>(); 
		for(GoodsLabel goodsOLabel:list){
				superLabels.add(goodsOLabel.getSuperGoodsName().getLabelName());
		}
		if(superLabels.isEmpty()!=true){
			for(String superLabel:superLabels){
				List<GoodsLabel> labels = new ArrayList<GoodsLabel>();
				for(GoodsLabel label:list){
					if(label.getSuperGoodsName().getLabelName().equals(superLabel)){
						labels.add(label);
					}
				}
				Map<String,List<GoodsLabel>> map = new HashMap<String,List<GoodsLabel>>();
				map.put(superLabel, labels);
				goodsLabelList.add(map);
			}
		}
//		System.out.println("11111111111111111111111111111111");
		return goodsLabelList;
	}
	//获取三级目录所对用标签
	public List<GoodsLabel> getThreeClassifyGoodsLabels(ThreeClassify threeClassify){
		return goodsLabelDao.getThreeClassifyGoodsLabels(threeClassify);
	}
	public Integer addGoodsLabel(GoodsLabel g){
		return goodsLabelDao.addGoodsLabel(g);
	}
}
