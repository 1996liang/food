package com.anta.user.dao;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.anta.dao.BaseDao;
import com.anta.user.entity.User;

@Repository
public class UserDao extends BaseDao{
//	private Session session = getSession();
	//注册
	public void register(User user){
		getSession().save(user);
	}
	//获取用户信息，根据用户名
	public User getUser(User user){
		String hql = "FROM User as u where u.username=:username";
		user= (User) getSession().createQuery(hql).setString("username", user.getUsername()).uniqueResult();
		return user;
	}
	//根据用户ID，获取用户信息
	public User byIdGetUserInformation(User user){
		user = (User) getSession().get(User.class, user.getId());
		return user;
	}
	//修改密码
	public void alterPassword(User user){
		User dataUser = (User) getSession().get(User.class, user.getId());
		dataUser.setPassword(user.getPassword());
	}
	//获取用户手机
	public User getPhone(User user){
		String hql = "FROM User as u WHERE u.id=:id";
		return (User) getSession().createQuery(hql).setInteger("id", user.getId()).uniqueResult();
	}
	//更改用户手机
	public void alterPhone(User user){
		User dataUser = (User) getSession().get(User.class, user.getId());
		dataUser.setPhone(user.getPhone());
	}
	//更改用户邮箱
	public void alterEmail(User user){
		User dataUser = (User) getSession().get(User.class, user.getId());
		dataUser.setEmail(user.getEmail());
	}
	//获取用户邮箱
	public User getEmail(User user){
		String hql = "FROM User as u WHERE u.id=:id";
		return (User) getSession().createQuery(hql).setInteger("id", user.getId()).uniqueResult();
	}
	//修改个人信息
	public void alterUserInfo(User user){
		User u = (User) getSession().get(User.class, user.getId());
		u.setNickName(user.getNickName());
		u.setBirthday(user.getBirthday());
		u.setSex(user.getSex());
	}
	//确定激活码 不存在，返回0，存在返回1
	public int isActivationCode(String activationCode){
		String hql = "FROM User as u WHERE u.activationCode=:activationCode";
		User u = (User) getSession().createQuery(hql).setString("activationCode", activationCode).uniqueResult();
		if(u==null){
			return 0;
		}else{
			u.setStatus(1);
			u.setActivationCode(null);
			return 1;
		}
	}
}
