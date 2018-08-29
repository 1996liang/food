package com.anta.person.information.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.anta.user.entity.User;
import com.anta.user.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;

@Component
public class InformationAction extends ActionSupport{
	@Autowired
	private UserService userService;
	private User user;
	private String birthday;
	public String getInformation() throws Exception {
		User u = userService.byIdGetUserInformation(user);
		ValueStack v = ActionContext.getContext().getValueStack();
		v.set("user", u);
		return "redirectPage";
	}

	public String alterUserInformation() throws Exception{
		//将日期转为date类型，并设置进去
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(birthday);
		user.setBirthday(date);
		//执行操作
		userService.alterUserInfo(user);
		Map<String,Object> request = (Map<String, Object>) ActionContext.getContext().get("request");
		request.put("alterUserInfo", "success");
		return "redirectSuccess";
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	
}
