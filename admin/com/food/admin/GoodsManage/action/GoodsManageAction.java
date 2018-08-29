package com.food.admin.GoodsManage.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.anta.classify.entity.ThreeClassify;
import com.anta.classify.service.ShopClassifyService;
import com.anta.goods.entity.Goods;
import com.anta.goods.service.GoodsService;
import com.anta.goodsLabel.entity.GoodsLabel;
import com.anta.goodsLabel.service.GoodsLabelService;
import com.anta.options.entity.GoodsOptions;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
@Component
public class GoodsManageAction extends ActionSupport{
	//用于分页
	private Integer page=1;
	private Integer maxResult=10;
	//用于上架和下架
	private Integer id;
	private Integer status;
	//用于批量删除,或者删除图片下标值
	private String ids;
	//用于判断删除的图片是详情的还是封面的
	private String source;
	private Goods goods;
	
	private String labelStr;
	private String optionStr;
	@Autowired
	GoodsService goodsService;
	@Autowired
	ShopClassifyService shopClassifyService;
	@Autowired
	GoodsLabelService goodsLabelService;
	private InputStream inputStream;
	private ObjectMapper objectMapper = new ObjectMapper();
	public String getGoodsList(){
		
		System.out.println(page);
		System.out.println(maxResult);
		List<Goods> l = goodsService.getGoodsList(page, maxResult);
		Integer count = goodsService.getGoodsCount();
		Map<String, Object> m = (Map<String, Object>) ActionContext
				.getContext().get("request");
		m.put("goodsList", l);
		m.put("page", page);
		m.put("maxResult", maxResult);
		m.put("count", count);
		return "goodsList";
	}
	//将商品上,下架
	public String stopGoods() throws Exception{
		goodsService.stopGoods(id, status);
		inputStream = new ByteArrayInputStream(JSON.toJSONString("success").getBytes("utf-8"));
		return "ajaxSuccess";
	}
	//删除商品
	public String deleteGoods() throws Exception{
		System.out.println(id);
		goodsService.deleteGoods(id);
		inputStream = new ByteArrayInputStream(JSON.toJSONString("success").getBytes("utf-8"));
		return "ajaxSuccess";
	}
	//批量删除商品
	public String deleteGoodsList()throws Exception{
		goodsService.deleteGoodsList(ids);
		inputStream = new ByteArrayInputStream(JSON.toJSONString("success").getBytes("utf-8"));
		return "ajaxSuccess";
	}
	//显示商品图片
	public String pictureShow(){
		System.out.println(id+"id");
		Goods g = goodsService.getGoodsmsgStatus0(new Goods(id));
		Map<String, Object> m = (Map<String, Object>) ActionContext
				.getContext().get("request");
		System.out.println(g.getImagesArray());
		m.put("picture", g.getImagesArray());
		m.put("pictureLength", g.getImagesArray().length);
		m.put("goodsId", g.getId());
		m.put("source", "cover");
		return "pictureShow";
	}
	//显示商品详情
	public String pictureDescShow(){
		System.out.println(id+"id");
		Goods g = goodsService.getGoodsmsgStatus0(new Goods(id));
		Map<String, Object> m = (Map<String, Object>) ActionContext
				.getContext().get("request");
		m.put("picture", g.getDescribeImageArray());
		m.put("pictureLength", g.getDescribeImageArray().length);
		m.put("goodsId", g.getId());
		m.put("source", "desc");
		return "pictureShow";
	}
	//批量删除商品图片或商品详情
	public String deletePictureList()throws Exception{
		goodsService.deletePictureList(ids, id,source);
		inputStream = new ByteArrayInputStream(JSON.toJSONString("success").getBytes("utf-8"));
		return "ajaxSuccess";
	}
	//转到添加商品页面
	public String addGoodsPage(){
		List<ThreeClassify> l =shopClassifyService.getThreeClassifyList();
		Map<String, Object> m = (Map<String, Object>) ActionContext
				.getContext().get("request");
		m.put("threeClassify", l);
		return "addGoods";
	}
	//添加商品
	public String addGoods()throws Exception{
		goods.setThreeClassify(new ThreeClassify(id));
		String s = (String) ActionContext.getContext().getSession().get("pathNames");
		goods.setImages(s);
		goodsService.addGoods(goods);
		inputStream = new ByteArrayInputStream(JSON.toJSONString("success").getBytes("utf-8"));
		return "ajaxSuccess";
	}
	//获取商品标签
	public String getGoodsLabel() throws Exception{
		ThreeClassify t = new ThreeClassify(id);
		List<GoodsLabel> l = goodsLabelService.getThreeClassifyGoodsLabels(t);
		String[] msg = new String[l.size()];
		for(int i=0;i<l.size();i++){
			msg[i]= "{\"id\":"+l.get(i).getId()+",\"labelName\":\""+l.get(i).getLabelName()+"\",\"superGoodsNameName\":\""+l.get(i).getSuperGoodsName().getLabelName()
					+"\",\"superGoodsNameId\":"+l.get(i).getSuperGoodsName().getId()+"}";
		}
		inputStream = new ByteArrayInputStream(JSON.toJSONString(msg).getBytes("utf-8"));
		return "ajaxSuccess";
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getMaxResult() {
		return maxResult;
	}
	public void setMaxResult(Integer maxResult) {
		this.maxResult = maxResult;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
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
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public String getLabelStr() {
		return labelStr;
	}
	public void setLabelStr(String labelStr) {
		String[] labels = labelStr.split("]");
		Set<GoodsLabel> labelSet = new HashSet<GoodsLabel>();
		for(String labelNameAndValue:labels){
			String[] nameAndValues = labelNameAndValue.split(":");
			GoodsLabel g = new GoodsLabel();
			//标签名跟id   0是id   1是名
			String[] nameAndID = nameAndValues[0].split("/");
			GoodsLabel superGoodsName = new GoodsLabel();
			superGoodsName.setId(Integer.parseInt(nameAndID[0]));
			superGoodsName.setLabelName(nameAndID[1]);
			g.setSuperGoodsName(superGoodsName);
			//标签值跟id  	 0是ID   1是值
			String[] valueAndID = nameAndValues[1].split("/");
			g.setId(Integer.parseInt(valueAndID[0]));
			g.setLabelName(valueAndID[1]);
			labelSet.add(g);
		}
		this.goods.setGoodsLabels(labelSet);
	}
	public String getOptionStr() {
		return optionStr;
	}
	public void setOptionStr(String optionStr) {
		String[] options = optionStr.split("]");
		Set<GoodsOptions> OptionSet = new HashSet<GoodsOptions>();
		for(String optionNameAndValue:options){
			String[] nameAndValues = optionNameAndValue.split(":");
			//选项名
			String name = nameAndValues[0];
			GoodsOptions goodsOptions = new GoodsOptions();
			goodsOptions.setName(name);
			
			String[] values = nameAndValues[1].split(",");
			for(String value :values){
				GoodsOptions g = new GoodsOptions();
				//选项值
				g.setGoodsOptions(goodsOptions);
				g.setName(value);
				OptionSet.add(g);
			}
		}
		this.goods.setGoodsOptions(OptionSet);
	}
	
}
