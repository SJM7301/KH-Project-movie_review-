CREATE TABLE member (
	m_id varchar(20) not null,
	m_password varchar(20) not null,
	m_name varchar(10) not null,
	m_mail  varchar(30) not null,
	m_regist_day varchar(50),
	primary key(m_id)
) default CHARSET=utf8;

INSERT INTO member VALUES('admin', 'admin1234', '관리자', 'admin@naver.com', '2025/03/10');

select * from member;

desc member;

DROP TABLE member;