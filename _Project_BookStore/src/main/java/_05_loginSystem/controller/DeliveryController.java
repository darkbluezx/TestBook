package _05_loginSystem.controller;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import _05_loginSystem.model.Delivery;
import _05_loginSystem.model.DeliveryHistory;
import _05_loginSystem.model.LoginBean;
import _05_loginSystem.model.Members;
import _05_loginSystem.service.DeliveryService;
import _05_loginSystem.service.MembersService;


@Controller
@SessionAttributes({"LoginOK","members","delivery","allDelivery"})
public class DeliveryController {
	
	@Autowired
	MembersService membersService;
	@Autowired
	DeliveryService deliveryService;
	@Autowired
	ServletContext ctx;
	
	@GetMapping(value = "Dashboard_Address" , produces= {"text/html"}) //新增
	public String queryAllDeliveryByMembers(Model model, Members m, LoginBean bean) {
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
		List<Delivery> d = deliveryService.getMembersDelivery(m);
		model.addAttribute("allDelivery", d);
		return "/LoginSystem/Dashboard_Address";
	}
	
	@RequestMapping(value = "deliverySave", params = {"deliveryName","deliveryPhone","pincode","city","region","street"})//新增
	public String address(HttpServletRequest request, Model model, Delivery d, DeliveryHistory dH, Members m, LoginBean bean,
			@RequestParam("deliveryName") String deliveryName,
			@RequestParam("deliveryPhone") String deliveryPhone,
			@RequestParam("pincode") String pincode,
			@RequestParam("city") String city,
			@RequestParam("region") String region,
			@RequestParam("street") String street) {
		
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("MsgMap", errorMsg);	
		
		if (deliveryName == null ||deliveryName.trim().length() == 0) {
			errorMsg.put("errordeliveryNameEmpty", "請輸入你的名子");
		}
		if (deliveryPhone == null ||deliveryPhone.trim().length() == 0) {
			errorMsg.put("errordeliveryPhoneEmpty", "請輸入行動電話號碼");
		}
		if (pincode == null ||pincode.trim().length() == 0) {
			errorMsg.put("errorpincodeEmpty", "無效的郵遞區號");
		}
		if (city == null ||city.trim().length() == 0) {
			errorMsg.put("errorcityEmpty", "請輸入城市");
		}
		if (region == null ||region.trim().length() == 0) {
			errorMsg.put("errorregionEmpty", "請輸入地區");
		}
		if (street == null ||street.trim().length() == 0) {
			errorMsg.put("errorstreetEmpty", "請輸入地址");
		}
		if (errorMsg.isEmpty()) {
			Pattern pattern = Pattern.compile("^[0][9][0-9]{8}$");
			Matcher matcher = pattern.matcher(deliveryPhone);

			if (matcher.matches() == false) {
				errorMsg.put("errordeliveryPhoneMatches", "請輸入有效行動電話號碼");
			}
		}
		if (!errorMsg.isEmpty()) {
			return "/LoginSystem/Dashboard_Address";
		} 

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
		d.setDeliveryName(deliveryName);
		d.setDeliveryPhone(deliveryPhone);
		d.setPincode(pincode);
		d.setCity(city);
		d.setRegion(region);
		d.setStreet(street);
		dH.setDeliveryName(deliveryName);
		dH.setDeliveryPhone(deliveryPhone);
		dH.setPincode(pincode);
		dH.setCity(city);
		dH.setRegion(region);
		dH.setStreet(street);
		Set<Delivery> deliverys = new HashSet<>();//member存入
		Set<DeliveryHistory> dHistoryHistories = new HashSet<>();//delivery存入
		deliverys.add(d);//member存入
		dHistoryHistories.add(dH);//delivery存入
//		dH.setDelivery(d);//deliveryHistory存入
		d.setMembers(m);//delivery存入

		deliveryService.saveDelivery(d);
		deliveryService.saveDeliveryHistory(dH);	

		return "redirect:/Dashboard_Address";
			
	}
	//修改
	@GetMapping("1Dashboard_Address/{id}")
	public String displaydelivery(@PathVariable Integer id,  Model model) {
		Delivery d = deliveryService.findByPrimaryId(id);
		model.addAttribute("allDelivery",d);
		return "/LoginSystem/Dashboard_Address";
	}
	//修改
	@RequestMapping(value = "1Dashboard_Address/{id}", params = {"deliveryName1","deliveryPhone1","pincode1","city1","region1","street1"})
	public String deliveryUpdate(@PathVariable Integer id,HttpServletRequest request, Model model, Delivery d, DeliveryHistory dH, Members m, LoginBean bean,
			@RequestParam("deliveryName1") String deliveryName1,
			@RequestParam("deliveryPhone1") String deliveryPhone1,
			@RequestParam("pincode1") String pincode1,
			@RequestParam("city1") String city1,
			@RequestParam("region1") String region1,
			@RequestParam("street1") String street1) {
		
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("MsgMap", errorMsg);	
		
		if (deliveryName1 == null ||deliveryName1.trim().length() == 0) {
			errorMsg.put("errordeliveryNameEmpty", "請輸入你的名子");
		}
		if (deliveryPhone1 == null ||deliveryPhone1.trim().length() == 0) {
			errorMsg.put("errordeliveryPhoneEmpty", "請輸入行動電話號碼");
		}
		if (pincode1 == null ||pincode1.trim().length() == 0) {
			errorMsg.put("errorpincodeEmpty", "無效的郵遞區號");
		}
		if (city1 == null ||city1.trim().length() == 0) {
			errorMsg.put("errorcityEmpty", "請輸入城市");
		}
		if (region1 == null ||region1.trim().length() == 0) {
			errorMsg.put("errorregionEmpty", "請輸入地區");
		}
		if (street1 == null ||street1.trim().length() == 0) {
			errorMsg.put("errorstreetEmpty", "請輸入地址");
		}
		if (errorMsg.isEmpty()) {
			Pattern pattern = Pattern.compile("^[0][9][0-9]{8}$");
			Matcher matcher = pattern.matcher(deliveryPhone1);

			if (matcher.matches() == false) {
				errorMsg.put("errordeliveryPhoneMatches", "請輸入有效行動電話號碼");
			}
		}
		if (!errorMsg.isEmpty()) {
			return "/LoginSystem/Dashboard_Address";
		} 

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
		d.setDeliveryName(deliveryName1);
		d.setDeliveryPhone(deliveryPhone1);
		d.setPincode(pincode1);
		d.setCity(city1);
		d.setRegion(region1);
		d.setStreet(street1);
		Set<Delivery> deliverys = new HashSet<>();
//		Set<DeliveryHistory> dHistoryHistories = new HashSet<>();
		deliverys.add(d);
//		dHistoryHistories.add(dH);
//		dH.setDelivery(d);
		d.setMembers(m);

		deliveryService.updateDelivery(d);
	

		return "redirect:/Dashboard_Address";		
	}
		
		@GetMapping("Dashboard_Address/{id}")//刪除
		public String deletedeliveryget(Model model, @PathVariable Integer id) {
			Delivery d = deliveryService.findByPrimaryId(id);
			model.addAttribute("allDelivery", d);
			return "/LoginSystem/Dashboard_Address";
		}
		
		@RequestMapping("Dashboard_Address/{id}")//刪除
		public String deletedeliverypost(@PathVariable Integer id, Delivery d, Members m, Model model, HttpServletRequest req) {
			
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
			deliveryService.deleteDelivery1(id);

			return "redirect:/Dashboard_Address";	
		}
		
}
