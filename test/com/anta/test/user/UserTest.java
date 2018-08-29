package com.anta.test.user;

import static org.junit.Assert.*;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.codehaus.jackson.map.ObjectMapper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.alibaba.fastjson.JSON;
import com.anta.car.entity.CarItem;
import com.anta.car.service.CarService;
import com.anta.classify.entity.OneClassify;
import com.anta.classify.entity.ThreeClassify;
import com.anta.classify.entity.TwoClassify;
import com.anta.classify.service.ShopClassifyService;
import com.anta.evaluate.entity.Evaluate;
import com.anta.evaluate.service.EvaluateService;
import com.anta.goods.entity.Goods;
import com.anta.goods.service.GoodsService;
import com.anta.goodsLabel.entity.GoodsLabel;
import com.anta.goodsLabel.service.GoodsLabelService;
import com.anta.options.entity.GoodsOptions;
import com.anta.options.service.GoodsOptionsService;
import com.anta.order.entity.OrderItem;
import com.anta.order.entity.Orders;
import com.anta.order.service.OrderService;
import com.anta.user.entity.User;
import com.anta.user.service.UserService;
import com.anta.util.EmailSend;
import com.food.admin.adminUser.entity.AdminUser;
import com.food.admin.adminUser.service.AdminUserService;

public class UserTest {
	
	UserService userService;
	ShopClassifyService shopClassifyService;
	GoodsService goodsService;
	GoodsLabelService goodsLabelService;
	GoodsOptionsService goodsOptionsService;
	CarService carService;
	OrderService orderService;
	EvaluateService evaluateService;
	AdminUserService adminUserService;
	ApplicationContext applicationContext;
	{
		applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		userService = (UserService) applicationContext.getBean("userService");
		shopClassifyService = (ShopClassifyService) applicationContext.getBean("shopClassifyService");
		goodsService = (GoodsService) applicationContext.getBean("goodsService");
		goodsLabelService = (GoodsLabelService) applicationContext.getBean("goodsLabelService");
		goodsOptionsService = (GoodsOptionsService)applicationContext.getBean("goodsOptionsService");
		carService = (CarService)applicationContext.getBean("carService");
		orderService = (OrderService)applicationContext.getBean("orderService");
		evaluateService = (EvaluateService)applicationContext.getBean("evaluateService");
		adminUserService = (AdminUserService)applicationContext.getBean("adminUserService");
	}
	@Test
	public void test() {
		User user = new User();
		user.setId(1);
		List<CarItem> list = carService.getUserCarItem(user);
		for(CarItem item:list){
			System.out.println("用户:"+item.getUser().getUsername()+" 购物车内有商品编号"+item.getGoods().getId()+"商品名"+item.getGoods().getGoodsName()
					);
			Iterator<GoodsOptions> i = item.getGoodsOptions().iterator();
			while(i.hasNext()){
				GoodsOptions g = i.next();
				System.out.println("商品选项为"+g.getGoodsOptions().getName()+":"+g.getName());
			}
			
			System.out.println("数量为"+item.getQuantity());
		}
		
	}
	@Test
	public void testGetEvaluate() throws Exception{
		Goods g = new Goods();
		g.setId(57);
		List<Map<GoodsOptions,List<GoodsOptions>>> l =goodsOptionsService.getGoodsOptions(g);
		//		EmailSend.sendMail("674393812@qq.com","111111111");
//		Evaluate e = new Evaluate();
//		OrderItem o = new OrderItem();
//		o.setId(39);
//		e.setContent("lllllllll");
//		e.setOrderItem(o);
//		e.setStar(3);
//		evaluateService.saveEvaluate(e);
//		Goods g = new Goods();
//		g.setId(1);
//		Integer l = evaluateService.getGoodsEvaluateStarCount(g,1);
//		System.out.println(l);
//		User u = new User();
//		u.setId(1);
//		List<Evaluate> l = evaluateService.getUserEvaluate(u);
//		System.out.println(l.get(0).getOrderItem().getGoods().getGoodsName());
//		AdminUser user = new AdminUser();
//		user.setUsername("admin");
//		user.setPassword("admin");
//		adminUserService.login(user);
//		ThreeClassify t = new ThreeClassify(2);
//		List<GoodsLabel> l =goodsLabelService.getThreeClassifyGoodsLabels(t);
//		for(GoodsLabel g:l){
//			System.out.println(g.getSuperGoodsName().getLabelName()+":"+g.getLabelName());
//		}
	}
	
	@Test
	public void testGetAllOrder(){
		User user = new User();
		user.setId(1);
		List<Orders> l  =orderService.getUserAllOrder(user);
		System.out.println(l);
	}
	@Test
	public void testClassify() {
		Goods goods = new Goods();
		goods.setId(1);
		User user = new User();
		user.setId(1);
		GoodsOptions goodsOptions = new GoodsOptions();
		goodsOptions.setId(6);
		GoodsOptions goodsOptions1 = new GoodsOptions();
		goodsOptions1.setId(8);
		Set<GoodsOptions> set = new HashSet<GoodsOptions>();
		set.add(goodsOptions);
		set.add(goodsOptions1);
		Integer quantity = 1;
		carService.addCart(goods,user,set,quantity);
	}
	@Test
	public void testGetPhone(){
		User user = new User();
		user.setId(1);
		String rePassword = "1234";
		user.setPassword("1234");
		String oldPassword = "123";
		Integer i = userService.alterPassword(rePassword, oldPassword, user);
		System.out.println(i);
	}
	
	@Test
	public void testOrder() {
		String s = new String("{'goods':{'id':1},'quantity':3}/{'goods':{'id':1},'quantity':3}");
		String[]str = s.split("/");
		for(String s1 :str){
			System.out.println(s1);
			OrderItem o = JSON.parseObject(s1, OrderItem.class);
			System.out.println(o.getGoods().getId());
			System.out.println(o.getQuantity());
//			System.out.println(o.getGoodsOptions());
		}
		//		OrderItem oi1 = new OrderItem();
//		OrderItem oi2 = new OrderItem();
//		Goods g = new Goods();
//		g.setId(1);
//		oi1.setGoods(g);
//		oi2.setGoods(g);
//		oi1.setQuantity(1);
//		oi2.setQuantity(2);
//		GoodsOptions go1 = new GoodsOptions();
//		GoodsOptions go2 = new GoodsOptions();
//		GoodsOptions go3 = new GoodsOptions();
//		GoodsOptions go4 = new GoodsOptions();
//		go1.setId(3);
//		go2.setId(7);
//		go3.setId(4);
//		go4.setId(8);
//		Set<GoodsOptions> s = new HashSet<GoodsOptions>();
//		Set<GoodsOptions> s1 = new HashSet<GoodsOptions>();
//		s.add(go1);
//		s.add(go2);
//		s1.add(go3);
//		s1.add(go4);
//		oi1.setGoodsOptions(s);
//		oi2.setGoodsOptions(s1);
//		Orders o = new Orders();
//		User user = new User();
//		user.setId(1);
//		o.setUser(user);
//		Set<OrderItem> so = new HashSet<OrderItem>();
//		so.add(oi1);
//		so.add(oi2);
//		orderService.createOrder(so, o);
	}
}
