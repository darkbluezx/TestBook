package _05_loginSystem.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import _05_loginSystem.model.Members;



@Controller
@SessionAttributes({ "LoginOK","members","Admin"})
public class LoginRestrictController {

	@Autowired
	ServletContext context;
	
	@GetMapping("Dashboard_PersonInfo")
	public String dashboard_PersonInfo(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		Members m = (Members) model.getAttribute("LoginOK");
		if (m == null) {
			return "redirect: " + context.getContextPath() + "/Login";
		}

		return "/LoginSystem/Dashboard_PersonInfo";
	}
	
	@RequestMapping("Dashboard_Address")
	public String dashboard_Address(Model model, HttpServletRequest request, HttpServletResponse response) {
		Members m = (Members) model.getAttribute("LoginOK");
		if (m == null) {
			return "redirect: " + context.getContextPath() + "/Login";
		}
		return "/LoginSystem/Dashboard_Address";
	}
	
	@RequestMapping("Dashboard_Credit")
	public String dashboard_Credit(Model model, HttpServletRequest request, HttpServletResponse response) {
		Members m = (Members) model.getAttribute("LoginOK");
		if (m == null) {
			return "redirect: " + context.getContextPath() + "/Login";
		}
		return "/LoginSystem/Dashboard_Credit";
	}
	
	@RequestMapping("Dashboard_Marketing")
	public String dashboard_Marketing(Model model, HttpServletRequest request, HttpServletResponse response) {
		Members m = (Members) model.getAttribute("LoginOK");
		if (m == null) {
			return "redirect: " + context.getContextPath() + "/Login";
		}
		return "/LoginSystem/Dashboard_Marketing";
	}
	
	@RequestMapping("Dashboard_Notice")
	public String dashboard_Notice(Model model, HttpServletRequest request, HttpServletResponse response) {
		Members m = (Members) model.getAttribute("LoginOK");
		if (m == null) {
			return "redirect: " + context.getContextPath() + "/Login";
		}
		return "/LoginSystem/Dashboard_Notice";
	}
	
	@RequestMapping("Dashboard_ShoppingList")
	public String dashboard_ShoppingList(Model model, HttpServletRequest request, HttpServletResponse response) {
		Members m = (Members) model.getAttribute("LoginOK");
		if (m == null) {
			return "redirect: " + context.getContextPath() + "/Login";
		}
		return "/LoginSystem/Dashboard_ShoppingList";
	}
	
	@GetMapping("Dashboard_PersonInfo1")
	public String dashboard_PersonInfo1(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		Members m = (Members) model.getAttribute("Admin");
		if (m == null) {
			return "redirect: " + context.getContextPath() + "/Login";
		}

		return "/LoginSystem/Dashboard_PersonInfo";
	}
	
	@RequestMapping("Dashboard_Address1")
	public String dashboard_Address1(Model model, HttpServletRequest request, HttpServletResponse response) {
		Members m = (Members) model.getAttribute("Admin");
		if (m == null) {
			return "redirect: " + context.getContextPath() + "/Login";
		}
		return "/LoginSystem/Dashboard_Address";
	}
	
	@RequestMapping("Dashboard_Credit1")
	public String dashboard_Credit1(Model model, HttpServletRequest request, HttpServletResponse response) {
		Members m = (Members) model.getAttribute("Admin");
		if (m == null) {
			return "redirect: " + context.getContextPath() + "/Login";
		}
		return "/LoginSystem/Dashboard_Credit";
	}
	
	@RequestMapping("Dashboard_Marketing1")
	public String dashboard_Marketing1(Model model, HttpServletRequest request, HttpServletResponse response) {
		Members m = (Members) model.getAttribute("Admin");
		if (m == null) {
			return "redirect: " + context.getContextPath() + "/Login";
		}
		return "/LoginSystem/Dashboard_Marketing";
	}
	
	@RequestMapping("Dashboard_Notice1")
	public String dashboard_Notice1(Model model, HttpServletRequest request, HttpServletResponse response) {
		Members m = (Members) model.getAttribute("Admin");
		if (m == null) {
			return "redirect: " + context.getContextPath() + "/Login";
		}
		return "/LoginSystem/Dashboard_Notice";
	}
	
	@RequestMapping("Dashboard_ShoppingList1")
	public String dashboard_ShoppingList1(Model model, HttpServletRequest request, HttpServletResponse response) {
		Members m = (Members) model.getAttribute("Admin");
		if (m == null) {
			return "redirect: " + context.getContextPath() + "/Login";
		}
		return "/LoginSystem/Dashboard_ShoppingList";
	}
}
