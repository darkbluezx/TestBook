package _05_loginSystem.controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import _05_loginSystem.model.LoginBean;
import _05_loginSystem.model.Members;
import _05_loginSystem.model.Month;
import _05_loginSystem.model.Payment;
import _05_loginSystem.model.PaymentHistory;
import _05_loginSystem.service.MembersService;
import _05_loginSystem.service.MonthService;
import _05_loginSystem.service.PaymentService;

@Controller
@SessionAttributes({"LoginOK","members","delivery","allPayment"})
public class PaymentController {
	@Autowired
	MembersService membersService;
	@Autowired
	PaymentService paymentService;
	@Autowired
	MonthService monthService;
	@Autowired
	ServletContext ctx;
	
	@GetMapping(value = "Dashboard_Credit" , produces= {"text/html"}) //新增
	public String queryAllPaymentByMembers(Model model, Members m, LoginBean bean, HttpSession session) {
		Members mb = (Members) model.getAttribute("LoginOK");
		if (mb == null) {
			return "redirect: " + ctx.getContextPath() + "/Login";
		}

		if("".equals(mb.getPhone()) || mb.getPhone() == null) 
		{
			m = membersService.queryMembersGoogleId(mb.getGoogleId());
		}
		else
		{
			m = membersService.queryMembers(mb.getPhone());
		}
		List<Payment> p = paymentService.getMembersPayment(m);
		model.addAttribute("allPayment", p);

		return "/LoginSystem/Dashboard_Credit";
	}
	
	@RequestMapping(value = "paymentSave")//新增
	public String paymentSave(HttpServletRequest request, Model model, Payment p, PaymentHistory pH, Members m, LoginBean bean,
			@RequestParam("creditName") String creditName,
			@RequestParam("creditNumber") String creditNumber,
			@RequestParam("creditPincode") String creditPincode,
			@RequestParam("expireMonth") String expireMonth,
			@RequestParam("expireYear") String expireYear,
			@RequestParam("cvv") String cvv,
			@RequestParam("creditStreet") String creditStreet) {
		
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("MsgMap", errorMsg);	
		
		if (creditName == null ||creditName.trim().length() == 0) {
			errorMsg.put("errorcreditNameEmpty", "請輸入持卡者姓名");
		}
		if (creditNumber == null ||creditNumber.trim().length() == 0) {
			errorMsg.put("errorcreditNumberEmpty", "請輸入信用卡號碼");
		}
		if (creditPincode == null ||creditPincode.trim().length() == 0) {
			errorMsg.put("errorcreditPincodeEmpty", "無效的郵遞區號");
		}
		if (expireMonth == null ||expireMonth.trim().length() == 0) {
			errorMsg.put("errorexpireMonthEmpty", "請輸入到期月");
		}
		if (expireYear == null ||expireYear.trim().length() == 0) {
			errorMsg.put("errorexpireYearEmpty", "請輸入到期年");
		}
		if (cvv == null ||cvv.trim().length() == 0) {
			errorMsg.put("errorcvvEmpty", "請輸入cvv");
		}
		if (creditStreet == null ||creditStreet.trim().length() == 0) {
			errorMsg.put("errorcreditStreetEmpty", "請輸入持卡者地址");
		}
		
		if (!errorMsg.isEmpty()) {
			return "/LoginSystem/Dashboard_Credit";
		} 

		Members mb = (Members) model.getAttribute("LoginOK");
		if (mb == null) {
			return "redirect: " + ctx.getContextPath() + "/Login";
		}
//		String phone = mb.getPhone();
//		m = membersService.queryMembers(phone);
		if("".equals(mb.getPhone()) || mb.getPhone() == null) 
		{
			m = membersService.queryMembersGoogleId(mb.getGoogleId());
		}
		else
		{
			m = membersService.queryMembers(mb.getPhone());
		}
		p.setCreditName(creditName);
		p.setCreditNumber(creditNumber);
		p.setCreditPincode(creditPincode);
		p.setExpireMonth(expireMonth);
		p.setExpireYear(expireYear);
		p.setCvv(cvv);
		p.setCreditStreet(creditStreet);
		pH.setCreditName(creditName);
		pH.setCreditNumber(creditNumber);
		pH.setCreditPincode(creditPincode);
		pH.setExpireMonth(expireMonth);
		pH.setExpireYear(expireYear);
		pH.setCvv(cvv);
		pH.setCreditStreet(creditStreet);
		Set<Payment> payments = new HashSet<>();//member存入
		Set<PaymentHistory> paymentHistories = new HashSet<>();//delivery存入
		payments.add(p);//member存入
		paymentHistories.add(pH);//delivery存入
//		dH.setDelivery(d);//deliveryHistory存入
		p.setMembers(m);//delivery存入

		paymentService.savePayment(p);
		paymentService.savePaymentHistory(pH);	

		return "redirect:/Dashboard_Credit";
			
	}
	
