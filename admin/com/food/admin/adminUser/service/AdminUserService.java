package com.food.admin.adminUser.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anta.user.entity.User;
import com.food.admin.adminUser.dao.AdminUserDao;
import com.food.admin.adminUser.entity.AdminUser;

@Service
public class AdminUserService {
	@Autowired
		private AdminUserDao adminUserDao;
	//0密码错误 1登录成功 2用户名不存在
		public int login(AdminUser user){
			AdminUser dataUser = getUser(user);
			if(dataUser!=null){
				if(user.getPassword().equals(dataUser.getPassword())){
					return 1;
				}else{
					return 0;
				}
			}else{
				return 2;
			}
		}
		//获取用户信息，根据用户名
		public AdminUser getUser(AdminUser user){
			user =  adminUserDao.getUser(user);
			return user;
		}
}
