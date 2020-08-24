package _03_cart.web.store.service;

import java.util.List;

import _03_cart.web.store.model.CartMasterBean;

public interface CartMasterService {
	void addCart(CartMasterBean cardMasterBean);
	void updateCart(CartMasterBean cardMasterBean);
	CartMasterBean getCartById(String id);
	List<CartMasterBean> getCartByMemberId(String id);
	void deleteCart(String id);

}
