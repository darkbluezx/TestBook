package _05_loginSystem.controller;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;

import _00_init.util.GetCartNo;
import _03_cart.web.store.model.Cart;
import _03_cart.web.store.model.CartDetailBean;
import _03_cart.web.store.model.CartMasterBean;
import _03_cart.web.store.service.CartDetailService;
import _03_cart.web.store.service.CartMasterService;
import _05_loginSystem.model.LoginBean;
import _05_loginSystem.model.Members;
import _05_loginSystem.model.MembersHistory;
import _05_loginSystem.service.DeliveryService;
import _05_loginSystem.service.MembersService;
import _05_loginSystem.validate.LoginBeanValidator;
import _07_Promotion_00_init.util.GlobalService;


@Controller
@SessionAttributes({"LoginOK","members","delivery", "Admin","Cart","cartMasterBean"})
public class RegisterPhoneController {
	
	String loginForm = "/LoginSystem/Login";
	String loginOut = "/LoginSystem/Logout";
	String ResetPassword = "/LoginSystem/ResetPassword";
	String SetNewPassword = "/LoginSystem/SetNewPassword";
	
	@Autowired
	MembersService membersService;
	@Autowired
	DeliveryService deliveryService;
	@Autowired
	ServletContext ctx;
	@Autowired
	CartMasterService CMservice;
	@Autowired
	CartDetailService CDservice;
	
	@GetMapping("ResetPassword")
	public String resetPassword(Model model) {

		return "/LoginSystem/ResetPassword";
	}
	
	@RequestMapping(value = "SetNewPassword", params = "phone")
	public String setNewPassword(HttpServletRequest request, 
			Model model, Members m, MembersHistory mH, 
			@RequestParam("phone") String phone) {
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("MsgMap", errorMsg);	
		
		if (phone == null || phone.trim().length() == 0) {
			errorMsg.put("errorPhoneEmpty", "手機註冊欄必須輸入");
		}
		Pattern pattern = Pattern.compile("^[0][9][0-9]{8}$");
		Matcher matcher = pattern.matcher(phone);

		if (matcher.matches() == false) {
			errorMsg.put("errorPhoneMatches", "不符合手機號格式");
		}
		if (!errorMsg.isEmpty()) {
			return "/LoginSystem/ResetPassword";
		}
		if (!membersService.phoneExists(phone)) {
			errorMsg.put("errorPhoneDup", "此手機不存在，請重新輸入");
			return "/LoginSystem/ResetPassword";
		} else {
			m.setPhone(phone); 	
			m.getId();
			model.addAttribute("members", m);	
			return "/LoginSystem/SetNewPassword";
		}
	}
	
	@RequestMapping(value = "newPasswordRegister", params = "password")
	public String newPasswordRegister(HttpServletRequest request, Model model, 
			Members m, MembersHistory mH, @RequestParam("password") String password) {
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("MsgMap", errorMsg);	
		
		if (password == null ||password.trim().length() == 0) {
			errorMsg.put("errorPasswordEmpty", "密碼欄必須輸入");
		}
		if (errorMsg.isEmpty()) {
			Pattern pattern = Pattern.compile("((?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,})");
			Matcher matcher = pattern.matcher(password);
	
			if (matcher.matches() == false) {
				errorMsg.put("passwordError", "密碼至少含有一個大寫字母和小寫字母，且長度不能小於八位數");
			}
		}
		if (!errorMsg.isEmpty()) {
			return "/LoginSystem/SetNewPassword";
		} 
		String phone = m.getPhone();
		password = GlobalService.getMD5Endocing(
				GlobalService.encryptString(password));
		m.setPassword(password);
		mH.setPassword(password);
		m.setPhone(phone);
		mH.setPhone(phone);

		Set<MembersHistory> mHSet = new LinkedHashSet<>();
		mHSet.add(mH);
		mH.setMembers(m);

		membersService.updateMembersPassword(m);
		membersService.updateMembersHistoryPassword(mH);

		return "/LoginSystem/RegisterSuccess";
			
	}	

