package com.anta.util;


import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.anta.user.entity.User;
import com.food.admin.adminUser.entity.AdminUser;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
@Component
public class AdminInterceptor extends MethodFilterInterceptor{

	@Override
	protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
		AdminUser u = (AdminUser) ServletActionContext.getContext().getApplication().get("adminUser");
		if(u!=null){
			return actionInvocation.invoke();
		}else{
			ActionSupport support = (ActionSupport) actionInvocation.getAction();
			support.addActionError("您还没有登录!没有权限访问!");
			return ActionSupport.LOGIN;
		}
	}

}