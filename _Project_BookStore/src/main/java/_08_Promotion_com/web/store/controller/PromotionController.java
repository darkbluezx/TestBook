package _08_Promotion_com.web.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller  
public class PromotionController {

	@RequestMapping("/offers")
	public String offers() {
		return "offers";
	}
	
	@RequestMapping("/promotion_Manager")
	public String promotionManager() {
		return "promotion_Manager";
	}
		

}
