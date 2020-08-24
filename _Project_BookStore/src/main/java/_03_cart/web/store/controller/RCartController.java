package _03_cart.web.store.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import _00_init.util.GetCartNo;
import _01_order.model.OrderBean;
import _01_order.model.OrderItemBean;
import _01_order.model.ShippingDataBean;
import _01_order.service.OrderService;
import _03_cart.web.store.model.Cart;
import _03_cart.web.store.model.CartDetailBean;
import _03_cart.web.store.model.CartMasterBean;
import _03_cart.web.store.model.DiscountTable;
import _03_cart.web.store.model.MemberBean;
import _03_cart.web.store.service.CartDetailService;
import _03_cart.web.store.service.CartMasterService;
import _05_loginSystem.model.Members;
import _08_Promotion_com.web.store.model.DiscountBean;
import _08_Promotion_com.web.store.model.FreeBiesBean;
import _08_Promotion_com.web.store.model.ShoppingCartBean;
import _08_Promotion_com.web.store.model.ShoppingDiscountBean;
import _08_Promotion_com.web.store.service.DiscountService;
import _08_Promotion_com.web.store.service.FreeService;
import _08_Promotion_com.web.store.service.ShoppingDiscountService;
import _09_Book.model.BookBean;
import _09_Book.service.BookService;
import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutDevide;
import ecpay.payment.integration.domain.AioCheckOutOneTime;
import shopping.store.model.EnterCHBeanC;
import shopping.store.service.ProductService;

@Controller
@SessionAttributes({ "Cart", "memberBean", "products", "cartMasterBean", "mapDiscountTable", "LoginOK" })
//@RequestMapping("/_03_cart")
public class RCartController {
	public AllInOne all;
//get discount start	
	private Gson gson = new GsonBuilder().create();	
	private DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	@Autowired
	BookService bookService;
	@Autowired
	FreeService freeService;
	@Autowired
	DiscountService discountService;
	@Autowired
	ShoppingDiscountService shoppingDiscountService;
//get discount end	
//order start
	@Autowired
	OrderService orderService;
//order end
	@Autowired
	CartDetailService CDService;
	
	@Autowired
	CartMasterService CMService;
	@Autowired
	ServletContext ctx;
	
	@Autowired
	ProductService ProductService;

//	@RequestMapping(value = "/BuyBook", method = RequestMethod.POST)
	@RequestMapping("/BuyBook")
	public String insertCart(Model model, @RequestParam Integer bookId, @RequestParam Integer qty,
			@RequestParam Double price) {
		Members m = (Members) model.getAttribute("LoginOK");
		 if (m == null) {
			   return "redirect: " + ctx.getContextPath() + "/Login";
		}
		
		Cart cart = (Cart) model.getAttribute("Cart");
		CartMasterBean cmb = (CartMasterBean) model.getAttribute("cartMasterBean");
		if (cmb.getCartNo() == null) {
			GetCartNo cartNo = new GetCartNo();
			String k = cartNo.getKey();
			cmb.setMemberId(m.getId().toString());
			cmb.setCartNo(k);
			cmb.setAmount(0.0);
			cmb.setDiscount((float) 100);
			model.addAttribute("cartMasterBean", cmb);
			CMService.addCart(cmb);
		}
		CartDetailBean cdb = new CartDetailBean();
		Double discount = 100.0;
		BookBean book = bookService.getBookById(bookId);
		cdb.setProductId(bookId);
		cdb.setQty(qty);
		cdb.setPrice(price);
		cdb.setCompanyName(book.getCompanyBean().getName());
		
		cdb.setProductName(book.getBookName());
		cdb.setCartNo(cmb.getCartNo());
		cdb.setCartMasterBean(cmb);
		CartDetailBean cdb2 = CDService.getCartDetailByCartNo(cmb.getCartNo(), bookId);
		cdb.setDiscount(discount);
		cart.addToCart(bookId, cdb);
		if (cdb2 == null) {
			CDService.addCartDetail(cdb);
		} else {
			int qty1 = cart.getContent().get(bookId).getQty();
			CDService.updateCartDetail(cmb.getCartNo(), bookId, qty1, discount, null, null, null);
		}
		updateDiscount(model);
		return "redirect:/bookpage";
	}

