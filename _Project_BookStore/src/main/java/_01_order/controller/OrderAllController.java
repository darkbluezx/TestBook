package _01_order.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_order.model.OrderBean;
import _01_order.service.OrderService;
import _05_loginSystem.model.Members;
import _09_Book.service.BookService;

//尋找會員所有訂單
@Controller
//@RequestMapping("/_01_order")
@SessionAttributes({ "LoginOK","members","Admin"})
public class OrderAllController {
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	BookService bookService;
	
	@Autowired
	ServletContext context;
	
//	String memberNo = "11";
//	String orderNo = "20200312000121";
	
	@RequestMapping("/ordersallmain")    //正式名為/ordersallmain
	public String mainList(Model model, HttpServletRequest req) {  
		Members m = (Members) model.getAttribute("LoginOK");
		if (m == null) {
			return "redirect: " + context.getContextPath() + "/Login";
		}
		
		
		String memberNo = m.getId().toString();   
		List<OrderBean> ob = orderService.getMemberAllOrders(memberNo);
		model.addAttribute("OrderBean", ob);
		model.addAttribute("LoginOK",m);
		return "/_01_order/ordersallmain";
//		List<Object> bbcol = new ArrayList<Object>();
//		for (int i = 0; i < ob.size(); i++) {
//			List<BookBean> bb = new ArrayList<BookBean>();
//			List<OrderItemBean> oib =  orderService.getOrdersDetail(ob.get(i).getOrderNo());
//			for (int j = 0; j < oib.size(); j++) {
//				BookBean sbb = bookService.getBookById(oib.get(j).getProductNo());
//				bb.add(sbb);
//			}
//			bbcol.add(bb);
//		}
//		model.addAttribute("BookBeanInOrder", bbcol);
		
	}
	
//	@GetMapping("/ordersallmain/detail")
//	public String orderDetail(Model model, HttpServletRequest req) {
//		String orderNo = req.getParameter("orderNo");
//		OrderBean odb = orderService.getOrdersList(orderNo);
//		model.addAttribute("OrderDetailBean", odb);
//		return "_01_order/ordertest2";
//	}
	

//		ResponseEntity<List<OrderItemBean>> reod = new ResponseEntity<>(list, HttpStatus.OK);
//		return reod;

}
