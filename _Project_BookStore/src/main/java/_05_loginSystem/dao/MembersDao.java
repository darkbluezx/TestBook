package _05_loginSystem.dao;

import java.sql.Connection;

import _05_loginSystem.model.Members;
import _05_loginSystem.model.MembersHistory;

public interface MembersDao {
	
	public boolean phoneExists(String phone);
	public boolean nameExists(String name);
	public boolean googleIdExists(String googleId);
	boolean Admin(String phone, String password);

	public int saveMembers(Members mb) ;
	
	public int saveMembersHistory(MembersHistory mbH);
	
	public Members queryMembers(String phone);
	public Members queryMembersName(String name);
	
	public Members queryMembersGoogleId(String googleId);
	
	public Members checkPhonePassword(String phone, String password);	
	public Members checkAdmin(String phone, String password);	

	public void setConnection(Connection con);

	public void updateMembersPassword(Members mb);
	public void updateMembers(Members mb);

	public void updateMembersHistoryPassword(MembersHistory mbH);
	public void updateMembersHistory(MembersHistory mbH);
	
	public Members queryMembersId(Integer id);
}