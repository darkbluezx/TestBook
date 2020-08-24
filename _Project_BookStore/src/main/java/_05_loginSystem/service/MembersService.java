package _05_loginSystem.service;

import _05_loginSystem.model.Members;
import _05_loginSystem.model.MembersHistory;

public interface MembersService {
	boolean phoneExists(String phone);
	boolean nameExists(String name);
	boolean googleIdExists(String googleId);
	boolean Admin(String phone, String password);
	int saveMembers(Members mb);
	int saveMembersHistory(MembersHistory mbH);
	Members queryMembers(String phone);
	public Members queryMembersName(String name);
	public Members queryMembersGoogleId(String googleId);
	Members checkPhonePassword(String phone, String password);
	Members checkAdmin(String phone, String password);
	void updateMembersPassword(Members mb); 
	void updateMembers(Members mb);
	void updateMembersHistoryPassword(MembersHistory mbH); 
	void updateMembersHistory(MembersHistory mbH);
	public Members queryMembersId(Integer id);
}
