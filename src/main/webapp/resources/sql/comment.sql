CREATE TABLE comment (
    c_id INT AUTO_INCREMENT NOT NULL,  -- 댓글 순번 (고유한 식별자)
    r_id VARCHAR(10) NOT NULL,                     -- 리뷰 ID (foreign key로 사용)
    m_id VARCHAR(20) NOT NULL,                     -- 작성자 ID (세션 ID 또는 사용자 ID)
    content TEXT,                         -- 댓글 내용
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 댓글 작성일
    primary key(c_id),
    FOREIGN KEY (r_id) REFERENCES review(r_id) ON DELETE CASCADE,  -- 리뷰와 연결된 외래 키
    FOREIGN KEY (m_id) REFERENCES member(m_id) ON DELETE CASCADE  -- 사용자와 연결된 외래 키
) default CHARSET = utf8;

select * from comment;

drop table comment;