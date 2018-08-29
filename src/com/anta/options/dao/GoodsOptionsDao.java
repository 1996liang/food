package com.anta.options.dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Repository;

import com.anta.dao.BaseDao;
import com.anta.goods.entity.Goods;
import com.anta.options.entity.GoodsOptions;

@Repository
public class GoodsOptionsDao extends BaseDao{
	
	//获取商品的所有商品选项
	public List<GoodsOptions> getGoodsOptions(Goods goods){
		String hql = "FROM Goods as g WHERE g.id = :id";
		Goods g = (Goods) getSession().createQuery(hql).setInteger("id", goods.getId()).uniqueResult();
		Set<GoodsOptions> set = g.getGoodsOptions();
		
		System.out.println(set.size());
		List<GoodsOptions> l = new ArrayList<GoodsOptions>();
		for(GoodsOptions gp :set){
			l.add(gp);
		}
		System.out.println(l.size());
		return l;
	}
	public Integer addOption(GoodsOptions g){
		Integer id = (Integer) getSession().save(g);
		return id;
	}
}
