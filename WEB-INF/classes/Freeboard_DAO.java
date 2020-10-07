package dao;

import java.rmi.RemoteException;
import java.sql.*;
import java.util.*;
import common.DBConnectionOracle;
import dto.Freeboard_DTO;
import common.*;

public class Freeboard_DAO {
	DBConnectionOracle common = new DBConnectionOracle();
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public String getMaxNo() {
		String query = " select max(freeboard_no) from a20_track2_web_freeboard ";
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
			System.out.println(" 오류 : D_2_DAO.getMaxNo() ");
		} finally {
			try{
				common.close(con, ps, rs);
			} catch(Exception e) {
				System.out.println(" getMaxNo close Exception "+e.getMessage());
			}
		}
		return result;
	}
	public String getFreeboardNo() {
		String freeboardNo = getMaxNo();
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		
		String nowYear = Integer.toString(year).substring(2,4);
		
		if(freeboardNo == null) {
			freeboardNo = nowYear+"_0001";
		} else {
			String checkYear = freeboardNo.substring(0,2);
			
			int y = 0;
			if(nowYear.equals(checkYear)) {
				y = Integer.parseInt(freeboardNo.substring(3));
				y++;
				String r = CommonUtil.getLPad(Integer.toString(y), 4, "0");
				freeboardNo = checkYear+"_"+r;
			} else {
				freeboardNo = nowYear + "_0001";
			}	
		}
		return freeboardNo;
	}
	//조회수 증가
	public int freeboardHit(String freeboardNo) {
		int result = 0;
		String query=" update a20_track2_web_freeboard "+
					" set hit = hit+1 "+
					" where freeboard_no = '"+freeboardNo+"' ";
					
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		} catch (RemoteException me){
			System.out.println(" RemoteException freeboardHit(): " + me.getMessage());
		} catch (SQLException se){
			System.out.println(" SQLException freeboardHit(): " + se.getMessage());
		} catch (Exception e) {
			System.out.println(" 오류 : D_2_DAO.freeboardHit() ");
		} finally {
			try {
				common.close(con, ps);
			} catch (Exception e) {
				System.out.println(" freeboardHit close Exception " + e.getMessage());
			}
		}
		return result;			
	}
	// 목록 조회
	public ArrayList<Freeboard_DTO> getFreeboardList(String selValue, String txtValue){
		ArrayList<Freeboard_DTO> arrN = new ArrayList<Freeboard_DTO>();
		String query = " select freeboard_no, title, reg_id, to_char(reg_date, 'yyyy-mm-dd'), hit "+
						" from a20_track2_web_freeboard "+
						" where "+selValue+" like '%"+txtValue+"%' "+
						" order by freeboard_no desc ";
		try{
			con = common.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			while(rs.next()){
				String freeboard_no = rs.getString(1);
				String title = rs.getString(2);
				String reg_id = rs.getString(3);
				String reg_date = rs.getString(4);
				int hit = rs.getInt(5);
				
				Freeboard_DTO dto = new Freeboard_DTO(freeboard_no,title,reg_id,reg_date,hit);
				arrN.add(dto);
			}
		} catch(RemoteException me) {
			System.out.println(" RemoteException getFreeboardList(): "+me.getMessage());
		} catch(SQLException se) {
			System.out.println(" SQLException getFreeboardList(): "+se.getMessage());
		} catch(Exception e) {
			System.out.println(" 오류 : D_2_DAO.getFreeboardList() ");
		} finally {
			try{
				common.close(con, ps, rs);
			} catch(Exception e) {
				System.out.println(" getFreeboardList close Exception "+e.getMessage());
			}
		}				
		
		return arrN;
	}
	//게시물 조회
	public Freeboard_DTO getFreeboardView(String freeboardNo){

		String query =" select freeboard_no, pw, title, content, reg_id, to_char(reg_date, 'yyyy-mm-dd'), hit "+
						" from a20_track2_web_freeboard "+
						" where freeboard_no = '"+freeboardNo+"' ";		
		
		Freeboard_DTO dtoF = null;				
		try{
			con = common.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			while(rs.next()){
				String freeboard_no = rs.getString(1);
				String pw = rs.getString(2);
				String title = rs.getString(3);
				String content = rs.getString(4);
				String reg_id = rs.getString(5);
				String reg_date = rs.getString(6);
				int hit = rs.getInt(7);
				
				dtoF = new Freeboard_DTO(freeboard_no,pw,title,content,reg_id,reg_date,hit);
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
		
		return dtoF;
	}
	// 인덱스 조회
	public ArrayList<Freeboard_DTO> getFreeboardIndex(){
		ArrayList<Freeboard_DTO> arrF = new ArrayList<Freeboard_DTO>();
		String query = " select freeboard_no, substr(title, 1,6), substr(content, 1,15), to_char(reg_date, 'yyyy-mm-dd') "+
						" from (select freeboard_no, title, content, reg_date "+
						" from a20_track2_web_freeboard "+
						" order by reg_date desc) "+
						" where rownum <= 5 ";
		try{
			con = common.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			while(rs.next()){
				String freeboard_no = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String reg_date = rs.getString(4);
				
				Freeboard_DTO dto = new Freeboard_DTO(freeboard_no,title,content,reg_date);
				arrF.add(dto);
			}
		} catch(RemoteException me) {
			System.out.println(" RemoteException getFreeboardIndex(): "+me.getMessage());
		} catch(SQLException se) {
			System.out.println(" SQLException getFreeboardIndex(): "+se.getMessage());
		} catch(Exception e) {
			System.out.println(" 오류 : D_2_DAO.getFreeboardIndex() ");
		} finally {
			try{
				common.close(con, ps, rs);
			} catch(Exception e) {
				System.out.println(" getFreeboardIndex close Exception "+e.getMessage());
			}
		}				
		return arrF;
	}
	// 질문 등록 dto
	public int insertFreeboard(Freeboard_DTO dto) {
		
		String query = " insert into a20_track2_web_freeboard "+
					" (freeboard_no,pw,title,content,reg_id,reg_date) "+
					" values ('"+dto.getFreeboard_no()+"','"+dto.getPw()+"','"+dto.getTitle()+"','"+dto.getContent()+"', "+
					" '"+dto.getReg_id()+"','"+dto.getReg_date()+"') ";
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
	// 자유게시판 등록
	public int insertFreeboard(String freeboard_no,String pw,String title,String content,String reg_id,String reg_date) {
		String query = "insert into a20_track2_web_freeboard(freeboard_no, pw, title, content, reg_id, reg_date) "+
					" values ('"+freeboard_no+"','"+pw+"','"+title+"','"+content+"','"+reg_id+"','"+reg_date+"') ";
		int result = 0;
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		} catch (RemoteException me){
			System.out.println(" RemoteException insertNotice(): " + me.getMessage());
		} catch (SQLException se){
			System.out.println(" SQLException insertNotice(): " + se.getMessage());
		} catch (Exception e) {
			System.out.println(" 오류 : D_2_DAO.insertNotice() ");
		} finally {
			try {
				common.close(con, ps);
			} catch (Exception e) {
				System.out.println(" insertNotice close Exception " + e.getMessage());
			}
		}
		return result;
	}
	// 글 수정
	public int updateFreeboard(String freeboard_no,String title,String content,String reg_id,String reg_date) {
		
		String query = " update a20_track2_web_freeboard "+
						" set title = '"+title+"', content = '"+content+"', "+
						" reg_id = '"+reg_id+"', reg_date = '"+reg_date+"' "+
						" where freeboard_no = '"+freeboard_no+"' ";
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
	public int deleteFreeboard(String freeboard_no) {
		
		String query = " delete from a20_track2_web_freeboard "+
						" where freeboard_no = '"+freeboard_no+"' ";
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
}
