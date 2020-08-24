package _03_cart.web.store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _03_cart.web.store.dao.CartDetailDao;
import _03_cart.web.store.dao.CartMasterDao;
import _03_cart.web.store.model.CartMasterBean;
import _03_cart.web.store.service.CartMasterService;

@Service
public class CartMasterServiceImpl implements CartMasterService {
	@Autowired
	CartMasterDao dao;
	
	@Autowired
	CartDetailDao dao2;

	@Transactional
	@Override
	public void addCart(CartMasterBean cardMasterBean) {
		dao.addCart(cardMasterBean);

	}

	@Transactional
	@Override
	public void updateCart(CartMasterBean cardMasterBean) {
		dao.updateCart(cardMasterBean);

	}

	@Transactional
	@Override
	public CartMasterBean getCartById(String id) {
		return dao.getCartById(id);
	}

	@Transactional
	@Override
	public List<CartMasterBean> getCartByMemberId(String id) {
		return dao.getCartByMemberId(id);
	}

	@Transactional
	@Override
	public void deleteCart(String id) {
		dao.deleteCart(id);

	}

}
