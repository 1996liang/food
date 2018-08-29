package com.anta.goods.dao;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

import com.anta.classify.entity.ThreeClassify;
import com.anta.dao.BaseDao;
import com.anta.goods.entity.Goods;
import com.anta.goodsLabel.entity.GoodsLabel;
@Repository
public class GoodsDao extends BaseDao{
	
	//根据二级分类获取主页上的三级分类的商品
	public List<Goods> getClassifyGoods(int classify,int maxResults){
		String hql = "FROM ThreeClassify as t where t.twoClassify = ? ";
		List<ThreeClassify> tlist = getSession().createQuery(hql).setInteger(0, classify).list();
		StringBuffer hql1 = new StringBuffer("FROM Goods as g WHERE g.threeClassify IN(");
		if(tlist.size()==0){
			return null;
		}
		for(int i=0;i<tlist.size();i++){
			if(tlist.size()==i+1){
				hql1.append("?) AND g.status=1 ORDER BY g.salesVolume DESC");
			}else{
				hql1.append("?,");
			}
		}
		Query query = getSession().createQuery(new String(hql1));
		for(int i=0;i<tlist.size();i++){
			query.setInteger(i, tlist.get(i).getId());
		}
		return query.setMaxResults(maxResults).list();
	}
	//根据三级分类获取相应的商品，分页模式
	public List<Goods> getThreeClassifyGoods(ThreeClassify threeClassify,Integer firstResult,Integer maxResult){
		System.out.println(firstResult);
		String hql = "FROM Goods as g WHERE g.threeClassify=? AND g.status=1";
		return getSession().createQuery(hql).setEntity(0, threeClassify).setMaxResults(maxResult).setFirstResult(firstResult).list();
	}
	//获取三级分类商品的个数，根据个数得出总页
	public Long getThreeClassifyGoodsPage(ThreeClassify threeClassify,Integer maxResult){
		String hql = "SELECT count(g.id) FROM Goods as g WHERE g.threeClassify=? AND g.status=1";
		Long count = (Long) getSession().createQuery(hql).setEntity(0, threeClassify).uniqueResult();
		if(count%maxResult==0){
			return count/maxResult;
		}else{
			return (count/maxResult)+1;
		}
	}
	//获取三级分类商品的个数，
	public Long getThreeClassifyGoodsCount(ThreeClassify threeClassify){
		String hql = "SELECT count(g.id) FROM Goods as g WHERE g.threeClassify=? AND g.status=1";
		Long count = (Long) getSession().createQuery(hql).setEntity(0, threeClassify).uniqueResult();
		return count;
	}
	//根据排序,三级分类获取相应的商品，分页模式
	public List<Goods> sortAcquire(ThreeClassify threeClassify,Integer firstResult,Integer maxResult,String sortField){
//		String sql = "select * from goods as g where g.three_classify_id="+threeClassify.getId()+" order by g."+sortField+" DESC limit "+firstResult+","+maxResult+";";
//		return (List<Goods>)getSession().createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(Goods.class)).list();
		String hql = "FROM Goods as g WHERE g.threeClassify=:threeClassify AND g.status=1 ORDER BY :sortField DESC";
		return getSession().createQuery(hql).setEntity("threeClassify", threeClassify).setString("sortField", sortField).setMaxResults(maxResult).setFirstResult(firstResult).list();
	}
	//根据商品id获取商品的详细信息
	public Goods getGoodsmsg(Goods goods){
		String hql = "FROM Goods as g WHERE g.id=:id AND g.status=1";
		return (Goods) getSession().createQuery(hql).setInteger("id", goods.getId()).uniqueResult();		
	}
	//根据商品id获取商品的详细信息
	public Goods getGoodsmsgStatus0(Goods goods){
		String hql = "FROM Goods as g WHERE g.id=:id";
		return (Goods) getSession().createQuery(hql).setInteger("id", goods.getId()).uniqueResult();		
	}
	//根据商品标签获取商品的类似商品
	public Set<Goods> getLikeGoodsList(Goods goods,Integer firstResult,Integer MaxResult){
		Goods dataGoods = (Goods) getSession().get(Goods.class, goods.getId());
		Set<GoodsLabel> goodsLabels = dataGoods.getGoodsLabels();
		Set<Goods> likeGoodsList = new HashSet<Goods>();
		for(GoodsLabel label : goodsLabels){
			likeGoodsList.addAll(label.getGoods());
		}
		return likeGoodsList;
	}
	//获取所有的商品
	public List<Goods> getGoodsList(Integer firstResult,Integer maxResult){
		String hql = "FROM Goods as g AND g.status=1 ORDER BY g.groundingTime DESC";
		return getSession().createQuery(hql).setMaxResults(maxResult).setFirstResult(firstResult).list();
		
	}
	//包括已下架的
	public List<Goods> getAllGoodsList(Integer firstResult,Integer maxResult){
		String hql = "FROM Goods as g ORDER BY g.groundingTime DESC";
		return getSession().createQuery(hql).setMaxResults(maxResult).setFirstResult(firstResult).list();
		
	}
	//获取所有商品的总个数
	public Integer getGoodsCount(){
		String hql = "SELECT count(id) FROM Goods as g ";
		int count = ((Number) getSession().createQuery(hql).uniqueResult()).intValue();
		return count;
	}
	//将商品上,下架
	public void stopGoods(Integer id,Integer status){
		Goods g =(Goods) getSession().get(Goods.class, id);
		g.setStatus(status);
	}
	//删除商品
	public void deleteGoods(Integer id){
		Goods g = new Goods();
		g.setId(id);
		getSession().delete(g);
	}
	//批量删除商品
	public void deleteGoodsList(String ids){
		String hql = "delete from Goods as g where g.id in("+ids+")";
		getSession().createQuery(hql).executeUpdate();
	}
	//批量删除商品图片
	public void deletePictureList(String imagesStr,Integer id){
		Goods g = (Goods) getSession().get(Goods.class, id);
		g.setImages(imagesStr);
	}
	//批量删除商品详情图片
	public void deletePictureDescList(String imagesStr,Integer id){
		Goods g = (Goods) getSession().get(Goods.class, id);
		g.setGoodsDescribe(imagesStr);
	}
	
	public void addGoods(Goods g){
		getSession().save(g);
	}

}
