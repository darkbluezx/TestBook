package _08_Promotion_com.web.store.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import _08_Promotion_com.web.store.model.DiscountBean;
import _08_Promotion_com.web.store.model.FreeBiesBean;
import _08_Promotion_com.web.store.service.DiscountService;
import _09_Book.model.CompanyBean;

@Controller
public class DiscountController {
	DiscountService service;
	
	@Autowired 
	public void setService(DiscountService service) {
		this.service = service;
	}
	
	//==user search===
	@RequestMapping("/Discount")
	public String list(Model model) {
		List<DiscountBean>  list = service.getAllDiscounts();
		model.addAttribute("discounts", list);
		return "Discount";
	}
	
		
	
	//Add======
	@GetMapping(value = "/DiscountAdd")
	public String getAddNewDiscountForm(Model model) {
		DiscountBean db = new DiscountBean();
		model.addAttribute("discountBean", db); 
		return "DiscountAdd";
	}
	
	//Add From
	@PostMapping(value = "/DiscountAdd")
	public String processAddNewDiscountForm(@ModelAttribute("DiscountBean") DiscountBean db) { 
		
		
		service.addDiscount(db);		
		
		return "redirect:/Discount";
	}

	//===出版社
	@ModelAttribute("companyList")
	public Map<Integer, String> getCompanyList() {
		Map<Integer, String> companyMap = new HashMap<>();
		List<CompanyBean> list = service.getCompanyList();
		for (CompanyBean cb : list) {
		companyMap.put(cb.getId(), cb.getName());
	}
		return companyMap;
	}
	
	
	
	//==Manager search==
	@GetMapping("/DiscountSearch")
	public String DiscountSearchList(Model model) {
	List<DiscountBean> list = service.getAllDiscounts();
	model.addAttribute("discounts", list);
	return "/DiscountSearch";
	}
			
				
	//======modify--read data---
	@GetMapping("/modifyDiscount/{id}")
		public String editDiscountForm(Model model, @PathVariable Integer id) {
		DiscountBean bean = service.getDiscountById(id);
		model.addAttribute("discountBean", bean);
		return "/DiscountModify";
	}
			
	//=====modify--check not error,write in SQL
	@PostMapping("/modifyDiscount/{id}")
	
	public String modifyDiscountData(@ModelAttribute("discountBean") DiscountBean bean,int companyId) {
	service.updateDiscount(bean,companyId);	
	return "redirect:/DiscountSearch";
	}
	
	

		
	
}