	//修改
		@GetMapping("1Dashboard_Credit/{id}")
		public String displaypayment(@PathVariable Integer id,  Model model, HttpSession session) {
			Payment p =  paymentService.findByPrimaryId(id);
			
			model.addAttribute("allPayment", p);
			return "/LoginSystem/Dashboard_Credit";
		}
		//修改
		@RequestMapping(value = "1Dashboard_Credit/{id}")
		public String paymentUpdate(@PathVariable Integer id,HttpServletRequest request, Model model, Payment p, PaymentHistory pH, Members m, LoginBean bean,
				@RequestParam("creditName1") String creditName1,
				@RequestParam("creditNumber1") String creditNumber1,
				@RequestParam("creditPincode1") String creditPincode1,
				@RequestParam("expireMonth1") String expireMonth1,
				@RequestParam("expireYear1") String expireYear1,
				@RequestParam("cvv1") String cvv1,
				@RequestParam("creditStreet1") String creditStreet1) {
			
			Map<String, String> errorMsg = new HashMap<String, String>();
			model.addAttribute("MsgMap", errorMsg);	
			
			if (creditName1 == null ||creditName1.trim().length() == 0) {
				errorMsg.put("errorcreditNameEmpty", "請輸入持卡者姓名");
			}
			if (creditNumber1 == null ||creditNumber1.trim().length() == 0) {
				errorMsg.put("errorcreditNumberEmpty", "請輸入信用卡號碼");
			}
			if (creditPincode1 == null ||creditPincode1.trim().length() == 0) {
				errorMsg.put("errorcreditPincodeEmpty", "無效的郵遞區號");
			}
			if (expireMonth1 == null ||expireMonth1.trim().length() == 0) {
				errorMsg.put("errorexpireMonthEmpty", "請輸入到期月");
			}
			if (expireYear1 == null ||expireYear1.trim().length() == 0) {
				errorMsg.put("errorexpireYearEmpty", "請輸入到期年");
			}
			if (cvv1 == null ||cvv1.trim().length() == 0) {
				errorMsg.put("errorcvvEmpty", "請輸入cvv");
			}
			if (creditStreet1 == null ||creditStreet1.trim().length() == 0) {
				errorMsg.put("errorcreditStreetEmpty", "請輸入持卡者地址");
			}
			
			if (!errorMsg.isEmpty()) {
				return "/LoginSystem/Dashboard_Credit";
			} 

			Members mb = (Members) model.getAttribute("LoginOK");
			if (mb == null) {
				return "redirect: " + ctx.getContextPath() + "/Login";
			}
//			String phone = mb.getPhone();
//			m = membersService.queryMembers(phone);
			if("".equals(mb.getPhone()) || mb.getPhone() == null) 
			{
				m = membersService.queryMembersGoogleId(mb.getGoogleId());
			}
			else
			{
				m = membersService.queryMembers(mb.getPhone());
			}
			
			p.setCreditName(creditName1);
			p.setCreditNumber(creditNumber1);
			p.setCreditPincode(creditPincode1);
			p.setExpireMonth(expireMonth1);
			p.setExpireYear(expireYear1);
			p.setCvv(cvv1);
			p.setCreditStreet(creditStreet1);
			Set<Payment> payments = new HashSet<>();//member存入
//			Set<PaymentHistory> paymentHistories = new HashSet<>();//delivery存入
			payments.add(p);//member存入
//			paymentHistories.add(pH);//delivery存入
//			dH.setDelivery(d);//deliveryHistory存入
			p.setMembers(m);//delivery存入

			paymentService.updatePayment(p);
		

			return "redirect:/Dashboard_Credit";		
		}
		
		@ModelAttribute
		public void commonData(Model model) {
			List<Month> monthList = monthService.getAllMonth();

			model.addAttribute("monthList", monthList);
		}
		
		@GetMapping("Dashboard_Credit/{id}")//刪除
		public String deletepaymentget(Model model, @PathVariable Integer id) {
			Payment p = paymentService.findByPrimaryId(id);
			model.addAttribute("allPayment", p);
			return "/LoginSystem/Dashboard_Credit";
		}
		
		@RequestMapping("Dashboard_Credit/{id}")//刪除
		public String deletepaymentpost(@PathVariable Integer id, Payment p, Members m, Model model, HttpServletRequest req) {

			Members mb = (Members) model.getAttribute("LoginOK");
			if (mb == null) {
				return "redirect: " + ctx.getContextPath() + "/Login";
			}
//			String phone = mb.getPhone();
//			m = membersService.queryMembers(phone);
			if("".equals(mb.getPhone()) || mb.getPhone() == null) 
			{
				m = membersService.queryMembersGoogleId(mb.getGoogleId());
			}
			else
			{
				m = membersService.queryMembers(mb.getPhone());
			}
			paymentService.deletePayment1(id);

			return "redirect:/Dashboard_Credit";	
		}
	
}