	private void updateDiscount(Model model) {
		Cart cart = (Cart) model.getAttribute("Cart");
		CartMasterBean cmb = (CartMasterBean) model.getAttribute("cartMasterBean");
		CartDetailBean cdb = new CartDetailBean();
		List<DiscountBean> list2 = discountService.getAllDiscounts();
		List<FreeBiesBean> list3 = freeService.getAllFrees();
		List<ShoppingDiscountBean> list5 = shoppingDiscountService.getAllShoppingDiscounts();
		DiscountBean db = new DiscountBean();
		FreeBiesBean fb = new FreeBiesBean();
		ShoppingDiscountBean sdb = new ShoppingDiscountBean();
		Map<Integer, DiscountTable> mdt = new HashMap<>();
		DiscountTable dt = new DiscountTable();
		Integer total = 0;
		Double discount_sum = 0.0;
		for (Integer k : cart.getContent().keySet()) {
			dt = new DiscountTable();
			cdb = cart.getContent().get(k);
			total = total + cdb.getPrice().intValue()*cdb.getQty();
			BookBean book = bookService.getBookById(cdb.getProductId());
		    Integer companyId = book.getCompanyBean().getId();
		    if ( mdt.get(companyId) == null ) {
		    	dt.setCompanyName(book.getCompanyBean().getName());
		    	dt.setCompanyId(companyId);
		    	dt.setDiscount(100.0);
		    	dt.setQty(cdb.getQty());
		    	dt.setDiscountEventId(null);
		    	dt.setTotalamt(cdb.getPrice().intValue()*cdb.getQty());
		    	mdt.put(companyId, dt);
		    } else {
		    	dt = mdt.get(companyId);
		    	Integer n = dt.getQty();
		    	dt.setQty(n + cdb.getQty() );
		    	dt.setDiscountEventId(null);
		    	dt.setTotalamt(cdb.getPrice().intValue()*(n + cdb.getQty()));
		    	mdt.put(companyId ,dt);
		    }
		}
		for (int i = 0; i<list2.size(); i++) {
			db = list2.get(i);
			Date d = new Date();
			if ((db.getDiscountFromDate().before(d)) && (db.getDiscountFinishDate().after(d))) {
				dt = mdt.get(db.getCompanyBean().getId());
				if (dt != null) {
					if (dt.getQty() >= db.getThresholdQuantity()) {
						Double dc = db.getDiscount();
						dt.setDiscount(dc);
						dt.setDiscountEventId(db.getDiscountEventId());
						mdt.put(db.getCompanyId(),dt);
					}
				}
			}
		}
		// 開始抓贈品
		for (int i = 0; i<list3.size(); i++) {
			fb = list3.get(i);
			Date d = new Date();
			dt = new DiscountTable();
			dt.setFreeBies(null);
			if ((fb.getFreeBieFromDate().before(d)) && (fb.getFreeBieFinishDate().after(d))) {
				dt = mdt.get(fb.getCompanyBean().getId());
				if (dt != null) {
					if (dt.getTotalamt() >= fb.getFreeBieThreshold()) {
						String dc = fb.getFreeBies();
						dt.setFreeBies(dc);
						dt.setFreeBieEventId(fb.getFreeBieEventId());
						mdt.put(fb.getCompanyBean().getId(),dt);
					}
				}
			}
		}
		// 贈品結束
		//購物車抵減金額開始
		boolean flag = false;
		cmb.setDivident(0.0);
		for (int i = 0; i<list5.size(); i++) {
			
			sdb = list5.get(i);
			Date d = new Date();
			if ((sdb.getShoppingFromDate().before(d)) && (sdb.getShoppingFinishDate().after(d))) {
				if (total >= sdb.getShoppingThreshold()) {
					Double amt = 0.0;
					if (sdb.getShoppingDiscount() != null) {
						amt = sdb.getShoppingDiscount().doubleValue();
					}
					if (amt >= cmb.getDivident()) {
						cmb.setDivident(amt);
						cmb.setShoppingEventId(sdb.getShoppingEventId());
						model.addAttribute("cartMasterBean", cmb);
						CMService.updateCart(cmb);
						flag = true;
					}	
				} else {
					if ( flag == false) {
						cmb.setDivident(0.0);
						cmb.setShoppingEventId(null);
						model.addAttribute("cartMasterBean", cmb);
						CMService.updateCart(cmb);
					}
					
				}
			}
		}
			
		//購物車抵減金額結束
			
		model.addAttribute("mapDiscountTable", mdt);	
		for (Integer k : cart.getContent().keySet()) {
			cdb = cart.getContent().get(k);
			discount_sum = discount_sum + (cdb.getPrice() * cdb.getQty() * cdb.getDiscount() /100);
			Integer qty = cdb.getQty();
			BookBean book = bookService.getBookById(cdb.getProductId());
		    Integer companyId = book.getCompanyBean().getId();
		    if ( mdt.get(companyId) != null ) {
		    	dt = mdt.get(companyId);
		    	Double n = dt.getDiscount();
		    	cdb.setDiscount(n);
		    	cdb.setDiscountEventId(dt.getDiscountEventId());
		    	cdb.setFreeBieEventId(dt.getFreeBieEventId());
		    	cdb.setFreeBies(dt.getFreeBies());
				cart.modifyCart(cdb.getProductId(), cdb);
		    	CDService.updateCartDetail(cmb.getCartNo(), cdb.getProductId(), qty, n, dt.getDiscountEventId(), dt.getFreeBieEventId(),dt.getFreeBies());
		    }
		}
		CartMasterBean cmbean = (CartMasterBean) model.getAttribute("cartMasterBean");
		cmbean.setAmount(discount_sum);
		model.addAttribute("cartMasterBean", cmbean);
		CMService.updateCart(cmbean);
		
	}

