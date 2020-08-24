package _03_cart.web.store.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import _03_cart.web.store.model.Books;
import _03_cart.web.store.service.BooksService;

@Controller
@SessionAttributes({"Cart", "memberBean","products", "cartMasterBean"})
@RequestMapping("/_03_cart")
public class BooksController {
	@Autowired
	BooksService service;
	@Autowired
	ServletContext context;
	
//	@RequestMapping("/products")
//	public String list(Model model) {
//		List<Books> list = service.getAllBooks();
//		model.addAttribute("products", list);
//		return "_03_cart/products";
//	}
	@RequestMapping(value="/RgetPicture/{bookId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer bookId) {
		String filePath = "/resources/images/noimage.png";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		Books bean = service.getBooksById(bookId);
		System.out.println("bookId = " + bookId);
		if (bean != null) {
			Blob blob = bean.getImage();
			filename = bean.getImageName();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1,  len);
				} catch(SQLException e) {
					throw new RuntimeException("BooksController的getPicture()方法出現SQLExecption:" + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
			
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}
	private byte[] toByteArray(String filePath) {
		byte[] b = null;
		String realPath = context.getRealPath(filePath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int)size];
			InputStream fis = context.getResourceAsStream(filePath);
			fis.read(b);
		} catch(FileNotFoundException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	
	
	
	

}
