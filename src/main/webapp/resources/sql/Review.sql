CREATE TABLE IF NOT EXISTS review(
	r_id VARCHAR(10) NOT NULL,
	r_title VARCHAR(20),
	r_category VARCHAR(10),
	r_star VARCHAR(10),
	r_director VARCHAR(20),
	r_description TEXT,
	r_country VARCHAR(10),
	r_releaseDate VARCHAR(20),
	r_condition VARCHAR(10),
	r_filename VARCHAR(20),
	PRIMARY KEY (r_id)
) default CHARSET = utf8;

INSERT INTO review VALUES('1', '마션', 'SF', '3', 'Ridley Scott', 'NASA 아레스3탐사대 팀원 마크 와트니는 화성 탐사 도중, 모래폭풍을 만나 실종된다. 그가 죽었다고 판단한 탐사대는 수색을 포기한 채 화성을 떠난다. 그러나 극적으로 살아남은 마크는 화성에서 홀로 살아남기 위해 고군분투한다.', '국내', '2015/10/08', 'Movie', 'SF1.jpg');

DROP TABLE review;