package _03_cart.web.store.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import _00_init.util.GetCartNo;
import _03_cart.web.store.model.Cart;
import _03_cart.web.store.model.CartDetailBean;
import _03_cart.web.store.model.CartMasterBean;
import _03_cart.web.store.model.MemberBean;
import _03_cart.web.store.service.CartDetailService;
import _03_cart.web.store.service.CartMasterService;

@Controller
@SessionAttributes({"Cart", "memberBean", "cartMasterBean"})
public class Home2Controller {
	@Autowired
	CartMasterService service;
	@Autowired
	CartDetailService CDservice;
	
	@RequestMapping("/insertCart")
	public String welcome(Model model) {
		return "insertCart";
	}
	@RequestMapping("/index_h")
	public String index_h() {
		return "index_h";
	}
	
	@ModelAttribute
	public MemberBean createMemberBean(Model model) {
		MemberBean mb = new MemberBean();
		mb.setMemberId("testId1001");
		mb.setName("林依晨");
		mb.setAddress("測試用地址");
		mb.setEmail("11112222@gmail.com");
		mb.setTel("0938138138");	
		model.addAttribute("memberBean", mb);
		return mb;
	}
	@ModelAttribute
	public CartMasterBean createCartMasterBean(Model model) {
		createMemberBean(model);
		List<CartMasterBean> lcmb = new ArrayList<>();
		MemberBean bean = (MemberBean) model.getAttribute("memberBean");
		CartMasterBean cmb = new CartMasterBean();
		String id = bean.getMemberId();
		lcmb = service.getCartByMemberId(id);
		if (lcmb.size() == 0) {
			GetCartNo cartNo = new GetCartNo();
			String k = cartNo.getKey();
			cmb.setMemberId(id);
			cmb.setCartNo(k);
			cmb.setAmount(0.0);
			cmb.setDiscount((float) 0);
			service.addCart(cmb);
		} else {
			for (int i =0;i<lcmb.size();i++) {
				cmb = lcmb.get(i);
				if ( cmb.getInvalidDate() == null) {
					break;
				}
			}
		}
		model.addAttribute("cartMasterBean", cmb);
		return cmb;
	}
	@ModelAttribute("Cart")
	public Cart createCart(Model model) {
		createMemberBean(model);
		MemberBean bean = (MemberBean) model.getAttribute("memberBean");
		String id = bean.getMemberId();
		List<CartDetailBean> lcdb = new ArrayList<>();
		Cart Cart = new Cart();
		String cartno = "";
		List<CartMasterBean> lcmb = service.getCartByMemberId(id);
		if (lcmb.size() != 0) {
			for (int i =0;i<lcmb.size();i++) {
				cartno = lcmb.get(i).getCartNo();
			}
				
		}
		lcdb = CDservice.getCartDetailByMaster(cartno);
		if (lcdb.size() != 0) {
			for (int i =0;i<lcdb.size();i++) {
				Cart.addToCart(lcdb.get(i).getProductId(), lcdb.get(i));
			}
				
		}
		
		return Cart;
	}
}
