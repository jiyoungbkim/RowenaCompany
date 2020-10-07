package dao;

import java.rmi.RemoteException;
import java.sql.*;
import java.util.*;
import common.DBConnectionOracle;
import dto.QandA_DTO;
import common.*;

public class QandA_DAO {
	DBConnectionOracle common = new DBConnectionOracle();
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public String getMaxNo() {
		String query = " select max(qanda_no) from track2_1조_web_qanda ";
		String result = "";
		try{
			con = common.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			while(rs.next()){
				result = rs.getString(1);
			}
		} catch(RemoteException me) {
			System.out.println(" RemoteException getMaxNo(): "+me.getMessage());
		} catch(SQLException se) {
			System.out.println(" SQLException getMaxNo(): "+se.getMessage());
		} catch(Exception e) {
			System.out.println(" error : getMaxNo() ");
		} finally {
			try{
				common.close(con, ps, rs);
			} catch(Exception e) {
				System.out.println(" getMaxNo close Exception "+e.getMessage());
			}
		}
		return result;
	}
	public String getQandaNo() {
		String qandaNo = getMaxNo();
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		
		String nowYear = Integer.toString(year).substring(2,4);
		
		if(qandaNo == null) {
			qandaNo = nowYear+"_0001";
		} else {
			String checkYear = qandaNo.substring(0,2);
			
			int y = 0;
			if(nowYear.equals(checkYear)) {
				y = Integer.parseInt(qandaNo.substring(3));
				y++;
				String r = CommonUtil.getLPad(Integer.toString(y), 4, "0");
				qandaNo = checkYear+"_"+r;
			} else {
				qandaNo = nowYear + "_0001";
			}	
		}
		return qandaNo;
	}
	// 공지사항 등록
	public int insertQanda(String qanda_no,String title,String question,String user_id,String reg_date_q, String secret) {
		String query = "insert into track2_1조_web_qanda(qanda_no, title, question, user_id, "+
					" reg_date_q, secret) "+
					" values ('"+qanda_no+"','"+title+"','"+question+"','"+user_id+"','"+reg_date_q+"','"+secret+"') ";
		int result = 0;
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		} catch (RemoteException me){
			System.out.println(" RemoteException insertQanda(): " + me.getMessage());
		} catch (SQLException se){
			System.out.println(" SQLException insertQanda(): " + se.getMessage());
		} catch (Exception e) {
			System.out.println(" 오류 : D_2_DAO.insertQanda() ");
		} finally {
			try {
				common.close(con, ps);
			} catch (Exception e) {
				System.out.println(" insertQanda close Exception " + e.getMessage());
			}
		}
		return result;
	}
	// 질문 등록 dto
	public int insertQanda(QandA_DTO dto) {
		
		String query = "insert into track2_1조_web_qanda(qanda_no, title, question, user_id, "+
					" reg_date_q,  secret) "+
					" values ('"+dto.getQanda_no()+"','"+dto.getTitle()+"','"+dto.getQuestion()+"', "+
					" '"+dto.getUser_id()+"','"+dto.getReg_date_q()+"','"+dto.getSecret()+"') ";
		int result = 0;
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
			
		} catch (RemoteException me){
			System.out.println(" RemoteException insertQanda(): " + me.getMessage());
		} catch (SQLException se){
			System.out.println(" SQLException insertQanda(): " + se.getMessage());
		} catch (Exception e) {
			System.out.println(" 오류 : D_2_DAO.insertQanda() ");
		} finally {
			try {
				common.close(con, ps);
			} catch (Exception e) {
				System.out.println(" insertQanda close Exception " + e.getMessage());
			}
		}
		return result;
	}
	// 글 수정 저장
	public int updateQanda(String qanda_no, String title, String question, String reg_date_q, String secret) {
			
		String query = " update track2_1조_web_qanda "+
						" set title = '"+title+"', question = '"+question+"', "+
						" reg_date_q = '"+reg_date_q+"', secret = '"+secret+"' "+
						" where qanda_no = '"+qanda_no+"' ";
		int result = 0;
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
			
		} catch (RemoteException me){
			System.out.println(" RemoteException updateNotice(): " + me.getMessage());
		} catch (SQLException se){
			System.out.println(" SQLException updateNotice(): " + se.getMessage());
		} catch (Exception e) {
			System.out.println(" 오류 : D_2_DAO.updateNotice() ");
		} finally {
			try {
				common.close(con, ps);
			} catch (Exception e) {
				System.out.println(" updateNotice close Exception " + e.getMessage());
			}
		}
		return result;
	}
	// 답변등록
	public int updateAnswer(String qanda_no, String answer, String reg_date_q, String status) {
			
		String query = " update track2_1조_web_qanda "+
						" set answer = '"+answer+"',reg_date_q = '"+reg_date_q+"', status = '"+status+"' "+
						" where qanda_no = '"+qanda_no+"' ";
		int result = 0;
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
			
		} catch (RemoteException me){
			System.out.println(" RemoteException updateNotice(): " + me.getMessage());
		} catch (SQLException se){
			System.out.println(" SQLException updateNotice(): " + se.getMessage());
		} catch (Exception e) {
			System.out.println(" 오류 : D_2_DAO.updateNotice() ");
		} finally {
			try {
				common.close(con, ps);
			} catch (Exception e) {
				System.out.println(" updateNotice close Exception " + e.getMessage());
			}
		}
		return result;
	}
	// 답변 삭제
	public int deleteAnswer(String qanda_no, String answer, String reg_date_a, String status) {
			
		String query = " update track2_1조_web_qanda "+
						" set answer = '', reg_date_a = '"+reg_date_a+"', status = '"+status+"' "+
						" where qanda_no = '"+qanda_no+"' ";
		int result = 0;
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
			
		} catch (RemoteException me){
			System.out.println(" RemoteException updateNotice(): " + me.getMessage());
		} catch (SQLException se){
			System.out.println(" SQLException updateNotice(): " + se.getMessage());
		} catch (Exception e) {
			System.out.println(" 오류 : D_2_DAO.updateNotice() ");
		} finally {
			try {
				common.close(con, ps);
			} catch (Exception e) {
				System.out.println(" updateNotice close Exception " + e.getMessage());
			}
		}
		return result;
	}
	
	// 글 삭제
	public int deleteQanda(String qanda_no) {
		
		String query = " delete from track2_1조_web_qanda "+
						" where qanda_no = '"+qanda_no+"' ";
		int result = 0;
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
			
		} catch (RemoteException me){
			System.out.println(" RemoteException deleteQanda(): " + me.getMessage());
		} catch (SQLException se){
			System.out.println(" SQLException deleteQanda(): " + se.getMessage());
		} catch (Exception e) {
			System.out.println(" 오류 : D_2_DAO.deleteQanda() ");
		} finally {
			try {
				common.close(con, ps);
			} catch (Exception e) {
				System.out.println(" deleteQanda close Exception " + e.getMessage());
			}
		}
		return result;
	}
	// 목록 조회
	public ArrayList<QandA_DTO> getQandaList_pre(String selValue, String txtValue){
		ArrayList<QandA_DTO> arrQ = new ArrayList<QandA_DTO>();
		String query = " select QANDA_NO, TITLE, QUESTION, ANSWER, USER_ID, "+
					" to_char(REG_DATE_Q,'yyyy-mm-dd'), to_char(REG_DATE_A,'yyyy-mm-dd'), "+
					" decode(STATUS,'n','[답변대기]','[답변완료]'), decode(SECRET,'n','[공개]','[비공개]'), m.name, HIT "+
					" from track2_1조_web_qanda "+
					" where "+selValue+" like '%"+txtValue+"%' "+
					" order by qanda_no desc ";
		try{
			con = common.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			while(rs.next()){
				String qanda_no = rs.getString(1);
				String title = rs.getString(2);
				String question = rs.getString(3);
				String answer = rs.getString(4);
				String user_id = rs.getString(5);
				String reg_date_q = rs.getString(6);
				String reg_date_a = rs.getString(7);
				String status = rs.getString(8);
				String secret = rs.getString(9);
				String name = rs.getString(10);
				int hit = rs.getInt(11);
				
				QandA_DTO dto = new QandA_DTO(qanda_no,title,question,answer,user_id,reg_date_q,reg_date_a,status,secret,name,hit);
				arrQ.add(dto);
			}
		} catch(RemoteException me) {
			System.out.println(" RemoteException getNoticeList(): "+me.getMessage());
		} catch(SQLException se) {
			System.out.println(" SQLException getNoticeList(): "+se.getMessage());
		} catch(Exception e) {
			System.out.println(" 오류 : D_2_DAO.getNoticeList() ");
		} finally {
			try{
				common.close(con, ps, rs);
			} catch(Exception e) {
				System.out.println(" getNoticeList close Exception "+e.getMessage());
			}
		}				
		
		return arrQ;
	}
	// 목록 조회 id
	public ArrayList<QandA_DTO> getQandaList(String selValue, String txtValue){
		ArrayList<QandA_DTO> arrQ = new ArrayList<QandA_DTO>();
		String query = 
					" select q.QANDA_NO, q.TITLE, q.QUESTION, q.ANSWER, q.user_id, "+
					" to_char(q.REG_DATE_Q,'yyyy-mm-dd'), to_char(q.REG_DATE_A,'yyyy-mm-dd'), "+
					" decode(q.STATUS,'n','[답변대기]','[답변완료]'), decode(q.SECRET,'n','[공개]','[비공개]'), m.name, q.HIT "+
					" from track2_1조_web_qanda q, a20_track2_web_member m "+
					" where q.user_id = m.id "+
					" and "+selValue+" like '%"+txtValue+"%' "+
					" order by q.qanda_no desc ";
		System.out.print(query);
		try{
			con = common.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			while(rs.next()){
				String qanda_no = rs.getString(1);
				String title = rs.getString(2);
				String question = rs.getString(3);
				String answer = rs.getString(4);
				String user_id = rs.getString(5);
				String reg_date_q = rs.getString(6);
				String reg_date_a = rs.getString(7);
				String status = rs.getString(8);
				String secret = rs.getString(9);
				String name = rs.getString(10);
				int hit = rs.getInt(11);
				
				QandA_DTO dto = new QandA_DTO(qanda_no,title,question,answer,user_id,reg_date_q,reg_date_a,status,secret,name,hit);
				arrQ.add(dto);
			}
		} catch(RemoteException me) {
			System.out.println(" RemoteException getQandaList(): "+me.getMessage());
		} catch(SQLException se) {
			System.out.println(" SQLException getQandaList(): "+se.getMessage());
		} catch(Exception e) {
			System.out.println(" 오류 : D_2_DAO.getQandaList() ");
		} finally {
			try{
				common.close(con, ps, rs);
			} catch(Exception e) {
				System.out.println(" getQandaList close Exception "+e.getMessage());
			}
		}				
		
		return arrQ;
	}
	//게시물 조회
	public QandA_DTO getQandaView(String qandaNo){

		String query =" select q.QANDA_NO, q.TITLE, q.QUESTION, q.ANSWER, m.name, "+
					" to_char(q.REG_DATE_Q,'yyyy-mm-dd'), to_char(q.REG_DATE_A,'yyyy-mm-dd'), "+
					" decode(q.STATUS,'n','[답변대기]','[답변완료]'), q.SECRET, m.name, q.HIT "+
					" from track2_1조_web_qanda q, a20_track2_web_member m "+
					" where q.user_id = m.id "+
					" and q.qanda_no ='"+qandaNo+"' ";		
		
		QandA_DTO dtoQ = null;				
		try{
			con = common.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			while(rs.next()){
				String qanda_no = rs.getString(1);
				String title = rs.getString(2);
				String question = rs.getString(3);
				String answer = rs.getString(4);
				String user_id = rs.getString(5);
				String reg_date_q = rs.getString(6);
				String reg_date_a = rs.getString(7);
				String status = rs.getString(8);
				String secret = rs.getString(9);
				String name = rs.getString(10);
				int hit = rs.getInt(11);
				
				dtoQ = new QandA_DTO(qanda_no,title,question,answer,user_id,reg_date_q,reg_date_a,status,secret,name,hit);
			}
		} catch(RemoteException me) {
			System.out.println(" RemoteException getQandaView(): "+me.getMessage());
		} catch(SQLException se) {
			System.out.println(" SQLException getQandaView(): "+se.getMessage());
		} catch(Exception e) {
			System.out.println(" 오류 : D_2_DAO.getQandaView() ");
		} finally {
			try{
				common.close(con, ps, rs);
			} catch(Exception e) {
				System.out.println(" getNoticeView close Exception "+e.getMessage());
			}
		}				
		
		return dtoQ;
	}
	// 인덱스 조회
	public ArrayList<QandA_DTO> getQandaIndex(){
		ArrayList<QandA_DTO> arrQ = new ArrayList<QandA_DTO>();
		String query = " select qanda_no, substr(title, 1,6), substr(question, 1,15), to_char(reg_date_q, 'yyyy-mm-dd') "+
						" from (select qanda_no, title, question, reg_date_q "+
						" from track2_1조_web_qanda "+
						" order by reg_date_q desc) "+
						" where rownum <= 5 ";
		try{
			con = common.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			while(rs.next()){
				String qanda_no = rs.getString(1);
				String title = rs.getString(2);
				String question = rs.getString(3);
				String reg_date_q = rs.getString(4);
				
				QandA_DTO dto = new QandA_DTO(qanda_no,title,question,reg_date_q);
				arrQ.add(dto);
			}
		} catch(RemoteException me) {
			System.out.println(" RemoteException getQandaIndex(): "+me.getMessage());
		} catch(SQLException se) {
			System.out.println(" SQLException getQandaIndex(): "+se.getMessage());
		} catch(Exception e) {
			System.out.println(" 오류 : D_2_DAO.getQandaIndex() ");
		} finally {
			try{
				common.close(con, ps, rs);
			} catch(Exception e) {
				System.out.println(" getQandaIndex close Exception "+e.getMessage());
			}
		}				
		
		return arrQ;
	}
	//조회수 증가
	public int qandaHit(String qandaNo) {
		int result = 0;
		String query=" update track2_1조_web_qanda "+
					" set hit = hit+1 "+
					" where qanda_no = '"+qandaNo+"' ";
					
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		} catch (RemoteException me){
			System.out.println(" RemoteException qandaHit(): " + me.getMessage());
		} catch (SQLException se){
			System.out.println(" SQLException qandaHit(): " + se.getMessage());
		} catch (Exception e) {
			System.out.println(" 오류 : D_2_DAO.qandaHit() ");
		} finally {
			try {
				common.close(con, ps);
			} catch (Exception e) {
				System.out.println(" qandaHit close Exception " + e.getMessage());
			}
		}
		return result;			
	}
}