	@GetMapping("Login")
	public String login00(HttpServletRequest request, Model model, 
		@CookieValue(value="phone", required = false) String phone,
		@CookieValue(value="password", required = false) String password, 
		@CookieValue(value="rm", required = false) Boolean rm 
			) {
		if (phone == null)
			phone = "";
		if (password == null) {
			password = "";
		} else {
			password = GlobalService.decryptString(GlobalService.KEY, password);
		}
		
		if (rm != null) {
			rm = Boolean.valueOf(rm);
		} else {
			rm = false;
		}
			
		LoginBean bean = new LoginBean(phone, password, rm);
		
		model.addAttribute(bean);		
		return loginForm;
	}
	
	private void setCart(Model model) {
		Members m = (Members) model.getAttribute("LoginOK");
		CartMasterBean cmb = new CartMasterBean();
		if (m != null ) {
			List<CartMasterBean> lcmb = new ArrayList<>();
			
			String id = m.getId().toString();
			lcmb = CMservice.getCartByMemberId(id);
			if (lcmb.size() == 0) {
				GetCartNo cartNo = new GetCartNo();
				String k = cartNo.getKey();
				cmb.setMemberId(id);
				cmb.setCartNo(k);
				cmb.setAmount(0.0);
				cmb.setDiscount((float) 100);
				CMservice.addCart(cmb);
			} else {
				for (int i = 0; i < lcmb.size(); i++) {
					cmb = lcmb.get(i);
					if (cmb.getInvalidDate() == null) {
						break;
					}
				}
			}
			model.addAttribute("cartMasterBean", cmb);
		}
		Cart Cart = new Cart();
		if (m != null ) {
			List<CartDetailBean> lcdb = new ArrayList<>();
			String id = m.getId().toString();
			String cartno = "";
			List<CartMasterBean> lcmb = CMservice.getCartByMemberId(id);
			if (lcmb.size() != 0) {
				for (int i = 0; i < lcmb.size(); i++) {
					cartno = lcmb.get(i).getCartNo();
				}

			}
			lcdb = CDservice.getCartDetailByMaster(cartno);
			if (lcdb.size() != 0) {
				for (int i = 0; i < lcdb.size(); i++) {
					Cart.addToCart(lcdb.get(i).getProductId(), lcdb.get(i));
				}

			}
			model.addAttribute("Cart", Cart);
		}
		
	}

	@PostMapping("Login")
	public String checkAccount(
			@ModelAttribute("loginBean") LoginBean bean,
			BindingResult result, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		
		LoginBeanValidator validator = new LoginBeanValidator();
		validator.validate(bean, result);
		if (result.hasErrors()) {
			return loginForm;
		}
		String password =bean.getPassword();
		Members mb = null;
		try {
			// 呼叫 loginService物件的 checkIDPassword()，傳入userid與password兩個參數
			String phone = bean.getPhone();
			mb = membersService.checkPhonePassword(bean.getPhone(),  
					GlobalService.getMD5Endocing(GlobalService.encryptString(password)));
			
			if (mb != null && "admin".equals(phone)) {
				Members m = membersService.queryMembers(bean.getPhone());
				model.addAttribute("Admin", m);
				System.out.println("Admin");
			} else {
				if (mb != null && !"admin".equals(phone)) {	
			
				// OK, 登入成功, 將mb物件放入Session範圍內，識別字串為"LoginOK"
				Members m = membersService.queryMembers(bean.getPhone());
				model.addAttribute("LoginOK", m);
				System.out.println("LoginOK");
				HttpSession session = request.getSession();
				processCookies(bean, request, response);
				String nextPath = (String)session.getAttribute("requestURI");
				if (nextPath == null) {
					nextPath = request.getContextPath();
				}
				setCart(model);
//				return "redirect:/Dashboard_PersonInfo";
				return "redirect: " + nextPath;
				} else {
				// NG, 登入失敗, userid與密碼的組合錯誤，放相關的錯誤訊息到 errorMsgMap 之內
				result.rejectValue("invalidCredentials", "", "該帳號不存在或密碼錯誤");
				return loginForm;
			}
			
		}
			} catch (RuntimeException ex) {
			result.rejectValue("phone", "", ex.getMessage());
			return loginForm;
		}
		HttpSession session = request.getSession();
		processCookies(bean, request, response);
		String nextPath = (String)session.getAttribute("requestURI");
		if (nextPath == null) {
			nextPath = request.getContextPath();
		}
//		return "redirect:/Dashboard_PersonInfo1";
		return "redirect: " + nextPath;
	}
	
