package com.anta.classify.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.anta.classify.entity.OneClassify;
import com.anta.classify.entity.ThreeClassify;
import com.anta.classify.entity.TwoClassify;
import com.anta.classify.service.ShopClassifyService;

@Component
public class ShopClassifyAction {
	
	@Autowired
	private ShopClassifyService shopClassifyService;
	private InputStream inputStream;
	String msg ;
	//获取一级分类
	public String getOneClassifyList() throws Exception{
		List<OneClassify> list = shopClassifyService.getOneClassifyList();
//		msg = JSON.toJSONString(list);
//		System.out.println(msg);
//		inputStream = new ByteArrayInputStream(msg.getBytes("utf-8"));
		return "ajaxSuccess";
	}
	//获取二级分类
	public String getTwoClassifyList() throws Exception{
		System.out.println("110");
		List<TwoClassify> list = shopClassifyService.getTwoClassifyList();
		msg = JSON.toJSONString(list);
		System.out.println(msg);
		inputStream = new ByteArrayInputStream(msg.getBytes("utf-8"));
		return "ajaxSuccess";
	}
	//获取三级分类
	public String getThreeClassifyList() throws Exception{
		System.out.println("120");
		List<ThreeClassify> list = shopClassifyService.getThreeClassifyList();
		msg = JSON.toJSONString(list);
		System.out.println(msg);
		inputStream = new ByteArrayInputStream(msg.getBytes("utf-8"));
		return "ajaxSuccess";
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
}
