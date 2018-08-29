package com.anta.classify.dao;

import java.util.List;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Repository;

import com.anta.classify.entity.OneClassify;
import com.anta.classify.entity.ThreeClassify;
import com.anta.classify.entity.TwoClassify;
import com.anta.dao.BaseDao;

@Repository
public class ShopClassifyDao extends BaseDao {

	String hql;

	// 获取一级分类
	public List<OneClassify> getOneClassifyList() {
		hql = "FROM OneClassify";
		return getSession().createQuery(hql).list();
	}

	// 获取二级分类
	public List<TwoClassify> getTwoClassifyList() {
		hql = "FROM TwoClassify";
		List<TwoClassify> list = getSession().createQuery(hql).list();
		return list;
	}

	// 获取三级分类
	public List<ThreeClassify> getThreeClassifyList() {
		hql = "FROM ThreeClassify";
		return getSession().createQuery(hql).list();
	}

	// 根据ID获取指定一级分类
	public OneClassify getOneClassify(Integer id) {
		return (OneClassify) getSession().get(OneClassify.class, id);
	}

	// 根据ID获取指定二级分类
	public TwoClassify getTwoClassify(Integer id) {
		return (TwoClassify) getSession().get(TwoClassify.class, id);
	}

	// 根据ID获取指定三级分类
	public ThreeClassify getThreeClassify(Integer id) {
		return (ThreeClassify) getSession().get(ThreeClassify.class, id);
	}
	//添加一级分类
	public void addOne(OneClassify one){
		getSession().save(one);
	}
	//添加二级分类
	public void addTwo(TwoClassify two){
		getSession().save(two);
	}
	//添加三级分类
	public void addThree(ThreeClassify three){
		getSession().save(three);
	}
	//修改一级分类
	public void alterOne(OneClassify one){
		OneClassify dataOne = (OneClassify) getSession().get(OneClassify.class, one.getId());
		dataOne.setImageLabel(one.getImageLabel());
		dataOne.setName(one.getName());
	}
	//修改二级分类
	public void alterTwo(TwoClassify two){
		TwoClassify dataTwo = (TwoClassify) getSession().get(TwoClassify.class, two.getId());
		dataTwo.setOneClassify(two.getOneClassify());
		dataTwo.setName(two.getName());
	}
	//修改三级分类
	public void alterThree(ThreeClassify three){
		ThreeClassify dataThree = (ThreeClassify) getSession().get(ThreeClassify.class, three.getId());
		dataThree.setTwoClassify(three.getTwoClassify());
		dataThree.setName(three.getName());
	}
	//删除一级二级三级分类
	public void deleteOne(OneClassify one){
		getSession().delete(one);
	}
	public void deleteTwo(TwoClassify two){
		getSession().delete(two);
	}
	public void deleteThree(ThreeClassify three){
		getSession().delete(three);
	}
	//删除多项1级二级三级分类
	public void deleteOneList(String ids){
		String hql = "delete from OneClassify as one where one.id in("+ids+")";
		getSession().createQuery(hql).executeUpdate();
	}
	public void deleteTwoList(String ids){
		String hql = "delete from TwoClassify as two where two.id in("+ids+")";
		getSession().createQuery(hql).executeUpdate();
	}
	public void deleteThreeList(String ids){
		String hql = "delete from ThreeClassify as three where three.id in("+ids+")";
		getSession().createQuery(hql).executeUpdate();
	}
}
