package _03_cart.web.store.model;

import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {
	private Map<Integer, CartDetailBean> cart = new LinkedHashMap< >();

	public Map<Integer, CartDetailBean> getContent() {
		return cart;
	}

	public void setBooks(Map<Integer, CartDetailBean> cart) {
		this.cart = cart;
	}

	public void addToCart(Integer bookId, CartDetailBean cdb) {
		System.out.println("In addToCart");
		if (cdb.getQty() <= 0 ) {
			return;
		}
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if ( cart.get(bookId) == null ) {
		    cart.put(bookId, cdb);
		} else {
	        // 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
			CartDetailBean cdBean = cart.get(bookId);
			// 加購的數量：bean.getQuantity()
			// 原有的數量：oBean.getQuantity()			
			cdBean.setQty(cdb.getQty() + cdBean.getQty());
		}
		
	}
	public void modifyCart(Integer bookId, CartDetailBean cdb) {
		System.out.println("In updateCart");
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if ( cart.get(bookId) == null ) {
		    cart.put(bookId, cdb);
		} else {
	        // 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
			CartDetailBean cdBean = cart.get(bookId);		
			cdBean.setQty(cdb.getQty());
			cdBean.setDiscount(cdb.getDiscount());
			cdBean.setDiscountEventId(cdb.getDiscountEventId());
			cdBean.setFreeBieEventId(cdb.getFreeBieEventId());
			cdBean.setFreeBies(cdb.getFreeBies());
		}
		
	}
	public int getItemNumber(){   // ShoppingCart.itemNumber
		return cart.size();
	}

	public int deleteBook(int bookId) {
		if ( cart.get(bookId) != null ) {
		       cart.remove(bookId);  // Map介面的remove()方法
		       return 1;
			} else {
			   return 0;
			}
		
	}

	public boolean modifyQty(int bookId, int newQty) {
		if ( cart.get(bookId) != null ) {
			   CartDetailBean  bean = cart.get(bookId);
			   bean.setQty(newQty);
		       return true;
			} else {
			   return false;
			}
		
	}
	public boolean modifyDiscount(Integer bookId, Double discount) {
		if ( cart.get(bookId) != null ) {
			   CartDetailBean  bean = cart.get(bookId);
			   bean.setDiscount(discount);
		       return true;
			} else {
			   return false;
			}
	}
	

}