	private void processCookies(LoginBean bean, HttpServletRequest request, HttpServletResponse response) {
		Cookie cookiePhone = null;
		Cookie cookiePassword = null;
		Cookie cookieRememberMe = null;
		String phone = bean.getPhone();
		String password = bean.getPassword();
		Boolean rm = bean.isRememberMe();
		
		// rm存放瀏覽器送來之RememberMe的選項，如果使用者對RememberMe打勾，rm就不會是null
		if (bean.isRememberMe()) {
			cookiePhone = new Cookie("phone", phone);
			cookiePhone.setMaxAge(7 * 24 * 60 * 60); // Cookie的存活期: 七天
			cookiePhone.setPath(request.getContextPath());

			String encodePassword = GlobalService.encryptString(password);
			cookiePassword = new Cookie("password", encodePassword);
			cookiePassword.setMaxAge(7 * 24 * 60 * 60);
			cookiePassword.setPath(request.getContextPath());

			cookieRememberMe = new Cookie("rm", "true");
			cookieRememberMe.setMaxAge(7 * 24 * 60 * 60);
			cookieRememberMe.setPath(request.getContextPath());
		} else { // 使用者沒有對 RememberMe 打勾
			cookiePhone = new Cookie("phone", phone);
			cookiePhone.setMaxAge(0); // MaxAge==0 表示要請瀏覽器刪除此Cookie
			cookiePhone.setPath(request.getContextPath());

			String encodePassword = GlobalService.encryptString(password);
			cookiePassword = new Cookie("password", encodePassword);
			cookiePassword.setMaxAge(0);
			cookiePassword.setPath(request.getContextPath());

			cookieRememberMe = new Cookie("rm", "true");
			cookieRememberMe.setMaxAge(0);
			cookieRememberMe.setPath(request.getContextPath());
		}
		response.addCookie(cookiePhone);
		response.addCookie(cookiePassword);
		response.addCookie(cookieRememberMe);
		
	}

	@GetMapping("login")
	public String login() {
		return "/LoginSystem/Login";
	}
	
//	@GetMapping("/")
//	public String index() {
//		return "/LoginSystem/index";
//	}
	
	@RequestMapping("CaptchaInput")
	public String captchaInput() {
		return "/LoginSystem/CaptchaInput";
	}
	
	@RequestMapping("Register")
	public String register() {
		return "/LoginSystem/Register";
	}
	
	@RequestMapping("SetPassword")
	public String setPassword() {
		return "/LoginSystem/SetPassword";
	}
	
	@RequestMapping("RegisterSuccess")
	public String registerSuccess() {
		return "/LoginSystem/RegisterSuccess";
	}
	
	@RequestMapping("PhoneVerification")
	public String phoneVerification() {
		return "/LoginSystem/PhoneVerification";
	}
	
	@RequestMapping("AccountBeUsed")
	public String accountBeUsedn() {
		return "/LoginSystem/AccountBeUsed";
	}
	
