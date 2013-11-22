CREATE DATABASE Oggle;
GRANT ALL ON Oggle.* To 'pooingx2' IDENTIFIED BY 'SSM2013';

CREATE TABLE User (
    email VARCHAR(50) NOT NULL,
	pwd VARCHAR(20) NOT NULL,
    name VARCHAR(20) NOT NULL,
	state VARCHAR(20) NOT NULL,
	nonce VARCHAR(20) NOT NULL,

    PRIMARY KEY (email)
)DEFAULT CHARSET=utf8;

select * from user;

delete from user where email='pooingx2@gmail.com';
