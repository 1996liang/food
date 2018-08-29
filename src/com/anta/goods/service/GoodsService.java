package com.anta.goods.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anta.classify.entity.ThreeClassify;
import com.anta.goods.dao.GoodsDao;
import com.anta.goods.entity.Goods;
import com.anta.goodsLabel.entity.GoodsLabel;
import com.anta.goodsLabel.service.GoodsLabelService;
import com.anta.options.entity.GoodsOptions;
import com.anta.options.service.GoodsOptionsService;
import com.mysql.fabric.xmlrpc.base.Array;

@Service
public class GoodsService {
	@Autowired
	GoodsDao goodsDao;
	@Autowired
	GoodsLabelService goodsLabelService;
	@Autowired
	GoodsOptionsService goodsOptionsService;
	public List<Goods> getClassifyGoods(int classify,int maxResults){
		List<Goods> goodsList = goodsDao.getClassifyGoods(classify,maxResults);
		return goodsList;
	}
	public List<Goods> getThreeClassifyGoods(ThreeClassify threeClassify,Integer page,Integer maxResult){
		Integer firstResult ;
		if(page==1){
			firstResult = new Integer(1);
		}else{
			firstResult = new Integer((page-1)*maxResult+1);
		}
		List<Goods> l = goodsDao.getThreeClassifyGoods(threeClassify, firstResult,maxResult);
		System.out.println(l.size());
		return l;
	}
	//获取三级分类商品的个数，根据个数得出总页
	public Long getThreeClassifyGoodsPage(ThreeClassify threeClassify,Integer maxResult){
		return goodsDao.getThreeClassifyGoodsPage(threeClassify,maxResult);
	}
	//获取三级分类商品的个数
	public Long getThreeClassifyGoodsCount(ThreeClassify threeClassify){
		return goodsDao.getThreeClassifyGoodsCount(threeClassify);
	}
	//根据排序,三级分类获取相应的商品，分页模式
	public List<Goods> sortAcquire(ThreeClassify threeClassify,Integer page,Integer maxResult,String sortField){
		Integer firstResult ;
		if(page==1){
			firstResult = new Integer(1);
		}else{
			firstResult = new Integer((page-1)*maxResult+1);
		}
		return goodsDao.sortAcquire(threeClassify,firstResult,maxResult,sortField);
	}
	//根据商品id获取商品的详细信息
	public Goods getGoodsmsg(Goods goods){
		return goodsDao.getGoodsmsg(goods);
	}
	//根据商品id获取商品的详细信息
	public Goods getGoodsmsgStatus0(Goods goods){
		return goodsDao.getGoodsmsgStatus0(goods);
	}
	//根据商品标签获取商品的类似商品
	public Set<Goods> getLikeGoodsList(Goods goods,Integer firstResult,Integer MaxResult){
		return goodsDao.getLikeGoodsList(goods,firstResult,MaxResult);
	}
	//获取所有的商品
	public List<Goods> getGoodsList(Integer page,Integer maxResult){
		Integer firstResult ;
		if(page==1){
			firstResult = new Integer(1);
		}else{
			firstResult = new Integer((page-1)*maxResult+1);
		}
		return goodsDao.getAllGoodsList(firstResult, maxResult);
	}
	//获取所有商品的总个数
	public Integer getGoodsCount(){
		return goodsDao.getGoodsCount();
	}
	//将商品上,下架
	public void stopGoods(Integer id,Integer status){
		goodsDao.stopGoods(id, status);
	}
	//删除商品
	public void deleteGoods(Integer id){
		goodsDao.deleteGoods(id);
	}
	//批量删除商品
	public void deleteGoodsList(String ids){
		goodsDao.deleteGoodsList(ids);
	}
	//批量删除商品图片或者详情图片
	//ids是图片的下标
	public void deletePictureList(String ids,Integer id,String source){
		String[] index = ids.split(",");
		String imagesStr = "";
		//从数据库获取该id的商品
		Goods dataGoods = getGoodsmsg(new Goods(id));
		List<String> imageList = new ArrayList<String>();
		//如果删除来源是详情，获取详情图片，添加到list中，供下面删除和改变
		if(source.equals("desc")){
			String[] imageArray = dataGoods.getDescribeImageArray();
			imageList.addAll(Arrays.asList(imageArray));
		}else{
			String[] imageArray = dataGoods.getImagesArray();
			imageList.addAll(Arrays.asList(imageArray));
		}
		//删除图片链接
		for(int i=index.length-1;i>=0;i--){
			int listIndex = Integer.parseInt(index[i]);
			imageList.remove(listIndex);
		}
		//将图片链接重新编成字符串
		for(int i=0;i<imageList.size();i++){
			imagesStr+=(imageList.get(i)+"`");
		}
		if(source.equals("desc")){
			goodsDao.deletePictureDescList(imagesStr, id);
		}else{
			goodsDao.deletePictureList(imagesStr, id);
		}
	}
	public void addGoods(Goods g){
		
		for(GoodsOptions option :g.getGoodsOptions()){
			if(option.getGoodsOptions().getId()==null){
				Integer id = goodsOptionsService.addOption(option.getGoodsOptions());
				option.getGoodsOptions().setId(id);
			}
			if(option.getId()==null){
				Integer id = goodsOptionsService.addOption(option);
				option.setId(id);
			}
		}
		for(GoodsLabel label:g.getGoodsLabels()){
			if(label.getSuperGoodsName().getId()==null||label.getSuperGoodsName().getId()==0){
				Integer id = goodsLabelService.addGoodsLabel(label.getSuperGoodsName());
				label.getSuperGoodsName().setId(id);		
			}
			if(label.getId()==null||label.getId()==0){
				Integer id = goodsLabelService.addGoodsLabel(label);
				label.setId(id);		
			}
		}
		g.setSalesVolume(Long.parseLong("0"));
		g.setGroundingTime(new Date());
		g.setStatus(0);
		goodsDao.addGoods(g);
		
	}
}
