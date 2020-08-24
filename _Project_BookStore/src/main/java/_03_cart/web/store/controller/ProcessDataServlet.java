package _03_cart.web.store.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _03_cart.web.store.model.Cart;
import _03_cart.web.store.model.MemberBean;


// OrderConfirm.jsp 呼叫本程式。
//@WebServlet("/_03_cart/ProcessData.do")
public class ProcessDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String finalDecision = request.getParameter("finalDecision");
		HttpSession session = request.getSession(false);
		if (session == null) { // 使用逾時
			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
			return;
		}
//		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
//		if (mb == null) {
//			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp"  );
//			return;
//		}
		Cart sc = (Cart) session.getAttribute("Cart");
		if (sc == null) {
			// 處理訂單時如果找不到購物車(通常是Session逾時)，沒有必要往下執行
			// 導向首頁
			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
			return;
		}
		// 如果使用者取消訂單
		if (finalDecision.equals("CANCEL")) {
			session.removeAttribute("Cart");
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath()));
			return; // 一定要記得 return
		}

		MemberBean memberBean = (MemberBean) session.getAttribute("memberBean");
		String shippingAddress = request.getParameter("ShippingAddress"); // 出貨地址
		memberBean.setAddress(shippingAddress);
		session.setAttribute("memberBean", memberBean);
	
		RequestDispatcher rd = request.getRequestDispatcher("displayOrder");
	    rd.forward(request, response);

	}
}