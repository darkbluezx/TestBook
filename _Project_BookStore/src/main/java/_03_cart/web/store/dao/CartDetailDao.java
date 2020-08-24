package _03_cart.web.store.dao;

import java.util.List;

import _03_cart.web.store.model.CartDetailBean;

public interface CartDetailDao {
	void addCartDetail(CartDetailBean cartDetailBean);
	void updateCartDetail(String id, Integer productId, Integer qty, Double discount,Integer discountEventId,Integer FreeBieEventId, String FreeBies);
	List<CartDetailBean> getCartDetailByMaster(String id);
	void deleteCartDetail(String id, Integer productId);
	CartDetailBean getCartDetailByCartNo(String cartno, Integer bookId);

}
