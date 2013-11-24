package com.mju.oggle.mapper;

import com.mju.oggle.model.User;

public interface UserMapper {
	void insertUser(User user);
	void changeUserState(String email);
	User selectUser(String email);
	void updateUser(User user);
}