CREATE TABLE qna_board (
	qna_num int not null AUTO_INCREMENT,
	qna_id varchar(20) not null,
	qna_name varchar(10) not null,
	qna_title varchar(100) not null,
	qna_content TEXT not null,
	qna_regist_day varchar(30),
	qna_hit int,
	qna_ip varchar(20),
	primary key(qna_num)
) default CHARSET=utf8;


DROP TABLE qna_board;