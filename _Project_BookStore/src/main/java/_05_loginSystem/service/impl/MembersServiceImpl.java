package _05_loginSystem.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _05_loginSystem.dao.MembersDao;
import _05_loginSystem.model.Members;
import _05_loginSystem.model.MembersHistory;
import _05_loginSystem.service.MembersService;


@Service
public class MembersServiceImpl implements MembersService {
	@Autowired
	MembersDao dao;

	public MembersServiceImpl() {
	}
	@Transactional
	@Override
	public int saveMembers(Members mb) {
		
		return dao.saveMembers(mb);
	}
	@Transactional
	@Override
	public int saveMembersHistory(MembersHistory mbH) {

		return dao.saveMembersHistory(mbH);
	}
	@Transactional
	@Override
	public boolean phoneExists(String phone) {
		
		return dao.phoneExists(phone);
	}
	@Transactional
	@Override
	public boolean nameExists(String name) {
		
		return dao.nameExists(name);
	}
	@Transactional
	@Override
	public boolean googleIdExists(String googleId) {
		
		return dao.googleIdExists(googleId);
	}
	@Transactional
	@Override
	public boolean Admin(String phone, String password) {
		
		return dao.Admin(phone,password);
	}

	@Transactional
	@Override
	public Members queryMembers(String phone) {
		
		return dao.queryMembers(phone);
	}
	@Transactional
	@Override
	public Members queryMembersName(String name) {
		
		return dao.queryMembersName(name);
	}
	
	@Transactional
	@Override
	public Members queryMembersGoogleId(String googleId) {
		
		return dao.queryMembersGoogleId(googleId);
	}
	@Transactional
	@Override
	public Members checkPhonePassword(String phone, String password) {
		
		return dao.checkPhonePassword(phone, password);
	}
	@Transactional
	@Override
	public Members checkAdmin(String phone, String password) {
		
		return dao.checkAdmin(phone, password);
	}
	@Transactional
	@Override
	public void updateMembersPassword(Members mb) {
		dao.updateMembersPassword(mb);
		
	}
	@Transactional
	@Override
	public void updateMembers(Members mb) {
		dao.updateMembers(mb);
		
	}
	@Transactional
	@Override
	public void updateMembersHistoryPassword(MembersHistory mbH) {
		dao.updateMembersHistoryPassword(mbH);
		
	}
	@Transactional
	@Override
	public void updateMembersHistory(MembersHistory mbH) {
		dao.updateMembersHistory(mbH);
		
	}
	@Transactional
	@Override
	public Members queryMembersId(Integer id) {
		return dao.queryMembersId(id);
	}
}
