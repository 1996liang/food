package com.anta.classify.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anta.classify.dao.ShopClassifyDao;
import com.anta.classify.entity.OneClassify;
import com.anta.classify.entity.ThreeClassify;
import com.anta.classify.entity.TwoClassify;
import com.anta.user.dao.UserDao;

@Service
public class ShopClassifyService {
	@Autowired
	ShopClassifyDao shopClassifyDao;
	
	//获取一级分类
	public List<OneClassify> getOneClassifyList(){
		return shopClassifyDao.getOneClassifyList();
	}
	//根据ID获取指定一级分类
	public OneClassify getOneClassify(Integer id){
		return shopClassifyDao.getOneClassify(id);
	}
	//根据ID获取指定二级分类
	public TwoClassify getTwoClassify(Integer id){
		return shopClassifyDao.getTwoClassify(id);
	}
	//根据ID获取指定三级分类
	public ThreeClassify getThreeClassify(Integer id){
		return shopClassifyDao.getThreeClassify(id);
	}
	//获取二级分类
	public List<TwoClassify> getTwoClassifyList(){	
			return shopClassifyDao.getTwoClassifyList();
	}
	//获取三级分类
	public List<ThreeClassify> getThreeClassifyList(){	
		return shopClassifyDao.getThreeClassifyList();
	}
	//添加一级分类
	public void addOne(OneClassify one){
		shopClassifyDao.addOne(one);
	}
	//添加二级分类
	public void addTwo(TwoClassify two,OneClassify one){
		two.setOneClassify(one);
		shopClassifyDao.addTwo(two);
	}
	//添加三级分类
	public void addThree(ThreeClassify three,TwoClassify two){
		three.setTwoClassify(two);
		shopClassifyDao.addThree(three);
	}
	//修改一级分类
	public void alterOne(OneClassify one){
		shopClassifyDao.alterOne(one);
	}
	//修改二级分类
	public void alterTwo(TwoClassify two,OneClassify one){
		two.setOneClassify(one);
		shopClassifyDao.alterTwo(two);
	}
	//修改三级分类
	public void alterThree(ThreeClassify three,TwoClassify two){
		three.setTwoClassify(two);
		shopClassifyDao.alterThree(three);
	}
	//删除一级二级三级分类
	public void deleteOne(OneClassify one){
		shopClassifyDao.deleteOne(one);
	}
	public void deleteTwo(TwoClassify two){
		shopClassifyDao.deleteTwo(two);
	}
	public void deleteThree(ThreeClassify three){
		shopClassifyDao.deleteThree(three);
	}
	//删除多项1级二级三级分类
	public void deleteOneList(String ids){
		shopClassifyDao.deleteOneList(ids);
	}
	public void deleteTwoList(String ids){
		shopClassifyDao.deleteTwoList(ids);
	}
	public void deleteThreeList(String ids){
		shopClassifyDao.deleteThreeList(ids);
	}
}
