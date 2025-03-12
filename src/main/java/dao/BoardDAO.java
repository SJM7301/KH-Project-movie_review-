package dao;

import java.sql.*;
import java.util.*;
import common.*;
import dto.*;

public class BoardDAO {

	private static BoardDAO instance;
	
	private BoardDAO() {
		
	}

	public static BoardDAO getInstance() {
		if (instance == null)
			instance = new BoardDAO();
		return instance;
	}	
	//qna_board 테이블의 레코드 개수
	public int getListCount(String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;

		String sql;
		
		if (items == null && text == null)
			sql = "SELECT count(*) FROM qna_board";
		else
			sql = "SELECT count(*) FROM qna_board where " + items + " like '%" + text + "%'";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) 
				x = rs.getInt(1);
			
		} catch (Exception ex) {
			System.out.println("getListCount() 실행: " + ex);
		} finally {			
			try {				
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();												
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}		
		return x;
	}
	
	//qna_board 테이블의 레코드 가져오기
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int total_record = getListCount(items, text );
		int start = (page - 1) * limit;
		int index = start + 1;

		String sql;

		if (items == null && text == null)
			sql = "select * from qna_board ORDER BY qna_num DESC";
		else
			sql = "SELECT  * FROM qna_board where " + items + " like '%" + text + "%' ORDER BY qna_num DESC ";

		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
	
		try {
			conn = DBConnection.getConnection();
			
			pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = pstmt.executeQuery();
			
			while (rs.absolute(index)) {
				BoardDTO board = new BoardDTO();
				board.setQnaNum(rs.getInt("qna_num"));
				board.setQnaId(rs.getString("qna_id"));
				board.setQnaName(rs.getString("qna_name"));
				board.setQnaTitle(rs.getString("qna_title"));
				board.setQnaContent(rs.getString("qna_content"));
				board.setQnaRegist_day(rs.getString("qna_regist_day"));
				board.setQnaHit(rs.getInt("qna_hit"));
				board.setQnaIp(rs.getString("qna_ip"));
				list.add(board);
				
				if (index < (start + limit) && index <= total_record)
					index++;
				else
					break;
			}
			return list;
		} catch (Exception ex) {
			System.out.println("getBoardList(): " + ex);
		} finally {
			try {
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}			
		}
		return null;
	}
	//member 테이블에서 인증된 id의 사용자명 가져오기
	public String getLoginNameById(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	

		String name=null;
		String sql = "select * from member where qna_id = ? ";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) 
				name = rs.getString("qna_name");	
			
			return name;
		} catch (Exception ex) {
			System.out.println("getBoardByNum(): " + ex);
		} finally {
			try {				
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
		return null;
	}

	//board 테이블에 새로운 글 삽입하기
	public void insertBoard(BoardDTO board)  {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();		

			String sql = "INSERT INTO qna_board values(?, ?, ?, ?, ?, ?, ?, ?)";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getQnaNum());
			pstmt.setString(2, board.getQnaId());
			pstmt.setString(3, board.getQnaName());
			pstmt.setString(4, board.getQnaTitle());
			pstmt.setString(5, board.getQnaContent());
			pstmt.setString(6, board.getQnaRegist_day());
			pstmt.setInt(7, board.getQnaHit());
			pstmt.setString(8, board.getQnaIp());

			int i = pstmt.executeUpdate();
			if(i == 1) {
				System.out.println("입력 성공");
			} else {
				System.out.println("입력 실패");
			}
			
		} catch (Exception ex) {
			System.out.println("insertBoard(): " + ex);
		} finally {
			try {									
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}		
	} 
	//선택된 글의 조회 수 증가시키기
	public void updateHit(int qna_num) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();

			String sql = "select qna_hit from qna_board where qna_num = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qna_num);
			rs = pstmt.executeQuery();
			
			int qna_hit = 0;
			if (rs.next())
				qna_hit = rs.getInt("qna_hit") + 1;
		

			sql = "update qna_board set qna_hit=? where qna_num=?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, qna_hit);
			pstmt.setInt(2, qna_num);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("updateHit(): " + ex);
		} finally {
			try {
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}			
		}
	}
	//선택된 글 상세 내용 가져오기
	public BoardDTO getBoardByNum(int qna_num, int page) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO board = null;

		updateHit(qna_num);
		String sql = "select * from qna_board where qna_num = ? ";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qna_num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				board = new BoardDTO();
				board.setQnaNum(rs.getInt("qna_num"));
				board.setQnaId(rs.getString("qna_id"));
				board.setQnaName(rs.getString("qna_name"));
				board.setQnaTitle(rs.getString("qna_title"));
				board.setQnaContent(rs.getString("qna_content"));
				board.setQnaRegist_day(rs.getString("qna_regist_day"));
				board.setQnaHit(rs.getInt("qna_hit"));
				board.setQnaIp(rs.getString("qna_ip"));
			}
			
			return board;
		} catch (Exception ex) {
			System.out.println("getBoardByNum(): " + ex);
		} finally {
			try {
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
		return null;
	}
	//선택된 글 내용 수정하기
	public void updateBoard(BoardDTO board) {

		Connection conn = null;
		PreparedStatement pstmt = null;
	
		try {
			String sql = "update qna_board set qna_name=?, qna_title=?, qna_content=? where qna_num=?";

			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			conn.setAutoCommit(false);

			pstmt.setString(1, board.getQnaName());
			pstmt.setString(2, board.getQnaTitle());
			pstmt.setString(3, board.getQnaContent());
			pstmt.setInt(4, board.getQnaNum());

			pstmt.executeUpdate();			
			conn.commit();

		} catch (Exception ex) {
			System.out.println("updateBoard(): " + ex);
		} finally {
			try {										
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
	} 
	//선택된 글 삭제하기
	public void deleteBoard(int qna_num) {
		Connection conn = null;
		PreparedStatement pstmt = null;		

		String sql = "delete from qna_board where qna_num=?";	

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qna_num);
			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("deleteBoard(): " + ex);
		} finally {
			try {										
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
	}	
}