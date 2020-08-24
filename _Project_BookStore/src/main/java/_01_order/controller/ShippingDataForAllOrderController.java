package _01_order.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_order.model.OrderBean;
import _01_order.model.ShippingDataBean;
import _01_order.service.OrderService;
import _05_loginSystem.model.Members;
import shopping.store.service.ProductService;

@Controller
//@SessionAttributes({"sdbChange"})
//@RequestMapping("/_01_order")
@SessionAttributes({ "LoginOK","members","Admin"})
public class ShippingDataForAllOrderController {

	@Autowired
	OrderService service;
	
	@Autowired
	ProductService 	productService;
	
	@Autowired
	ServletContext context;
	
	@GetMapping("/shippingdata")
	public String showShippingData(Model model, HttpServletRequest req) {
		Members m = (Members) model.getAttribute("LoginOK");
		if (m == null) {
			return "redirect: " + context.getContextPath() + "/Login";
		}		
		String orderNo = req.getParameter("orderNo");
		ShippingDataBean sdb = service.getShippingData(orderNo);
		
		model.addAttribute("ShippingDataBean", sdb);
		model.addAttribute("LoginOK",m);
		return "/_01_order/shippingdatafrommain";
	}
	
//	@GetMapping("/ordersallmain/shippingdatachange/{ShippingDataBean.orderBean.orderNo}")
//	public String shippingDataChange(
//			@PathVariable("ShippingDataBean.orderBean.orderNo") String orderNo, 
//			Model model) {
//		ShippingDataBean sdb = service.getShippingData(orderNo);		
//		model.addAttribute("ShippingDataBean", sdb);
//		return "/_01_order/shippingdatafrommain";
		
//		Integer ocn = service.getOrdersList(orderNo).getOrderCancel();
//		String ss = sdb.getShippingStatus();
//		Integer ons = sdb.getOrderNo_sort();		
//		//判斷，存活訂單 且尚未出貨 且運送狀態尚未修改超過2次
//		if (ocn == 1 && ss ==null ) {
//			if (ons == null || ons < 2) {
//				ShippingDataBean sdbf = new ShippingDataBean(sdb.getOrderBean(), 
//						null, null, null, ss, ons);
//				model.addAttribute("sdbChange", sdbf);
//				return "/_01_order/shippingdataform";
//			}
//		}		
//	}	

	//所有的訂單之運送狀態變更(已取消的訂單無法變更)
	@SuppressWarnings("unused")
	@PostMapping(value = "/shippingdatachange/{ShippingDataBean.orderBean.orderNo}")
	public ResponseEntity<Map<String, String>> changeShippingDataForAll(Model model,
			String orderNo,
			String shippingNo,
			String address,
			String shippingStatus) {
		System.out.println("AA"+"-------------------------------------------------");
		ShippingDataBean sdbSelect = service.getShippingData(orderNo);
		Map<String, String> sdbmap = new HashMap<String, String>();
		ResponseEntity<Map<String, String>> re = null;
		Integer sort =  sdbSelect.getOrderNo_sort();
		//將傳進來的運送狀態與資料庫的做比對
		if (address == "") {
			sdbmap.put("errormsg","地址空白，請重新填寫");
			re = new ResponseEntity<Map<String,String>>(sdbmap, HttpStatus.NOT_FOUND);
			return re;  	 //表示地址空白，跳出提醒(訂單已取消，無法變更)，按鈕消失
		}
		if (address.equalsIgnoreCase(sdbSelect.getAddress())) {
			sdbmap.put("errormsg","地址重複");
			re = new ResponseEntity<Map<String,String>>(sdbmap, HttpStatus.NOT_FOUND);
			return re;  	 //表示地址空白，跳出提醒(訂單已取消，無法變更)，按鈕消失
		}
		if (sdbSelect.getOrderBean().getOrderCancel() != 1) {
			sdbmap.put("errormsg","訂單已取消，無法變更");
			re = new ResponseEntity<Map<String,String>>(sdbmap, HttpStatus.NOT_FOUND);
			return re; 	 //表示已取消，前端顯示表格，且跳出提醒(訂單已取消，無法變更)，按鈕消失
		}
		System.out.println("-----------------------bbb--------------------------");
		if (shippingStatus == "") {
			shippingStatus = null;
			if (shippingStatus != sdbSelect.getShippingStatus()) {
				sdbmap.put("errormsg","訂單已出貨，無法變更");
				re = new ResponseEntity<Map<String,String>>(sdbmap, HttpStatus.NOT_FOUND);
				return re;     //表示已出貨，前端顯示表格，且跳出提醒(訂單已出貨，無法變更)，按鈕消失
			}
		}
		System.out.println("-----------------------ccc--------------------------");
		if (sort >= 3) {
			sdbmap.put("errormsg", "已修改2次以上，無法變更");
			re = new ResponseEntity<Map<String,String>>(sdbmap, HttpStatus.NOT_FOUND);
			return re;  	 //表示已修改2次以上，前端顯示表格，且跳出提醒(已修改2次以上，無法變更)，按鈕消失
		}
		
		Date today = new Date();
		
		System.out.println("-----------------------ddd--------------------------");
		//填入新的物流資料、更新時間和修改次數至資料庫
		if (sort < 3) {
			ShippingDataBean modifysdb = 
					new ShippingDataBean(sdbSelect.getOrderBean(), today, address, 
							sdbSelect.getShippingMethod(), shippingStatus, sort+1);
			service.modifyShippingData(modifysdb);
			ShippingDataBean newShippingData = service.getShippingData(orderNo);
			String todaystr = today.toString();
			productService.updateLogistics(sdbSelect.getOrderBean().getShippingNo(), address, todaystr);  //同步更新物流功能資料庫
			sdbmap.put("orderNo",orderNo);
			sdbmap.put("shippingNo",newShippingData.getOrderBean().getShippingNo());
			sdbmap.put("address",newShippingData.getAddress());
			sdbmap.put("shippingStatus",newShippingData.getShippingStatus());
			//回傳更新的訂單運送資料(表格)，有表單按鈕
		}

		System.out.println("-----------------------eee--------------------------");
		re = new ResponseEntity<Map<String,String>>(sdbmap, HttpStatus.CREATED);
		return re;
	}
	
}
