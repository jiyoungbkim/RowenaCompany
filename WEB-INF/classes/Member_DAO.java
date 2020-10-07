package dao;

import java.rmi.RemoteException;
import java.sql.*;
import java.util.ArrayList;
import common.DBConnectionOracle;
import dto.Member_DTO;

public class Member_DAO {
	DBConnectionOracle common = new DBConnectionOracle();
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	// 중복 검사
	public String getCheckcount(String id){
		String query=" select count(*) "+
					" from a20_track2_web_member "+
					" where id='"+id+"'";
		String result = "";
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()){
				result = rs.getString(1);
			}
		} catch (RemoteException me){
			System.out.println("RemoteException getCheckcount(): "+me.getMessage());
		} catch (SQLException se){
			System.out.println("SQLException getCheckcount(): "+se.getMessage());
		} catch (Exception e){
			System.out.println("Exception getCheckcount(): "+e.getMessage());
		} finally {
			try{
				common.close(con, ps, rs);
			}catch(Exception e){
				System.out.println("getCheckcount() close Exception: "+e.getMessage());
			}
		}
		return result;
	}
	//회원가입
	public int insertMember(String query) {
		int result = 0;
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		} catch (RemoteException me){
			System.out.println("RemoteException insertMember(): "+me.getMessage());
		} catch (SQLException se){
			System.out.println("SQLException insertMember(): "+se.getMessage());
		} catch (Exception e){
			System.out.println("Exception insertMember(): "+e.getMessage());
		} finally {
			try{
				common.close(con, ps);
			}catch(Exception e){
				System.out.println("insertMember() close Exception: "+e.getMessage());
			}
		}
		return result;
	}
	
	public int insertMember(String id, String pw, String name, String birth, String area, String address, 
			String telecom, String phone_1, String phone_2, String phone_3, String email_1, String email_2, 
			String att_desk, String att_note, String att_print, String att_beam, String reg_date, String update_date, String status) {
		String query = "insert into a20_track2_web_member(id, pw, name, birth, area, address, telecom, "+
					" phone_1, phone_2, phone_3, email_1, email_2, att_desk, att_note, att_print, att_beam, "+
					" reg_date, update_date, status) "+
					" values('"+id+"','"+pw+"','"+name+"','"+birth+"','"+area+"','"+address+"','"+telecom+"', "+
					" '"+phone_1+"','"+phone_2+"','"+phone_3+"','"+email_1+"','"+email_2+"', "+
					" '"+att_desk+"','"+att_note+"','"+att_print+"','"+att_beam+"','"+reg_date+"','"+update_date+"','y') ";
		System.out.print(query);
		int result = 0;
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		} catch (RemoteException me){
			System.out.println("RemoteException insertMember(): "+me.getMessage());
		} catch (SQLException se){
			System.out.println("SQLException insertMember(): "+se.getMessage());
		} catch (Exception e){
			System.out.println("Exception insertMember(): "+e.getMessage());
		} finally {
			try{
				common.close(con, ps);
			}catch(Exception e){
				System.out.println("insertMember() close Exception: "+e.getMessage());
			}
		}
		return result;
	}
	//로그인
	public String checkLogin(String id, String pw){
		String query="select name from a20_track2_web_member "+
					" where id = '"+id+"' "+
					" and pw = '"+pw+"' "+
					" and status = 'y'";
		String result = null;
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()){
				result = rs.getString(1);
			}
		} catch (RemoteException me){
			System.out.println("RemoteException checkLogin(): "+me.getMessage());
		} catch (SQLException se){
			System.out.println("SQLException checkLogin(): "+se.getMessage());
		} catch (Exception e){
			System.out.println("Exception checkLogin(): "+e.getMessage());
		} finally {
			try{
				common.close(con, ps, rs);
			}catch(Exception e){
				System.out.println("checkLogin() close Exception: "+e.getMessage());
			}
		}
		return result;
	}
	//마이인포 조회
	public Member_DTO getMyinfo(String id) {
		String query =" select id, pw, name, birth, area, address, telecom, phone_1, phone_2, phone_3, "+
				" email_1, email_2, nvl(att_desk,'n'), decode(att_note,null,'n','y'), decode(att_print,null,'n','y'), "+
				" decode(att_beam,null,'n','y'), to_char(reg_date,'yy-MM-dd'), update_date, status "+
				" from a20_track2_web_member "+
				" where id = '"+id+"' ";

    
		Member_DTO member_DTO = null;
		try {
			con = common.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
		while (rs.next()) {
			String id2 = rs.getString(1);
			String pw = rs.getString(2);
			String name = rs.getString(3);
			String birth = rs.getString(4);
			String area = rs.getString(5);
			String address = rs.getString(6);
			String telecom = rs.getString(7);
			String phone_1 = rs.getString(8);
			String phone_2 = rs.getString(9);
			String phone_3 = rs.getString(10);
			String email_1 = rs.getString(11);
			String email_2 = rs.getString(12);
			String att_desk = rs.getString(13);
			String att_note = rs.getString(14);
			String att_print = rs.getString(15);
			String att_beam = rs.getString(16);
			String reg_date = rs.getString(17);
			String update_date = rs.getString(18);
			String status = rs.getString(19);
			
			member_DTO = new Member_DTO(id2, pw, name, birth, area, address, telecom, phone_1, phone_2, phone_3,
							email_1, email_2, att_desk, att_note, att_print, att_beam, reg_date, update_date, status);
			} 
		} catch (RemoteException remoteException) {
			System.out.println(" RemoteException getNewsView(): " + remoteException.getMessage());
		} catch (SQLException sQLException) {
			System.out.println(" SQLException getNewsView(): " + sQLException.getMessage());
		} catch (Exception exception) {
			System.out.println(" error : D_2_DAO.getNewsView() ");
		} finally {
			try {
				common.close(con, ps, rs);
			} catch (Exception exception) {
				System.out.println(" getNewsView close Exception " + exception.getMessage());
			} 
		} 
		return member_DTO;
    }
	//개인정보 업데이트
	public int updateMyinfo(Member_DTO dto) {
		
		String query = " update a20_track2_web_member "+
					" set name = '"+dto.getName()+"', birth = '"+dto.getBirth()+"', area = '"+dto.getArea()+"', address = '"+dto.getAddress()+"', "+
					" telecom = '"+dto.getTelecom()+"', phone_1 = '"+dto.getPhone_1()+"', phone_2 = '"+dto.getPhone_2()+"', phone_3 = '"+dto.getPhone_3()+"', "+
					" email_1 = '"+dto.getEmail_1()+"', email_2 = '"+dto.getEmail_2()+"', "+
					" att_desk = '"+dto.getAtt_desk()+"', att_note = '"+dto.getAtt_note()+"', "+
					" att_print = '"+dto.getAtt_print()+"', att_beam = '"+dto.getAtt_beam()+"', update_date = '"+dto.getUpdate_date()+"' "+
					" where id = '"+dto.getId()+"' ";
				
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
	//회원 탈퇴
	public int deleteMember(String id) {
		
		String query = " update a20_track2_web_member "+
					" set status = 'n' "+
					" where id = '"+id+"' ";
				
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
}
