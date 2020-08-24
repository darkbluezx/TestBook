package _03_cart.web.store.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _03_cart.web.store.dao.CartDetailDao;
import _03_cart.web.store.dao.CartMasterDao;
import _03_cart.web.store.model.CartDetailBean;
import _03_cart.web.store.service.CartDetailService;

@Service
public class CartDetailServiceImpl implements CartDetailService {
	
	@Autowired
	CartMasterDao dao;
	
	@Autowired
	CartDetailDao dao2;

	@Transactional
	@Override
	public void addCartDetail(CartDetailBean cartDetailBean) {
		dao2.addCartDetail(cartDetailBean);
	}

	@Transactional
	@Override
	public void updateCartDetail(String id, Integer productId, Integer qty, Double discount,Integer discountEventId,Integer FreeBieEventId, String FreeBies) {
		dao2.updateCartDetail(id, productId, qty, discount, discountEventId,FreeBieEventId,FreeBies );

	}

	@Transactional
	@Override
	public List<CartDetailBean> getCartDetailByMaster(String id) {
		return dao2.getCartDetailByMaster(id);
	}

	@Transactional
	@Override
	public void deleteCartDetail(String id, Integer productId) {
		dao2.deleteCartDetail(id, productId);

	}

	@Transactional
	@Override
	public CartDetailBean getCartDetailByCartNo(String cartno, Integer bookId) {
		return dao2.getCartDetailByCartNo(cartno, bookId);
	}

}
