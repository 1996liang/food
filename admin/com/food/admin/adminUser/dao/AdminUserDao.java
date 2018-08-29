package com.food.admin.adminUser.dao;

import org.springframework.stereotype.Repository;

import com.anta.dao.BaseDao;
import com.anta.user.entity.User;
import com.food.admin.adminUser.entity.AdminUser;

@Repository
public class AdminUserDao extends BaseDao{
	//获取用户信息，根据用户名
	public AdminUser getUser(AdminUser user){
		String hql = "FROM AdminUser as u where u.username=:username";
		user= (AdminUser) getSession().createQuery(hql).setString("username", user.getUsername()).uniqueResult();
		return user;
	}
}