	@RequestMapping("/qtyPlus")
	public String qtyPlus(Model model, @RequestParam Integer bookId) {
		Cart cart = (Cart) model.getAttribute("Cart");
		CartMasterBean cmb = (CartMasterBean) model.getAttribute("cartMasterBean");
		CartDetailBean cdb = new CartDetailBean();
		Double discount = 100.0;
		if (cart.getContent().get(bookId) != null) {
			cdb = cart.getContent().get(bookId);
		}	
		cart.modifyQty(bookId, cdb.getQty() + 1); // 修改某項商品的數項
		CartDetailBean cdb2 = CDService.getCartDetailByCartNo(cmb.getCartNo(), bookId);
		if (cdb2 == null) {
			CDService.addCartDetail(cdb);
		} else {
			int qty1 = cdb.getQty();
			CDService.updateCartDetail(cmb.getCartNo(), bookId, qty1, discount, null, null, null);
		}
		updateDiscount(model);
		return "redirect:/bookpage";
	}
	@RequestMapping("/qtyMinus")
	public String qtyMinus(Model model, @RequestParam Integer bookId) {
		Cart cart = (Cart) model.getAttribute("Cart");
		CartMasterBean cmb = (CartMasterBean) model.getAttribute("cartMasterBean");
		CartDetailBean cdb = new CartDetailBean();
		Double discount = 100.0;
		if (cart.getContent().get(bookId) != null) {
			cdb = cart.getContent().get(bookId);
		}	
		cart.modifyQty(bookId, cdb.getQty() - 1); // 修改某項商品的數項
		CartDetailBean cdb2 = CDService.getCartDetailByCartNo(cmb.getCartNo(), bookId);
		if (cdb2 == null) {
			CDService.addCartDetail(cdb);
		} else {
			int qty1 = cdb.getQty();
			CDService.updateCartDetail(cmb.getCartNo(), bookId, qty1, discount, null, null, null);
		}
		updateDiscount(model);
		return "redirect:/bookpage";
	}
	@RequestMapping("/products")
	public String list(Model model) {
		List<BookBean> list = bookService.getBook();
		model.addAttribute("products", list);
		updateDiscount(model);
		return "_03_cart/products";
	}

	
	@RequestMapping("/displayCart")
	public String displayCart(Model model) {
		updateDiscount(model);
		return "_03_cart/displayCart";
	}

