package _08_Promotion_com.web.store.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import _08_Promotion_com.web.store.model.DiscountBean;
import _08_Promotion_com.web.store.model.ShoppingDiscountBean;
import _08_Promotion_com.web.store.service.ShoppingDiscountService;

@Controller
public class ShoppingDiscountController {
	ShoppingDiscountService service;
	
	@Autowired 
	public void setService(ShoppingDiscountService service) {
		this.service = service;
	}
	
//==user search===
	@RequestMapping("/ShoppingDiscount")
	public String list(Model model) {
		List<ShoppingDiscountBean>  list = service.getAllShoppingDiscounts();
		model.addAttribute("shoppingDiscounts", list);
		return "ShoppingDiscount";
	}
	

	
	//=======
	@GetMapping(value = "/ShoppingDiscountAdd")
	public String getAddNewShoppingDiscountForm(Model model) {
		ShoppingDiscountBean sdb = new ShoppingDiscountBean();
		model.addAttribute("shoppingDiscountBean", sdb); 
		return "ShoppingDiscountAdd";
	}
	
	@PostMapping(value = "/ShoppingDiscountAdd")
	public String processAddNewShoppingDiscountForm(@ModelAttribute("shoppingDiscountBean") ShoppingDiscountBean sdb) { 
		
	    service.addShoppingDiscount(sdb);
	    return "redirect:/";
	}
	
	
	
	
	//==Manager search==
		@GetMapping("/ShoppingDiscountSearch")
		public String ShoppingDiscountSearchList(Model model) {
			List<ShoppingDiscountBean>  list = service.getAllShoppingDiscounts();
			model.addAttribute("shoppingDiscounts", list);
			return "/ShoppingDiscountSearch";
		}
	
	//======modify--read data---
	@GetMapping("/modifyShoppingDiscount/{id}")
		public String editDiscountForm(Model model, @PathVariable Integer id) {
		ShoppingDiscountBean bean = service.getShoppingDiscountById(id);
		model.addAttribute("shoppingDiscountBean", bean);
		return "/ShoppingDiscountModify";
	}
		
	
	//=====modify--check not error,write in SQL
	@PostMapping("/modifyShoppingDiscount/{id}")
		
	public String modifyShoppingDiscountData(@ModelAttribute("shoppingDiscountBean")ShoppingDiscountBean bean) {
	service.updateShoppingDiscount(bean);	
	return "redirect:/DiscountSearch";
	}
				
		
	
	
	
}
