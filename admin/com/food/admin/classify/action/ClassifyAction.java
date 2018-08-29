package com.food.admin.classify.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.anta.classify.entity.OneClassify;
import com.anta.classify.entity.ThreeClassify;
import com.anta.classify.entity.TwoClassify;
import com.anta.classify.service.ShopClassifyService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component
public class ClassifyAction extends ActionSupport {
	@Autowired
	ShopClassifyService classifyService;
	Integer id;
	//接受多个id，用逗号隔开，便于删除
	String ids;
	OneClassify one;
	TwoClassify two;
	ThreeClassify three;
	private InputStream inputStream;
	// 获取一二三级分类的列表
	public String getOneClassifyList() {
		List<OneClassify> l = classifyService.getOneClassifyList();
		Map<String, Object> m = (Map<String, Object>) ActionContext
				.getContext().get("request");
		m.put("oneList", l);
		return "oneClassify";
	}
	public String getTwoClassifyList() {
		List<TwoClassify> l = classifyService.getTwoClassifyList();
		Map<String, Object> m = (Map<String, Object>) ActionContext
				.getContext().get("request");
		m.put("twoList", l);
		return "twoClassify";
	}

	public String getThreeClassifyList() {
		List<ThreeClassify> l = classifyService.getThreeClassifyList();
		Map<String, Object> m = (Map<String, Object>) ActionContext
				.getContext().get("request");
		m.put("threeList", l);
		return "threeClassify";
	}
	
	//获取所有级分类的列表 ajax形式返回
	public String ajaxGetClassifyList() throws Exception{
		List<OneClassify> l = classifyService.getOneClassifyList();
		inputStream = new ByteArrayInputStream(JSON.toJSONString(l).getBytes("utf-8"));
		return "ajaxSuccess";
	}
	
	
	// 获取一二三级分类
	public String getOneClassify() {
		OneClassify one = classifyService.getOneClassify(id);
		Map<String, Object> m = (Map<String, Object>) ActionContext
				.getContext().get("request");
		m.put("one", one);
		return "oneClassify-add";
	}

	public String getTwoClassify() {
		TwoClassify two = classifyService.getTwoClassify(id);
		Map<String, Object> m = (Map<String, Object>) ActionContext
				.getContext().get("request");
		m.put("two", two);
		return "twoClassify-add";
	}

	public String getThreeClassify() {
		ThreeClassify three = classifyService.getThreeClassify(id);
		Map<String, Object> m = (Map<String, Object>) ActionContext
				.getContext().get("request");
		m.put("three", three);
		return "threeClassify-add";
	}
	//添加1,2,3级分类或者修改123级分类
	public String addOne(){
		if(one.getId()==null){
			classifyService.addOne(one);
		}else{
			classifyService.alterOne(one);
		}
		return "redirect-one-list";
	}
	public String addTwo(){
		if(two.getId()==null){
			classifyService.addTwo(two,one);
		}else{
			classifyService.alterTwo(two,one);
		}
		return "redirect-two-list";
	}
	public String addThree(){
		if(three.getId()==null){
			classifyService.addThree(three,two);
		}else{
			classifyService.alterThree(three,two);
		}
		return "redirect-three-list";
	}
	//删除一级，二级，三级分类
	public String deleteOne() throws Exception{
		classifyService.deleteOne(one);
		inputStream = new ByteArrayInputStream(JSON.toJSONString("success").getBytes("utf-8"));
		return "ajaxSuccess";
	}
	public String deleteTwo() throws Exception{
		classifyService.deleteTwo(two);
		inputStream = new ByteArrayInputStream(JSON.toJSONString("success").getBytes("utf-8"));
		return "ajaxSuccess";
	}
	public String deleteThree() throws Exception{
		classifyService.deleteThree(three);
		inputStream = new ByteArrayInputStream(JSON.toJSONString("success").getBytes("utf-8"));
		return "ajaxSuccess";
	}
	//删除多项一级二级三级分类
	public String deleteOneList() throws Exception{
		classifyService.deleteOneList(ids);
		inputStream = new ByteArrayInputStream(JSON.toJSONString("success").getBytes("utf-8"));
		return "ajaxSuccess";
	}
	public String deleteTwoList() throws Exception{
		classifyService.deleteTwoList(ids);
		inputStream = new ByteArrayInputStream(JSON.toJSONString("success").getBytes("utf-8"));
		return "ajaxSuccess";
	}
	public String deleteThreeList() throws Exception{
		classifyService.deleteThreeList(ids);
		inputStream = new ByteArrayInputStream(JSON.toJSONString("success").getBytes("utf-8"));
		return "ajaxSuccess";
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public OneClassify getOne() {
		return one;
	}

	public void setOne(OneClassify one) {
		System.out.println(one);
		this.one = one;
	}

	public TwoClassify getTwo() {
		return two;
	}

	public void setTwo(TwoClassify two) {
		this.two = two;
	}

	public ThreeClassify getThree() {
		return three;
	}

	public void setThree(ThreeClassify three) {
		this.three = three;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	
}
