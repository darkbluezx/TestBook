package _05_loginSystem.dao.impl;

import java.sql.Connection;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _05_loginSystem.dao.MembersDao;
import _05_loginSystem.model.Members;
import _05_loginSystem.model.MembersHistory;


// 本類別使用為標準的JDBC技術來存取資料庫。
@Repository
public class MemberDaoImpl_Hibernate implements MembersDao {
	@Autowired
	SessionFactory factory;
	
	public MemberDaoImpl_Hibernate() {
	}
	// 儲存MemberBean物件，將參數mb新增到Member表格內。
	@Override
	public int saveMembers(Members mb) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(mb);
		n++;
		return n;

	}
	@Override
	public int saveMembersHistory(MembersHistory mbH) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(mbH);
		n++;
		return n;

	}
	// 判斷參數id(會員帳號)是否已經被現有客戶使用，如果是，傳回true，表示此id不能使用，
	// 否則傳回false，表示此id可使用。
	@SuppressWarnings("unchecked")
	@Override
	public boolean phoneExists(String phone) {
		Session session = factory.getCurrentSession();
		boolean exist = false;
		String hql = "FROM Members m WHERE m.phone = :phone";
		List<Members> beans = (List<Members>) session.createQuery(hql)
										.setParameter("phone", phone)
										.getResultList();
		
		if (beans.size() > 0) {
			exist = true;
		}

		return exist;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public boolean nameExists(String name) {
		Session session = factory.getCurrentSession();
		boolean exist = false;
		String hql = "FROM Members m WHERE m.name = :name";
		List<Members> beans = (List<Members>) session.createQuery(hql)
										.setParameter("name", name)
										.getResultList();
		
		if (beans.size() > 0) {
			exist = true;
		}

		return exist;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public boolean googleIdExists(String googleId) {
		Session session = factory.getCurrentSession();
		boolean exist = false;
		String hql = "FROM Members m WHERE m.googleId = :googleId";
		List<Members> beans = (List<Members>) session.createQuery(hql)
										.setParameter("googleId", googleId)
										.getResultList();
		
		if (beans.size() > 0) {
			exist = true;
		}

		return exist;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public boolean Admin(String phone, String password) {
		Session session = factory.getCurrentSession();
		boolean exist = false;
		String hql = "FROM Members WHERE m.phone = :phone AND m.password = :password";
		List<Members> beans = (List<Members>) session.createQuery(hql)
										.setParameter("phone", phone)
										.setParameter("password", password)
										.getResultList();
		
		if (beans.size() > 0) {
			exist = true;
		}

		return exist;
	}
	
	// 由參數 id (會員帳號) 到Member表格中 取得某個會員的所有資料，傳回值為一個MemberBean物件，
	// 如果找不到對應的會員資料，傳回值為null。
	@SuppressWarnings("unchecked")
	@Override
	public Members queryMembers(String phone) {
		Members mb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM Members m WHERE m.phone = :phone";
		List<Members> beans = (List<Members>) session.createQuery(hql)
										.setParameter("phone", phone)
										.getResultList();
		if (beans.size() > 0) {
			mb = beans.get(0);
		}
		return mb;

	}
	

	@Override
	public Members queryMembersName(String name) {
		Members mb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM Members m WHERE m.name = :name";
		 mb = (Members) session.createQuery(hql)
				 			   .setParameter("name", name)
				               .getSingleResult();
//		List<Members> beans = (List<Members>) session.createQuery(hql)
//										.setParameter("name", name)
//										.getResultList();
//		if (beans.size() > 0) {
//			mb = beans.get(0);
//		}
		return mb;

	}
	
	@Override
	public Members queryMembersGoogleId(String googleId) {
		Members mb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM Members m WHERE m.googleId = :googleId";
		 mb = (Members) session.createQuery(hql)
				 			   .setParameter("googleId", googleId)
				               .getSingleResult();
//		List<Members> beans = (List<Members>) session.createQuery(hql)
//										.setParameter("name", name)
//										.getResultList();
//		if (beans.size() > 0) {
//			mb = beans.get(0);
//		}
		return mb;

	}
	// 檢查使用者在登入時輸入的帳號與密碼是否正確。如果正確，傳回該帳號所對應的MemberBean物件，
	// 否則傳回 null。
	@Override
	public Members checkPhonePassword(String phone, String password) {
		Members mb = null;
		String hql = "FROM Members m WHERE m.phone = :phone and m.password = :password";
		Session session = factory.getCurrentSession();
		try {
			mb = (Members)session.createQuery(hql)
								.setParameter("phone", phone)
								.setParameter("password", password)
								.getSingleResult();
		} catch(NoResultException ex) {
			;
		} catch(NonUniqueResultException ex) {
			;
		} 	
		return mb;
	}
	
	@Override
	public Members checkAdmin(String phone, String password) {
		Members mb = null;
		String hql = "FROM Members m WHERE :phone = admin and :password = 12345678";
		Session session = factory.getCurrentSession();
		try {
			mb = (Members)session.createQuery(hql)
								.setParameter("phone", phone)
								.setParameter("password", password)
								.getSingleResult();
		} catch(NoResultException ex) {
			;
		} catch(NonUniqueResultException ex) {
			;
		} 	
		return mb;
	}

	@Override
	public void setConnection(Connection conn) {
		throw new RuntimeException("本類別為提供此功能");
	}
//	@Override
//	public void updateMembersPassword(Members mb) {
//		Session session = factory.getCurrentSession();
//		session.update(mb);
//		
//	}


	@Override
	public void updateMembersPassword(Members mb) {

//		String hql1 = "FROM Members m WHERE m.phone = :phone";
		String hql2 = "UPDATE Members m SET m.password = :password WHERE m.phone = :phone";
		Session session = factory.getCurrentSession();

		session.createQuery(hql2).setParameter("password", mb.getPassword())
								 .setParameter("phone", mb.getPhone())
								 .executeUpdate();
	}
	
	@Override
	public void updateMembers(Members mb) {

//		String hql1 = "FROM Members m WHERE m.phone = :phone";
		String hql2 = "UPDATE Members m SET m.birthday = :birthday , m.mail = :mail , m.name = :name , m.gender = :gender , m.photo = :photo , m.fileName = :fileName, m.phone = :phone WHERE m.id = :id";
		Session session = factory.getCurrentSession();

		session.createQuery(hql2).setParameter("id", mb.getId())
								 .setParameter("phone", mb.getPhone())
								 .setParameter("birthday", mb.getBirthday())
								 .setParameter("mail", mb.getMail())
								 .setParameter("name", mb.getName())
								 .setParameter("gender", mb.getGender())
								 .setParameter("photo", mb.getPhoto())
								 .setParameter("fileName", mb.getFileName())
								 .executeUpdate();
	}
	


	@Override
	public void updateMembersHistory(MembersHistory mbH) {
//		String hql1 = "FROM MembersHistory mh WHERE mh.phone = :phone";
		String hql2 = "UPDATE MembersHistory mh SET mh.birthday = :birthday , mh.mail = :mail , mh.name = :name , mh.gender = :gender , mh.updateDate = :updateDate WHERE mh.phone = :phone";
		Session session = factory.getCurrentSession();
		Timestamp ts = new java.sql.Timestamp(System.currentTimeMillis());
		session.createQuery(hql2).setParameter("birthday", mbH.getBirthday())
								 .setParameter("mail", mbH.getMail())
								 .setParameter("name", mbH.getName())
								 .setParameter("gender", mbH.getGender())
								 .setParameter("phone", mbH.getPhone())
								 .setParameter("updateDate", ts)
								 .executeUpdate();
	}
	
	@Override
	public void updateMembersHistoryPassword(MembersHistory mbH) {
//		String hql1 = "FROM MembersHistory mh WHERE mh.phone = :phone";
		String hql2 = "UPDATE MembersHistory mh SET mh.password = :password , mh.updateDate = :updateDate WHERE mh.phone = :phone";
		Session session = factory.getCurrentSession();
		Timestamp ts = new java.sql.Timestamp(System.currentTimeMillis());
		session.createQuery(hql2).setParameter("password", mbH.getPassword())
		.setParameter("phone", mbH.getPhone())
		.setParameter("updateDate", ts)
		.executeUpdate();
	}
	
	@Override
	public Members queryMembersId(Integer id) {
		Members mb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM Members m WHERE m.id = :id";
		 mb = (Members) session.createQuery(hql)
				 			   .setParameter("id", id)
				               .getSingleResult();
//		List<Members> beans = (List<Members>) session.createQuery(hql)
//										.setParameter("name", name)
//							4
//		 .getResultList();
//		if (beans.size() > 0) {
//			mb = beans.get(0);
//		}
		return mb;

	}
	

	public Session getSession() {
        return factory.getCurrentSession();			
	}

}
