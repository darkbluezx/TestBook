package _05_loginSystem.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import _05_loginSystem.model.Members;


@Controller
@SessionAttributes({"LoginOK","Admin"}) 
public class LogoutController {

	
	@GetMapping("Logout")
	// @ModelAttribute("LoginOK") MemberBean memberBean,
	public String logout(HttpSession session,  Model model, SessionStatus status, HttpServletRequest req) {
		String name = "";
		Members memberBean = (Members) session.getAttribute("LoginOK");
		if (memberBean != null) {
			name = memberBean.getName();
		}
		model.addAttribute("memberName", name);
		status.setComplete();
		session.invalidate();
		return "redirect: " + req.getContextPath();
	}
	
	@GetMapping("LogoutAdmin")
	// @ModelAttribute("LoginOK") MemberBean memberBean,
	public String logoutAdmin(HttpSession session,  Model model, SessionStatus status, HttpServletRequest req) {
		String name = "";
		Members memberBean = (Members) session.getAttribute("Admin");
		if (memberBean != null) {
			name = memberBean.getName();
		}
		model.addAttribute("memberName", name);
		status.setComplete();
		session.invalidate();
		return "redirect: " + req.getContextPath();
	}
}
