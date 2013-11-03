package com.oggle.mapper;

import com.oggle.bean.User;

public interface UserMapper {
	void insertUser(User user);
	void changeUserState(String uid);
	User selectUser(String uid);
}