	@RequestMapping("/dataConfirm")
	public String dataConfirm(Model model) {
		return "_03_cart/dataConfirm";
	}

	@RequestMapping("/checkout")
	public String checkout(Model model) {
		return "_03_cart/checkout";
	}

	@RequestMapping("/orderConfirm")
	public String orderConfirm(Model model, @RequestParam String ShippingAddress) {
		MemberBean bean = (MemberBean) model.getAttribute("memberBean");
		bean.setAddress(ShippingAddress);
		model.addAttribute("memberBean", bean);
		return "_03_cart/orderConfirm";
	}

	@RequestMapping("/displayOrder")
	public String displayOrder(Model model) {
		return "_03_cart/displayOrder";
	}

	@RequestMapping("/order_placed2")
	public String displayOrder2(Model model) {
		return "_03_cart/order_placed2";
	}
	@RequestMapping("/order_placed")
	public String order_placed(Model model,@RequestParam("name") String name,@RequestParam("phone") String phone,@RequestParam("email") String email,@RequestParam("flat") String flat,@RequestParam("holdername") String holdername,@RequestParam("cardnumber") String cardnumber,@RequestParam("cardexpiremonth") String cardexpiremonth,@RequestParam("cardexpireyear") String cardexpireyear,@RequestParam("cardcvc") String cardcvc,@RequestParam("selectedOption") String selectedOption) {
		CartMasterBean cmbean = (CartMasterBean) model.getAttribute("cartMasterBean");
		MemberBean bean = (MemberBean) model.getAttribute("memberBean");
		
		Cart cart = (Cart) model.getAttribute("Cart");
		if ((name == null) || (name == "")) {
			cmbean.setName(bean.getName());
		} else {
			cmbean.setName(name);
		}
		if ((holdername == null) || (holdername == "")) {
			cmbean.setHoldername(bean.getName());
		} else {
			cmbean.setHoldername(holdername);
		}
		if ((email == null) || (email == "")) {
			cmbean.setEmail(bean.getEmail());
		} else {
			cmbean.setEmail(email);
		}
		if ((flat == null) || (flat == "")) {
			cmbean.setAddress(bean.getAddress());
		} else {
			cmbean.setAddress(flat);
		}
		if ((phone == null) || (phone == "")) {
			cmbean.setPhone(bean.getTel());
		} else {
			cmbean.setPhone(phone);
		}
		if (selectedOption.trim().equalsIgnoreCase("card")  ) {
			cmbean.setPayKind("01");
			cmbean.setCreditCardNo(cardnumber);
			cmbean.setCreditCardMM(cardexpiremonth);
			cmbean.setCreditCardYY(cardexpireyear);
			cmbean.setCreditCardCV(cardcvc);	
		} else {
			cmbean.setPayKind("03");
			cmbean.setCreditCardNo("");
			cmbean.setCreditCardMM("");
			cmbean.setCreditCardYY("");
			cmbean.setCreditCardCV("");
		}
		Date date = new Date();
		cmbean.setInvalidDate(date);
		CMService.updateCart(cmbean);
//		開始貨運資料
		EnterCHBeanC echc = new EnterCHBeanC();
		Integer amount = cmbean.getAmount().intValue() - cmbean.getDivident().intValue();
		echc.setGoodsAmount(amount.toString());
		echc.setGoodsName("書果店商品");
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");	
		echc.setMerchantTradeDate(sdFormat.format(date));
		echc.setReceiverAddress("台北市南港區三重路");
		echc.setReceiverCellPhone(cmbean.getPhone());
		echc.setReceiverEmail(cmbean.getEmail());
		echc.setReceiverName(cmbean.getName());
		echc.setReceiverPhone(cmbean.getPhone());
		echc.setReceiverZipCode("110");
		String lno = ProductService.getLogisticsID(echc);	
		ProductService.addQLTIData(lno);

//		結束貨運資料	
//		開始更新訂單相關檔案，OrderBean & OrderItemBean & ShippingDataBean
		
		
		Set<OrderItemBean> oiDetail = new LinkedHashSet<>();
		ShippingDataBean shippingDataBean = new ShippingDataBean();
		Set<ShippingDataBean> sdDetail = new LinkedHashSet<>();
		OrderBean orderbean = new OrderBean(cmbean.getCartNo(),cmbean.getMemberId(),cmbean.getName(),cmbean.getEmail(),cmbean.getPhone(),cmbean.getPayKind(),"",cmbean.getAmount() - cmbean.getDivident(),date,lno,1,null,null,null,oiDetail,sdDetail);
		if (cmbean.getPayKind() == "01") {
			orderbean.setPaymentStatus("01");
		} else {
			orderbean.setPaymentStatus("02");
		}
		for (Integer k : cart.getContent().keySet()) {
			CartDetailBean cdb = cart.getContent().get(k);
			OrderItemBean orderItemBean = new OrderItemBean();
			orderItemBean.setOrderItemId(cdb.getDetailKey());
			orderItemBean.setProductNo(cdb.getProductId());
			orderItemBean.setProductQuantity(cdb.getQty());
			orderItemBean.setOrderBean(orderbean);
			BookBean book = bookService.getBookById(cdb.getProductId());
			orderItemBean.setProductName(book.getBookName());
			orderItemBean.setProductPriceAtTheTime(cdb.getPrice()*cdb.getDiscount()/100);
//			orderService.insertOrderItem(orderItemBean);
			oiDetail.add(orderItemBean);
		}
	
		shippingDataBean.setAddress(cmbean.getAddress());
		shippingDataBean.setOrderBean(orderbean);
		shippingDataBean.setOrderNo_sort(1);
		shippingDataBean.setChangeTime(date);
		if (cmbean.getPayKind() == "01") {
			shippingDataBean.setShippingMethod("01");
		} else {
			shippingDataBean.setShippingMethod("02");
		}
		shippingDataBean.setShippingStatus(null);
		sdDetail.add(shippingDataBean);
		orderbean.setOiDetail(oiDetail);
		orderbean.setSdDetail(sdDetail);
		try {
			orderService.insertOrder(orderbean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		cart = new Cart();
		model.addAttribute("Cart", cart);
		
		return "_03_cart/order_placed";
	}
	
	@RequestMapping("/UpdateItem.do")
	public String updateItem(Model model,@RequestParam("cmd") String cmd, @RequestParam("bookId") Integer bookId, @RequestParam("newQty") Integer newQty) {
		Cart cart = (Cart) model.getAttribute("Cart");
		CartMasterBean cmbean = (CartMasterBean) model.getAttribute("cartMasterBean");

		if (cmd.equalsIgnoreCase("DEL")) {
			cart.deleteBook(bookId); // 刪除購物車內的某項商品
			CDService.deleteCartDetail(cmbean.getCartNo(), bookId);
			updateDiscount(model);
			
		} else if (cmd.equalsIgnoreCase("MOD")) {
			cart.modifyQty(bookId, newQty); // 修改某項商品的數項
			CDService.updateCartDetail(cmbean.getCartNo(), bookId, newQty, 1.0, null, null, null);
		}

		return "redirect:/bookpage";
	}
	
	@RequestMapping("/clearSession")
	public String clearSession(Model model) {
		Cart cart = (Cart) model.getAttribute("Cart");
		CartMasterBean cmbean = (CartMasterBean) model.getAttribute("cartMasterBean");
		cmbean = new CartMasterBean();
		cart = new Cart();
		model.addAttribute("Cart", cart);
		model.addAttribute("cartMasterBean", cmbean);
		cart = (Cart) model.getAttribute("Cart");
		cmbean = (CartMasterBean) model.getAttribute("cartMasterBean");
		return "redirect:/index";
	}
	
	@RequestMapping("/creditcard")
	public String creditCard(Model model) {
		all = new AllInOne("");
		String o = genAioCheckOutOneTime(model);
		Document doc = Jsoup.parse(o);
//		doc.getElementById("allPayAPIForm").attr("action", "displayOrder");
		doc.getElementById("allPayAPIForm").attr("target", "_blank");
		o = doc.html();
		model.addAttribute("o", o);
//		System.out.println('<meta http-equiv="refresh" content="10;URL=displayOrder">');
		
		return "_03_cart/creditcard";
	}

	public String getPromotionData(List<ShoppingCartBean> body) {
		String responseJson = "";
		try {
//			List<ShoppingCartBean> bodyList = gson.fromJson(body, new TypeToken<List<ShoppingCartBean>>(){}.getType());
			responseJson = this.promotionProcess(body);
		} catch (Exception e) {
			System.out.println("getPromotionData occur error");
		}
		return responseJson;
	}
	
	private String promotionProcess(List<ShoppingCartBean> bodyList) {
		JsonObject result = new JsonObject();
		//Task.1
		Map<String,List<ShoppingCartBean>> companyMap = new HashMap<>();
		for (ShoppingCartBean cart : bodyList) {
			BookBean bookBean = bookService.getBookById((Integer.valueOf(cart.getProductNumber())));
			String companyIdBYcart = String.valueOf(bookBean.getCompanyId());
			cart.setProductPrice(bookBean.getPrice().intValue());
			
			if (!companyMap.containsKey(companyIdBYcart)) {
				List<ShoppingCartBean> list = new ArrayList<>();
				companyMap.put(companyIdBYcart, list);
			}
			List<ShoppingCartBean> bookBycompany = companyMap.get(companyIdBYcart);
			bookBycompany.add(cart);
		}
		
		
		//Task.2
		List<String> keyList = companyMap.keySet().stream().collect(Collectors.toList());
		Date now = new Date();
		List<FreeBiesBean> matchFreeList = null;
		try {
			matchFreeList = freeService.getAllFrees().stream().filter(v -> v.getFreeBieFromDate().before(now) 
				&& v.getFreeBieFinishDate().after(now) 
				&& keyList.contains(String.valueOf(v.getCompanyId().intValue()))).collect(Collectors.toList());
		} catch (Exception e) {
			System.out.println("freeService error!");
			e.printStackTrace();
		}
		List<DiscountBean> matchDiscountList = null;
		System.out.println("discountService.getAllDiscounts()" + discountService.getAllDiscounts());
		try {
			matchDiscountList = discountService.getAllDiscounts().stream().filter(v -> v.getDiscountFromDate().before(now) 
				&& v.getDiscountFinishDate().after(now) 
				&& keyList.contains(String.valueOf(v.getCompanyId().intValue()))).collect(Collectors.toList());
		} catch (Exception e) {
			System.out.println("discountService error!");
			e.printStackTrace();
		}
		List<ShoppingDiscountBean> matchShoppingDiscountList = null;
		try {
			matchShoppingDiscountList = shoppingDiscountService.getAllShoppingDiscounts().stream().filter(v -> v.getShoppingFromDate().before(now) 
				&& v.getShoppingFinishDate().after(now)).collect(Collectors.toList());
		} catch (Exception e) {
			System.out.println("shoppingDiscountService error!");
			e.printStackTrace();
		}
		
		
		//Task.3
		JsonArray result1 = new JsonArray();
		for (FreeBiesBean freeBies : matchFreeList) {
			
			List<ShoppingCartBean> bookBycompany = companyMap.get(String.valueOf(freeBies.getCompanyId()));
			int sum = 0;
			for (ShoppingCartBean shoppingCart : bookBycompany) {
				sum += shoppingCart.getProductPrice()*shoppingCart.getAmount();		
			}
			
			if(sum >= freeBies.getFreeBieThreshold()) {
				freeBies.setFreeBieDateStr(sdf.format(freeBies.getFreeBieFromDate()) + " ~ " + sdf.format(freeBies.getFreeBieFinishDate()));
				JsonObject obj = new JsonObject();
				obj.addProperty("FreeBies", freeBies.getFreeBies());
				obj.addProperty("FreeBieQuota", freeBies.getFreeBieQuota().toString());
				obj.addProperty("FreeBieDate", freeBies.getFreeBieDateStr());
				result1.add(obj);
			}
		}
		result.add("obj1", result1);
		
		//Task.4
		JsonArray result2 = new JsonArray();
		for (DiscountBean discount : matchDiscountList) {
			List<ShoppingCartBean> bookBycompany = companyMap.get(String.valueOf(discount.getCompanyId()));
			int sum = 0;
			for (ShoppingCartBean shoppingCart : bookBycompany) {
				sum += shoppingCart.getAmount();
			}
			if(sum >= discount.getThresholdQuantity()) {
				String discountArray = "";
				for(ShoppingCartBean bean:bookBycompany) {
					discountArray += bean.getDetailNumber()+",";
				}
				discountArray = discountArray.substring(0, discountArray.length() - 1);
				discount.setDiscountArray(discountArray);
				JsonObject obj = new JsonObject();
				obj.addProperty("Discount", discount.getDiscount().intValue() * 0.01);
				obj.addProperty("DiscountArray", discount.getDiscountArray());
				result2.add(obj);
			}
			
		}
		result.add("obj2", result2);
		
		
		//Task.5
		int sum = 0;
		for (ShoppingCartBean shoppingCart : bodyList) {
			sum += shoppingCart.getProductPrice()*shoppingCart.getAmount();		
		}
		int maxBonus = 0;
		int finalDiscount=0;
		for(ShoppingDiscountBean shoppingDiscount:matchShoppingDiscountList) {
			int currentMaxBonus = shoppingDiscount.getShoppingThreshold().intValue();
			if (sum >= currentMaxBonus) {
				if (maxBonus < currentMaxBonus) {
					maxBonus = currentMaxBonus;
				}
				if(shoppingDiscount.getShoppingThreshold().intValue()==maxBonus) {
					finalDiscount=shoppingDiscount.getShoppingDiscount().intValue();
				}
			}
		}
		

		result.addProperty("obj3", finalDiscount);
		
		
		return gson.toJson(result);
	}
	public String genAioCheckOutDevide(Model model){
		CartMasterBean cmb = (CartMasterBean)model.getAttribute("cartMasterBean");
		AioCheckOutDevide obj = new AioCheckOutDevide();
//		obj.setMerchantTradeNo("testCompany0007");
		obj.setMerchantTradeNo(cmb.getCartNo());
		obj.setMerchantTradeDate("2017/01/01 08:05:23");
		obj.setTotalAmount("50");
		obj.setTradeDesc("test Description");
		obj.setItemName("TestItem");
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setNeedExtraPaidInfo("N");
		obj.setCreditInstallment("3,6");
		obj.setInstallmentAmount("10");
		String form = all.aioCheckOut(obj, null);
		return form;
	}
	public String genAioCheckOutOneTime(Model model){
		CartMasterBean cmb = (CartMasterBean)model.getAttribute("cartMasterBean");
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		obj.setMerchantTradeNo("V_BookStore");
		obj.setMerchantTradeNo(cmb.getCartNo());
		Date date = new Date();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");	
		
		obj.setMerchantTradeDate(sdFormat.format(date));
		Integer amount = cmb.getAmount().intValue() - cmb.getDivident().intValue();
		obj.setTotalAmount(amount.toString());
		obj.setTradeDesc("test Description");
		obj.setItemName("TestItem");
		obj.setReturnURL("http://localhost:8080/EEITProject/");
		obj.setNeedExtraPaidInfo("N");
		obj.setRedeem("Y");
		String form = all.aioCheckOut(obj, null);
		return form;
	}
}
