package com.anta.user.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.anta.user.entity.User;
import com.anta.user.service.UserService;
import com.anta.util.EmailSend;
import com.anta.util.SendPhoneCode;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;

@Component
public class UserAction extends ActionSupport{
	@Autowired
	private UserService userService;
	private User user;
	private String rePassword;
	private String code;
	private InputStream inputStream;
	String msg ;
	
	//email注册
	public String registerEmail() throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		String code = SendPhoneCode.getCode();
		int i = userService.registerEmail(user,code);
		if(i==1){
			session.setAttribute("operate", "emailRegister success");
			return "register_success";
		}else{
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("result", "注册失败，用户已存在");
			return "input";
		}
	}
	//手机注册
	public String registerPhone(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		int i =userService.registerPhone(user);
		if(i==1){
			session.setAttribute("operate", "emailRegister success");
			return "register_success";
		}else{
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("result", "注册失败，用户已存在");
			return "input";
		}
	}
	//发送手机验证码
	public String sendCode(){
		SendPhoneCode sendPhoneCode = new SendPhoneCode();
		String code = sendPhoneCode.send(user.getPhone());
		inputStream = new ByteArrayInputStream(code.getBytes());
		return "ajaxSuccess";
	}
	//用户登录
	public String login(){
		System.out.println(user.getUsername()+"eeeeeeeee"+user.getPassword());
		int code = userService.login(user);
		System.out.println(code+"bbbbbbbbbbb");
		if(code==0){
			msg = "password error";
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("result", "密码错误");
			return "error";
		}else{
			user = userService.getUser(user);
			ActionContext.getContext().getApplication().put("user", user);
			return "success";
		}
	}
	//用户激活
	public String userActivation(){
		int i = userService.isActivationCode(code);
		HttpSession session = ServletActionContext.getRequest().getSession();
		if(i==0){
			session.setAttribute("userActivationOperate", "userActivation fail");
		}else{
			session.setAttribute("userActivationOperate", "userActivation success");
		}
		return "activity_success";
	}
	public String getRePassword() {
		return rePassword;
	}
	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
//	@Override
//	public void validate() {
//		Map request = (Map)ActionContext.getContext().get("request");
//		if(code!=request.get("sendCode")){
//			addFieldError("code", "error.codeError");
//		}
//		super.validate();
//	}
//	
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
}
