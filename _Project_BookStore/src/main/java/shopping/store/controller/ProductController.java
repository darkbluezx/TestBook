package shopping.store.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import _05_loginSystem.model.Members;
import shopping.store.model.CHBean;
import shopping.store.model.QLTIBean;
import shopping.store.model.StoreBean;
import shopping.store.service.ProductService;

@Controller
@SessionAttributes("Admin")
public class ProductController {
	@Autowired
	ProductService service;
	@Autowired
	ServletContext ctx;

//		@RequestMapping("/index")
//		public String index(Model model, HttpServletRequest req) {
//			return "index";
//		}
		
		@RequestMapping("/store_show")
		public String shownortharea (Model model, HttpServletRequest req) {
			List<StoreBean> shownorthstore = service.getProductsByArea("北部");
			model.addAttribute("shownorthstore", shownorthstore);
			List<StoreBean> showweststore = service.getProductsByArea("中部");
			model.addAttribute("showweststore", showweststore);
			List<StoreBean> showsouthstore = service.getProductsByArea("南部");
			model.addAttribute("showsouthstore", showsouthstore);
			List<StoreBean> showeaststore = service.getProductsByArea("東部");
			model.addAttribute("showeaststore", showeaststore);
			return "store_show";
		}
		
		@PostMapping(value = "/store_show/singlename", produces = { "application/json" })
		public ResponseEntity<StoreBean> singlename(@RequestParam(value="name",  defaultValue = "(未輸入)") String name)  {
			StoreBean bean = service.getStoreTextOnly(name);
			ResponseEntity<StoreBean> re = new ResponseEntity<>(bean, HttpStatus.OK);
			return re;
		}
		
		@RequestMapping(value = "/store_manager")
		public String store_manager(Model model, HttpServletRequest req) {
			Members m = (Members) model.getAttribute("Admin");
			if (m == null) {
				return "redirect: " + ctx.getContextPath() + "/Login";
			}
			List<StoreBean> beans = service.getAllProducts();
			model.addAttribute("stores", beans);
			return "store_manager";
		}
		
		@ModelAttribute
		public void addstoremodel(Model model) {
			StoreBean sb = new StoreBean();
			model.addAttribute("storebean", sb);
		}
		
		// 接收使用者輸入新增資料
		@RequestMapping(value = "/store_manager", method = RequestMethod.POST)
		public String processAddNewStoreForm(@ModelAttribute("add") StoreBean sb, BindingResult result) {
			service.addProduct(sb);
			return "redirect:/store_manager";
		}
		
		
		@RequestMapping("/store_manager/delete")
		public String deleteStoreById(@RequestParam("id") Integer id, Model model, HttpServletRequest req) {
			service.deleteById(id);
			return "redirect:/store_manager";
		}
		
		
		// 接收使用者更新輸入資料
		@RequestMapping(value = "/store_manager/update", method = RequestMethod.POST)
		public String processUpdateNewStoreForm(@ModelAttribute("update") StoreBean sb, BindingResult result) {
			service.updateProduct(sb);
			return "redirect:/store_manager";
		}
		
		@RequestMapping("/logistics_manager")
		public String logistics_manager(Model model, HttpServletRequest req) {
			Members m = (Members) model.getAttribute("Admin");
			if (m == null) {
				return "redirect: " + ctx.getContextPath() + "/Login";
			}
			List<CHBean> beans = service.getAllLogistics();
			model.addAttribute("logistics", beans);
			return "logistics_manager";
		}
		
		
		@RequestMapping("/logistics_view")
		public String logistics_view(@RequestParam("id") String id, Model model, HttpServletRequest req) {
			Members m = (Members) model.getAttribute("Admin");
			if (m == null) {
				return "redirect: " + ctx.getContextPath() + "/Login";
			}
			QLTIBean qlti = service.getQLTIById(id);
			model.addAttribute("view", qlti);
			CHBean ch = service.getCHById(id);
			model.addAttribute("view2", ch);
			return "logistics_view";
		}
}