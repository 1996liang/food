package com.food.admin.adminUser.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.food.admin.adminUser.entity.AdminUser;
import com.food.admin.adminUser.service.AdminUserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component
public class AdminUserAction extends ActionSupport{
	@Autowired
	AdminUserService userService;
	private AdminUser user;
	//用户登录
	public String login(){
		int code = userService.login(user);
		System.out.println(code);
		if(code==0||code==2){
			return "error";
		}else{
			user = userService.getUser(user);
			System.out.println(user);
			ActionContext.getContext().getApplication().put("adminUser", user);
			return "success";
		}
	}
	//用户退出
	public String logout(){
		ActionContext.getContext().getApplication().clear();
		return "success";
	}
	public AdminUser getUser() {
		return user;
	}
	public void setUser(AdminUser user) {
		this.user = user;
	}
	
}
