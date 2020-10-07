package dao;

import java.rmi.RemoteException;
import java.sql.*;
import java.util.*;
import common.DBConnectionOracle;
import dto.Member_DTO;
import common.*;

public class Mmember_DAO {
	DBConnectionOracle common = new DBConnectionOracle();
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	// 전체 회원
	public int getMemberCount(){
		String query = " select count(*) from a20_track2_web_member ";
		int result = 0;
		try{
			con = common.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			while(rs.next()){
				result = rs.getInt(1);
			}
		} catch(RemoteException me) {
			System.out.println(" RemoteException getMemberCount(): "+me.getMessage());
		} catch(SQLException se) {
			System.out.println(" SQLException getMemberCount(): "+se.getMessage());
		} catch(Exception e) {
			System.out.println(" 오류 : D_2_DAO.getMemberCount() ");
		} finally {
			try{
				common.close(con, ps, rs);
			} catch(Exception e) {
				System.out.println(" getMemberCount close Exception "+e.getMessage());
			}
		}				
		return result;
	}

	// 목록 조회
	public ArrayList<Member_DTO> getMemberList(String selValue, String txtValue, String areaValue, String checkValue){
		ArrayList<Member_DTO> arrM = new ArrayList<Member_DTO>();
		String query ="";
		query = " select id, name, phone_1, phone_2, phone_3, email_1, email_2, "+
					" area, to_char(reg_date, 'yyyy-mm-dd'), decode(status,'n','탈퇴','-') "+
					" from a20_track2_web_member ";
					
		if(selValue.equals("id")||selValue.equals("name")) {
			query += " where "+selValue+" like '%"+txtValue+"%' ";
						
			
			if(!areaValue.equals("all")) {
				query += " and area like '%"+areaValue+"%' "+
						" order by "+checkValue+" ";
			}
		} else {
			query += " where area like '%"+areaValue+"%' "+
					" order by "+checkValue+" ";	
					
		}
		try{
			con = common.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			while(rs.next()){
				String id 		= rs.getString(1);
				String name 	= rs.getString(2);
				String phone_1  = rs.getString(3);
				String phone_2  = rs.getString(4);
				String phone_3  = rs.getString(5);
				String email_1  = rs.getString(6);
				String email_2  = rs.getString(7);
				String area 	= rs.getString(8);
				String reg_date = rs.getString(9);
				String status   = rs.getString(10);
				
				Member_DTO dto = new Member_DTO(id, name, phone_1, phone_2, phone_3, email_1, email_2, area, reg_date, status);
				arrM.add(dto);
				
			}
		} catch(RemoteException me) {
			System.out.println(" RemoteException getMemberList(): "+me.getMessage());
		} catch(SQLException se) {
			System.out.println(" SQLException getMemberList(): "+se.getMessage());
		} catch(Exception e) {
			System.out.println(" 오류 : D_2_DAO.getMemberList() ");
		} finally {
			try{
				common.close(con, ps, rs);
			} catch(Exception e) {
				System.out.println(" getMemberList close Exception "+e.getMessage());
			}
		}				
		
		return arrM;
	}
	
	// public Member_DTO getMyinfo(String id) {
		// String query =" select id, pw, name, birth, area, address, telecom, phone_1, phone_2, phone_3, "+
				// " email_1, email_2, nvl(att_desk,'n'), decode(att_note,null,'n','y'), decode(att_print,null,'n','y'), "+
				// " decode(att_beam,null,'n','y'), to_char(reg_date,'yy-MM-dd') "+
				// " from a20_track2_web_member "+
				// " where id = '"+id+"' ";    
		// Member_DTO member_DTO = null;
		// try {
			// con = common.getConnection();
			// ps = con.prepareStatement(query);
			// rs = ps.executeQuery();
		// while (rs.next()) {
			// String id2 = rs.getString(1);
			// String pw = rs.getString(2);
			// String name = rs.getString(3);
			// String birth = rs.getString(4);
			// String area = rs.getString(5);
			// String address = rs.getString(6);
			// String telecom = rs.getString(7);
			// String phone_1 = rs.getString(8);
			// String phone_2 = rs.getString(9);
			// String phone_3 = rs.getString(10);
			// String email_1 = rs.getString(11);
			// String email_2 = rs.getString(12);
			// String att_desk = rs.getString(13);
			// String att_note = rs.getString(14);
			// String att_print = rs.getString(15);
			// String att_beam = rs.getString(16);
			// String reg_date = rs.getString(17);					
			// member_DTO = new Member_DTO(id2, pw, name, birth, area, address, telecom, phone_1, phone_2, phone_3,
										// email_1, email_2, att_desk, att_note, att_print, att_beam, reg_date, "", "");
			// } 
		// } catch (RemoteException remoteException) {
			// System.out.println(" RemoteException getMyinfo(): " + remoteException.getMessage());
		// } catch (SQLException sQLException) {
			// System.out.println(" SQLException getMyinfo(): " + sQLException.getMessage());
		// } catch (Exception exception) {
			// System.out.println(" error : D_2_DAO.getMyinfo() ");
		// } finally {
			// try {
				// common.close(con, ps, rs);
			// } catch (Exception exception) {
				// System.out.println(" getMyinfo close Exception " + exception.getMessage());
			// } 
		// } 
		// return member_DTO;
    // }	
	
	//게시물 조회
	public Member_DTO getMemberinfo(String id){
		String query =  " select id, pw, name, birth, area, address, telecom, phone_1, phone_2, phone_3, email_1, email_2, "+
						" nvl(att_desk,'n'), decode(att_note,null,'n','y'), decode(att_print,null,'n','y'), "+
						" decode(att_beam,null,'n','y'), to_char(reg_date, 'yyyy-mm-dd') "+
						" from a20_track2_web_member "+
						" where id = '"+id+"' ";		
		Member_DTO dtoM = null;				
		try{
			con = common.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			while(rs.next()){
				String m_id 		= rs.getString(1);
				String pw 			= rs.getString(2);
				String name 		= rs.getString(3);
				String birth 		= rs.getString(4);
				String area 		= rs.getString(5);
				String address 		= rs.getString(6);
				String telecom 		= rs.getString(7);
				String phone_1  	= rs.getString(8);
				String phone_2  	= rs.getString(9);
				String phone_3  	= rs.getString(10);
				String email_1  	= rs.getString(11);
				String email_2  	= rs.getString(12);
				String att_desk  	= rs.getString(13);
				String att_note  	= rs.getString(14);
				String att_print  	= rs.getString(15);
				String att_beam 	= rs.getString(16);
				String reg_date 	= rs.getString(17);				
				dtoM = new Member_DTO(m_id, pw, name, birth, area, address, telecom, phone_1, phone_2, phone_3, email_1, email_2, 
							att_desk, att_note, att_print, att_beam, reg_date, "", "");
			}
		} catch(RemoteException me) {
			System.out.println(" RemoteException getMemberinfo(): "+me.getMessage());
		} catch(SQLException se) {
			System.out.println(" SQLException getMemberinfo(): "+se.getMessage());
		} catch(Exception e) {
			System.out.println(" 오류 : D_2_DAO.getMemberinfo() ");
		} finally {
			try{
				common.close(con, ps, rs);
			} catch(Exception e) {
				System.out.println(" getMemberinfo close Exception "+e.getMessage());
			}
		}				
		
		return dtoM;
	}	
	
}
