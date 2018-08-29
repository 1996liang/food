package com.anta.options.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anta.goods.entity.Goods;
import com.anta.options.dao.GoodsOptionsDao;
import com.anta.options.entity.GoodsOptions;

@Service
public class GoodsOptionsService {

	@Autowired
	GoodsOptionsDao goodsOptionsDao;
	//获取商品的所有商品选项
	public List<Map<GoodsOptions,List<GoodsOptions>>> getGoodsOptions(Goods goods){
		//所有选项，包括选项名
		List<GoodsOptions> list = goodsOptionsDao.getGoodsOptions(goods);
		System.out.println(list.size());
		//选项名
		Set<GoodsOptions> superOptions = new HashSet<GoodsOptions>();
		//排列好的
		List<Map<GoodsOptions,List<GoodsOptions>>> goodsOptionsList = new ArrayList<Map<GoodsOptions,List<GoodsOptions>>>(); 
		//如果是选项名，添加
		for(GoodsOptions goodsOption:list){
			
			superOptions.add(goodsOption.getGoodsOptions());
		}
		if(superOptions.isEmpty()!=true){
			//选项名
			for(GoodsOptions superOption:superOptions){
				
				//选项值
				Set<GoodsOptions> optionsList = new HashSet<GoodsOptions>();
				//所有选项，包括选项名
				for(GoodsOptions goodsOption:list){
					if(goodsOption.getGoodsOptions()!=null){
						if(superOption.equals(goodsOption.getGoodsOptions())){
							if(optionsList.contains(goodsOption)==true){
								
							}else{
								optionsList.add(goodsOption);
								System.out.println(superOption.getName()+goodsOption.getName());
							}
						}
					}
				}
				Map<GoodsOptions,List<GoodsOptions>> map = new HashMap<GoodsOptions,List<GoodsOptions>>();
				List<GoodsOptions> l = new ArrayList<GoodsOptions>();
				l.addAll(optionsList);
				map.put(superOption, l);
				goodsOptionsList.add(map);
			}
		}
		System.out.println("11111111111111111111111111111111");
		return goodsOptionsList;
	}
	public Integer addOption(GoodsOptions g){
		return goodsOptionsDao.addOption(g);
	}
}
