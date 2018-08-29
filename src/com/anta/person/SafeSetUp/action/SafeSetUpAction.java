package com.anta.person.SafeSetUp.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.anta.user.entity.User;
import com.anta.user.service.UserService;
import com.anta.util.SendPhoneCode;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component
public class SafeSetUpAction extends ActionSupport{
	private User user;
	private String rePassword;
	private String oldPassword;
	@Autowired
	private UserService userService;
	private InputStream inputStream;

	//转向安全设置主页面，需要提供三个数据，手机号码，邮箱，评分
	public String redirect(){
		Map<String,Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		User phoneUser = userService.getPhone(user);
		User emailUser = userService.getEmail(user);
		Integer score = userService.getUserSafeScore(user);
		if(phoneUser.getPhone()==null){
			request.put("userPhone", null);
		}else{
			request.put("userPhone", phoneUser.getPhone());
		}
		if(emailUser.getEmail()==null){
			request.put("userEmail", null);
		}else{
			request.put("userEmail", emailUser.getEmail());
		}
		request.put("score", score);
		return "redirectIndex";
	}
	//转向设置密码界面
	public String passwordPage(){
		return "passwordPage";
	}
	//转向设置email界面
	public String emailPage(){
		return "emailPage";
	}
	//转向设置email界面
	public String phonePage(){
			return "phonePage";
	}
	//修改密码
	public String alterPassword(){
		System.out.println(user.getId());
		Integer i = userService.alterPassword(rePassword, oldPassword, user);
		Map<String,Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("passwordOperate", i);
		return "success";
	}
	
	//更改用户手机
	public String alterPhone(){
		userService.alterPhone(user);
		Map<String,Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("phoneOperate", "success");
		return "success";
	}	
	//获取用户手机
	public String getPhone(){
		User dataUser = userService.getPhone(user);
		Map<String,Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		if(dataUser.getPhone()==null){
			request.put("userPhone", null);
		}else{
			request.put("userPhone", dataUser.getPhone());
		}
		return "success";
	}
	//更改用户邮箱
	public String alterEmail(){
		userService.alterEmail(user);
		Map<String,Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("emailOperate", "success");
		return "success";
	}
	//发送手机验证码
	public String sendPhoneCode(){
		SendPhoneCode sendPhoneCode = new SendPhoneCode();
		String code = sendPhoneCode.send(user.getPhone());
		inputStream = new ByteArrayInputStream(code.getBytes());
		return "ajaxSuccess";
	}
	//发送邮箱验证码
	public String sendEmailCode(){
		SendPhoneCode sendPhoneCode = new SendPhoneCode();
		String code = sendPhoneCode.send(user.getPhone());
		inputStream = new ByteArrayInputStream(code.getBytes());
		return "ajaxSuccess";
	}
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getRePassword() {
		return rePassword;
	}

	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
}
