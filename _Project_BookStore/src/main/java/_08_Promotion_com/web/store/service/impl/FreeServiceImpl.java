package _08_Promotion_com.web.store.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _08_Promotion_com.web.store.dao.FreeDao;
import _08_Promotion_com.web.store.model.FreeBiesBean;
import _08_Promotion_com.web.store.service.FreeService;
import _09_Book.model.CompanyBean;

@Service
public class FreeServiceImpl implements FreeService {
	FreeDao dao;
    
	@Autowired
    public void setDao(FreeDao dao) {
		this.dao = dao;
	}

	@Transactional
	@Override
	public List<FreeBiesBean> getAllFrees() {
		return dao.getAllFrees(); 
	}
	
	@Transactional
	@Override
	public FreeBiesBean getFreeById(int freeId) {
		return dao.getFreeById(freeId);
	}
	
	//===========
	@Transactional
	@Override
	public void addFree(FreeBiesBean free) {
		dao.addFree(free);
	}
	@Transactional
	@Override
	public CompanyBean getCompanyById(int companyId) {
		return dao.getCompanyById(companyId);
	}
	@Transactional
	@Override
	public List<CompanyBean> getCompanyList() {
		return dao.getCompanyList();
	}
	
	//===update===
	@Transactional
	@Override
	public void updateFreeBies(FreeBiesBean bean) {
		dao.updateFreeBies(bean);
		
	}
	
}
