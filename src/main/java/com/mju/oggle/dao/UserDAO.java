package com.mju.oggle.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


import com.mju.oggle.dbconfig.SqlSessionManager;
import com.mju.oggle.mapper.UserMapper;
import com.mju.oggle.model.User;


public class UserDAO {
	public static SqlSessionFactory sqlSessionFactory = SqlSessionManager.getInstance();
	
	public void insertUser(User user){
		
		if(selectUser(user.getUid())!=null) return;
		
		SqlSession session = sqlSessionFactory.openSession();
			
		try{
			UserMapper mapper = session.getMapper(UserMapper.class);
			mapper.insertUser(user);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
	}
	
	public User selectUser(String uid){
		SqlSession session = sqlSessionFactory.openSession();
		User user = null;
		try{
			UserMapper mapper = session.getMapper(UserMapper.class);
			user = mapper.selectUser(uid);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}

		return user;
	}
	
    public List<User> getUserList() {  
         List<User> list = new ArrayList<User>();
 
         SqlSession session = sqlSessionFactory.openSession();
         try {
              list = session.selectList("com.cheese.mapper.UserMapper.getUserList");     
         } catch (Exception e){
              e.printStackTrace();
         } finally {
              session.close();
         }  
         return list;
    }  
	

	public void changeUserState(String uid){
		SqlSession session = sqlSessionFactory.openSession();
		try{
			UserMapper mapper = session.getMapper(UserMapper.class);
			mapper.changeUserState(uid);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
	}

	/*
	public List<User> getUserList(){	
		SqlSession session = sqlSessionFactory.openSession();
		List<User> list=null;
		
		try{
			UserMapper mapper = session.getMapper(UserMapper.class);
			list = mapper.selectAllUser();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}

	*/
}