	@RequestMapping(value = "phoneRegister", params = "phone")
	public String phone(HttpServletRequest request, Model model, Members m, MembersHistory mH, @RequestParam("phone") String phone) {
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("MsgMap", errorMsg);	
		
		if (phone == null || phone.trim().length() == 0) {
			errorMsg.put("errorPhoneEmpty", "手機註冊欄必須輸入");
		}
		Pattern pattern = Pattern.compile("^[0][9][0-9]{8}$");
		Matcher matcher = pattern.matcher(phone);

		if (matcher.matches() == false) {
			errorMsg.put("errorPhoneMatches", "不符合手機號格式");
		}
		if (!errorMsg.isEmpty()) {
			return "/LoginSystem/Register";
		}
		if (membersService.phoneExists(phone)) {
			errorMsg.put("errorPhoneDup", "此手機已存在，請換新手機註冊");
			
			Members mb = membersService.queryMembers(phone);
			model.addAttribute("member", mb);
			
			return "/LoginSystem/AccountBeUsed";
		} else {
			m.setPhone(phone); 	
			
			model.addAttribute("members", m);	
			return "/LoginSystem/CaptchaInput";
		}

	}	
	
	@RequestMapping(value = "passwordRegister", params = "password")
	public String password(HttpServletRequest request, Model model, Members m, MembersHistory mH, @RequestParam("password") String password) {
		Map<String, String> errorMsg = new HashMap<String, String>();
		model.addAttribute("MsgMap", errorMsg);	
		
		if (password == null ||password.trim().length() == 0) {
			errorMsg.put("errorPasswordEmpty", "密碼欄必須輸入");
		}
		if (errorMsg.isEmpty()) {
			Pattern pattern = Pattern.compile("((?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,})");
			Matcher matcher = pattern.matcher(password);
	
			if (matcher.matches() == false) {
				errorMsg.put("passwordError", "密碼至少含有一個大寫字母和小寫字母，且長度不能小於八位數");
			}
		}
		if (!errorMsg.isEmpty()) {
			return "/LoginSystem/SetPassword";
		} 
		String phone = m.getPhone();
		password = GlobalService.getMD5Endocing(
				GlobalService.encryptString(password));
		Timestamp ts = new java.sql.Timestamp(System.currentTimeMillis());
		m.setPassword(password);
		m.setRegisterDate(ts);
		mH.setPassword(password);
		mH.setRegisterDate(ts);
		mH.setPhone(phone);

		Set<MembersHistory> mHSet = new LinkedHashSet<>();
		mHSet.add(mH);
		mH.setMembers(m);

		membersService.saveMembers(m);
		membersService.saveMembersHistory(mH);	

		return "/LoginSystem/RegisterSuccess";
			
	}	
	
	@RequestMapping(value = "/googleVerify", method = RequestMethod.POST)
	public void verifyToken(HttpSession session, String idtokenstr, Model model) {
		System.out.println(idtokenstr);
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(
				new NetHttpTransport(), JacksonFactory.getDefaultInstance())
				.setAudience(Collections.singletonList("851880125562-pkm9fbj20e65jk9g71r6ttk5i894rrdj.apps.googleusercontent.com")).build();
		GoogleIdToken idToken = null;
		try {
			idToken = verifier.verify(idtokenstr);
		} catch (GeneralSecurityException e) {
			System.out.println("驗證時出現GeneralSecurityException異常");
		} catch (IOException e) {
			System.out.println("驗證時出現IOException異常");
		}
		if (idToken != null) {
			System.out.println("驗證成功.");
			Payload payload = idToken.getPayload();
			String userId = payload.getSubject();
			String email = payload.getEmail();
//			boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
			String name = (String) payload.get("name");
			String pictureUrl = (String) payload.get("picture");
//			String locale = (String) payload.get("locale");
//			String familyName = (String) payload.get("family_name");
//			String givenName = (String) payload.get("given_name");
			boolean b = membersService.googleIdExists(userId);
			Members mb = new Members();
			if (!b) {
				Timestamp ts = new java.sql.Timestamp(System.currentTimeMillis());
				mb.setRegisterDate(ts);
				mb.setName(name);
				mb.setMail(email);
				mb.setGoogleId(userId);
				membersService.saveMembers(mb);		
			}
			else {
				mb = membersService.queryMembersGoogleId(userId);
			}
			//Members m = membersService.queryMembersName(name);
								   
			if (mb != null) {
			session.setAttribute("LoginOK", mb);
			}

		} else {
			System.out.println("Invalid ID token.");
		}
	}

	
}