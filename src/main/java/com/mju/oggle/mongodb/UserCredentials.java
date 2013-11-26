package com.mju.oggle.mongodb;

public class UserCredentials extends org.springframework.data.authentication.UserCredentials {

	public UserCredentials(String username, String password) {
		super(username, password);
		// TODO Auto-generated constructor stub
	}

	private String decrypt(String encryptedStr) {
		return encryptedStr;
	}

	@Override
	public String getPassword() {
		return decrypt(super.getPassword());
	}
}