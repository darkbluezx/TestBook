package _01_order.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_order.model.OrderBean;
import _01_order.model.ShippingDataBean;
import _01_order.service.OrderService;
import _05_loginSystem.model.Members;

//尋找會員所有已取消訂單
@Controller
//@RequestMapping("/_01_order")
@SessionAttributes({ "LoginOK","members","Admin"})
public class OrderCancelledController {
	
	@Autowired
	OrderService service;
	
	@Autowired
	ServletContext context;

	
	@GetMapping("/ordersmaincancelled")
	public String mainCancelledList(Model model, HttpServletRequest req) {
		Members m = (Members) model.getAttribute("LoginOK");
		if (m == null) {
			return "redirect: " + context.getContextPath() + "/Login";
		} 
		
		String memberNo = m.getId().toString();  
		List<OrderBean> ob = service.getMemberCancelledOrders(memberNo);
		model.addAttribute("OrderBeanCancelled", ob);
		model.addAttribute("LoginOK",m);
		return "/_01_order/ordersmaincancelled";
	}
	
//	@GetMapping("/ordersmaincancelled/detail")
//	public String mainCancelledDetail(Model model, HttpServletRequest req) {
//		String orderNo = req.getParameter("orderNo");
//		OrderBean odb = service.getOrdersList(orderNo);
//		model.addAttribute("OrderDetailBeanCancelled", odb);
//		return "_01_order/ordertest4";
//	}
	

}
