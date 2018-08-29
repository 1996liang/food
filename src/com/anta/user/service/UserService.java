package com.anta.user.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anta.user.dao.UserDao;
import com.anta.user.entity.User;
import com.anta.util.EmailSend;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	//注册
	public int registerEmail(User user,String code){
		if(getUser(user)==null){
			user.setRegisterTime(new Date());
			user.setActivationCode(code);
			user.setStatus(0);
			EmailSend.sendMail(user.getEmail(),code);
			userDao.register(user);
			return 1;
		}else{
			return 0;
		}
	}
	//注册
	public int registerPhone(User user){
			if(getUser(user)!=null){
				user.setRegisterTime(new Date());
				userDao.register(user);
				user.setStatus(1);
				return 1;
			}else{
				return 0;
			}
		}
	//0密码错误 1登录成功 2未知错误
	public int login(User user){
		User dataUser = userDao.getUser(user);
		if(user.getPassword().equals(dataUser.getPassword())){
			return 1;
		}else{
			return 0;
		}
	}
	//激活用户  确定激活码 不存在，返回0，存在返回1
	public int isActivationCode(String code){
		return userDao.isActivationCode(code);
	}
	//修改个人信息
	public void alterUserInfo(User user){
		userDao.alterUserInfo(user);
	}
	//获取用户信息，根据用户名
	public User getUser(User user){
		user =  userDao.getUser(user);
		return user;
	}
	//根据用户ID，获取用户信息
	public User byIdGetUserInformation(User user){
		return userDao.byIdGetUserInformation(user);
	}
	//修改密码,如果是1，旧密码错误，2新密码和确认密码不一致 3修改成功
	public Integer alterPassword(String rePassword,String oldPassword,User user){
		String newPassword = user.getPassword();
		System.out.println(oldPassword);
		if(byIdGetUserInformation(user).getPassword().equals(oldPassword)){
			if(rePassword.equals(newPassword)){
				userDao.alterPassword(user);
				return 3;
			}else{
				return 2;
			}
		}else{
			return 1;
		}
	}
	//获取用户手机
	public User getPhone(User user){
		User dataUser = new User();
		String phone = userDao.getPhone(user).getPhone();
		if(phone==null){
			dataUser.setPhone(null);
		}else{
			dataUser.setPhone(phone);
		}
		
		return dataUser;
	}
	//更改用户手机
	public void alterPhone(User user){
		userDao.alterPhone(user);
	}
	//更改用户邮箱
	public void alterEmail(User user){
		userDao.alterEmail(user);
	}
	//获取邮箱
	public User getEmail(User user){
		User dataUser = new User();
		String email = userDao.getEmail(user).getEmail();
		if(email==null){
			dataUser.setEmail(null);
		}else{
			dataUser.setEmail(email);
		}
		
		return dataUser;
	}
	//确定账户安全评分，五项满分，一项20分。不用检测密码，必须有密码，所以最低20分
	public Integer getUserSafeScore(User user){
		Integer score = 20;
		if(getEmail(user).getEmail()!=null){
			score+=20;
		}
		if(getPhone(user).getPhone()!=null){
			score+=20;
		}
		return score;
	}
}
