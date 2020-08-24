package _03_cart.web.store.controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _03_cart.web.store.dao.CartDetailDao;
import _03_cart.web.store.dao.impl.CartDetailDaoImpl;
import _03_cart.web.store.model.Cart;
import _03_cart.web.store.model.MemberBean;

// 本類別可修改購物車內的商品資料，包括刪除某項商品，修改某項商品的數量
//@WebServlet("/_03_cart/UpdateItem.do")
public class UpdateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session = null;
	CartDetailDao dao;
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		session = request.getSession(false);
		if (session == null) {      // 使用逾時
			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp");
			return;
		}
		//取出session物件內的ShoppingCart物件
		Cart cart= (Cart)session.getAttribute("Cart");
		MemberBean memberBean = (MemberBean) session.getAttribute("memberBean");

		
		if (cart == null) {
			// 如果找不到購物車(通常是Session逾時)，沒有必要往下執行
			// 導向首頁
			response.sendRedirect(getServletContext().getContextPath() + "/index.jsp"  );
			return;
        }
		// cmd可能是DEL或是MOD
		String cmd = request.getParameter("cmd");
		String bookIdStr = request.getParameter("bookId");
		int bookId = Integer.parseInt(bookIdStr.trim());
		dao = new CartDetailDaoImpl();
		if (cmd.equalsIgnoreCase("DEL")) {
	        cart.deleteBook(bookId); // 刪除購物車內的某項商品
	        dao.deleteCartDetail(memberBean.getMemberId(), bookId);
	        RequestDispatcher rd = request.getRequestDispatcher("displayCart");
		    rd.forward(request, response);
		    return;
		} else if (cmd.equalsIgnoreCase("MOD")) {
			String newQtyStr = request.getParameter("newQty");
			int newQty = Integer.parseInt(newQtyStr.trim());
			cart.modifyQty(bookId, newQty);   // 修改某項商品的數項
			dao.updateCartDetail(memberBean.getMemberId(), bookId, newQty, 0.9, null, null, null);
	        RequestDispatcher rd = request.getRequestDispatcher("displayCart");
		    rd.forward(request, response);
		    return;
		}
	}
}