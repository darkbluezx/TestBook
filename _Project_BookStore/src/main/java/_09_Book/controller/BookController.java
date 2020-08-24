package _09_Book.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
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
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import _00_init.util.GetCartNo;
import _03_cart.web.store.model.Cart;
import _03_cart.web.store.model.CartDetailBean;
import _03_cart.web.store.model.CartMasterBean;
import _03_cart.web.store.model.MemberBean;
import _03_cart.web.store.service.CartDetailService;
import _03_cart.web.store.service.CartMasterService;
import _05_loginSystem.model.Delivery;
import _05_loginSystem.model.Members;
import _05_loginSystem.service.DeliveryService;
import _09_Book.model.BookBean;
import _09_Book.model.BookBeanWithImageData;
import _09_Book.model.CompanyBean;
import _09_Book.service.BookService;

@Controller
@SessionAttributes({ "Cart", "memberBean", "cartMasterBean","LoginOK" })
//@RequestMapping("/_09/Book")
public class BookController {

	@Autowired
	BookService service;

	@Autowired
	ServletContext ctx;

	@Autowired
	CartMasterService CMservice;
	@Autowired
	CartDetailService CDservice;
	@Autowired
	DeliveryService Dservice;

	@GetMapping("/bookpage")
	public String bookCon(Model model) {
		List<BookBean> beans = service.getBook();
		model.addAttribute("books", beans);
//		List<String> list = service.getAllItem();
//		model.addAttribute("itemConlist", list );
		// 加入篩選類別
		return "shopgrid";
	}
	
	//---------------------------------------------首頁熱門商品顯示

	@GetMapping("/")
	public String bookIndexCon(Model model) { 
		List<BookBean> beans = service.hotBook();
		model.addAttribute("booki",beans);
//		List<String> list = service.getAllItem();
//		model.addAttribute("itemConlist", list );
		//加入篩選類別
		return "index";
	}
		
	@GetMapping("/index")
	public String bookIndexCon2(Model model) { 
		List<BookBean> beans = service.hotBook();
		model.addAttribute("booki",beans);
//		List<String> list = service.getAllItem();
//		model.addAttribute("itemConlist", list );
		//加入篩選類別
		return "index";
	}

	// -----------------------------------搜尋

	@GetMapping("/queryAllBook")
	public String queryKeyBook(@RequestParam(value = "book") String book, Model model) {
		List<BookBean> beans = service.queryKeyBook(book);
		model.addAttribute("books", beans);
//		List<String> list = service.getAllItem();
//		model.addAttribute("itemConlist", list );
		// 加入篩選類別
		return "shopgrid";
	}
	// -----------------------------------修改頁面搜尋列

	//model.addAttribute("bookp", beans)內的識別字串等同bookUp方法
	@GetMapping("/queryUpdateAllBook")
	public String queryUpdateKeyBook(@RequestParam(value = "booku") String book, Model model) {
		List<BookBean> beans = service.queryUpdateKeyBook(book);
		model.addAttribute("bookp", beans);
//		List<String> list = service.getAllItem();
//		model.addAttribute("itemConlist", list );
		// 加入篩選類別
		return "UpdateBook";
	}

	// -----------------------------------多重搜尋

	@GetMapping("/querymultiBook")
	public String querymultiBook(@RequestParam(value = "bookName") String book,
			@RequestParam(value = "author") String author, @RequestParam(value = "company") Integer company,
			@RequestParam(value = "item") String item, @RequestParam(value = "price1") Double price1,
			@RequestParam(value = "price2") Double price2, Model model) {
		List<BookBean> beans = service.querymultiBook(book, author, company, item, price1, price2);
		model.addAttribute("books", beans);
//				List<String> list = service.getAllItem();
//				model.addAttribute("itemConlist", list );
		// 加入篩選類別
		return "shopgrid";
	}
	// -----------------------------------排序

	@GetMapping("/價格由高到低") // 如果路徑變數與參數名稱相同，可以省略(@PathVariable還是要)
	public String getBookOrderDesc(Model model) {
		List<BookBean> Order = service.OrderByPriceDesc();
		model.addAttribute("books", Order);
		// model.addAttribute的"books"要與bookCon的一樣
		return "shopgrid";
	}

	@GetMapping("/價格由低到高") // 如果路徑變數與參數名稱相同，可以省略(@PathVariable還是要)
	public String getBookOrder(Model model) {
		List<BookBean> Order = service.OrderByPrice();
		model.addAttribute("books", Order);
		// model.addAttribute的"books"要與bookCon的一樣
		return "shopgrid";
	}

//	@GetMapping("/bookprice")
//	public String bookOrderDescPrice(Model model) { 
//		List<BookBean> price = service.OrderByPriceDesc();
////		List<BookBean> price2 = service.OrderByPrice();
//		model.addAttribute("books",price); //同一個model"books"內
////		model.addAttribute("books",price2); //同一個model"books"內
//		return "books";
//	}
//	
//	@GetMapping("/bookprice2")
//	public String bookOrderDescPrice2(Model model) { 
//		
//		List<BookBean> price2 = service.OrderByPrice();
//		
//		model.addAttribute("books",price2); //同一個model"books"內
//		return "books";
//	}

	@ModelAttribute("bookprice")
	public List<String> getAllOrder() {
		return service.getAllOrder();
	}

	@ModelAttribute
	public String getOrderDescList(String n) {
		n = "價格由高到低";
		return n;
	}

	@ModelAttribute
	public String getOrderList(String i) {
		i = "價格由低到高";
		return i;
	}

	// -------------------------------------------修改書籍資料

	@GetMapping("/bookUpPage")
	public String bookUp(Model model) {
		List<BookBean> beans = service.getBook();
		model.addAttribute("bookp", beans);

//		List<String> list = service.getAllItem();
//		model.addAttribute("itemConlist", list );
		// 加入篩選類別
		return "UpdateBook";
	}

//	@GetMapping("/Update2/{bookId}") //如果路徑變數與參數名稱相同，可以省略(@PathVariable還是要)
//	public String getBookUp(@PathVariable("bookId") int bookId, Model model){
//		BookBean itemlist = service.getBookById(bookId);
//		model.addAttribute("books", itemlist);
//		//model.addAttribute的"books"要與bookCon的一樣
//		return "Update2";
//	}

	@ModelAttribute
	public String getBookListUp(Model model) {
		BookBean bb = new BookBean();
		model.addAttribute("bookBean2", bb);
		return "bookBean2";
	}

	@PostMapping("/UpdateOneBook")
	public String processAddNewProductForm2(@ModelAttribute("bookBean2") BookBean bb, int companyId,
			BindingResult result) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		if (bb.getStock() == null) {
			bb.setStock(0);
		}
		MultipartFile productImage = bb.getProductImage();
		String originalFilename = productImage.getOriginalFilename();
		bb.setImageName(originalFilename);
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (productImage != null && !productImage.isEmpty()) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				bb.setImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}

		service.upAllBook(bb, companyId);

		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = ctx.getRealPath("/");
		try {
			File imageFolder = new File(rootDirectory, "images");
			if (!imageFolder.exists())
				imageFolder.mkdirs();
			File file = new File(imageFolder, "Product" + bb.getBookId() + ext);
			productImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}
		return "redirect:/bookUpPage";
	}

	// -----------------------------------------刪除書籍

	@GetMapping("/deleteBook/{bookId}")
	public String deleteBook(@PathVariable("bookId") int bookId) {
		service.deleteBook(bookId);
		return "redirect:/bookUpPage";
	}
	
	@GetMapping("/deleteMore")
	public String deletes(String ids){
		String [] s = ids.split(",");
		for (String string : s) {
			service.deleteBook(Integer.parseInt(string));
			System.out.println("xxxxxxxxxxxxxxxxxx" + string+ "xxxxxxxxxxxxxxxxxxxx");
		}
		return "redirect:bookUpPage";
	}
	
	// -----------------------------------------更新書籍資料
	@GetMapping("/update/stock")
	public String updateStock() {
		service.updateAllStocks();
		return "redirect:/bookpage";
		// 用redirect方式向products提出請求
	}

	// -----------------------------------------書籍分類
	@GetMapping("/queryByBook")
	public String getAllItemCon(Model model) {
		List<String> list = service.getAllItem();
		model.addAttribute("itemConlist", list);
		return "types/category";
	}

	// 書籍分類
	@GetMapping("{item}") // 如果路徑變數與參數名稱相同，可以省略(@PathVariable還是要)
	public String getBookByItemCon(@PathVariable("item") String item, Model model) {
		List<BookBean> itemlist = service.getBookByItem(item);
		model.addAttribute("books", itemlist);
		// model.addAttribute的"books"要與bookCon的一樣
		return "shopgrid";
	}

	// --------------------------------

	@GetMapping("/product")
	public String getBookByIdCon(@RequestParam("id") Integer bookId, Model model) {
//		BookBean products = service.getProductById(id);
		model.addAttribute("bookp", service.getBookById(bookId));
		return "bookdetail";
	}

	// --------------------------------新增

	@ModelAttribute
	public String getAddBookListUp(Model model) {
		BookBean bb = new BookBean();
		model.addAttribute("bookBean", bb);
		return "bookBean";
	}

	// 這裡的@ModelAttribute("bookBean")是取getAddNewProductForm方法的"bookBean"
	@PostMapping("/bookUpPage")
	public String processAddNewProductForm(@ModelAttribute("bookBean") BookBean bb, BindingResult result) {
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		if (bb.getStock() == null) {
			bb.setStock(0);
		}
		MultipartFile productImage = bb.getProductImage();
		String originalFilename = productImage.getOriginalFilename();
		bb.setImageName(originalFilename);
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (productImage != null && !productImage.isEmpty()) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				bb.setImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}

		service.addProduct(bb);

		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = ctx.getRealPath("/");
		try {
			File imageFolder = new File(rootDirectory, "images");
			if (!imageFolder.exists())
				imageFolder.mkdirs();
			File file = new File(imageFolder, "Product" + bb.getBookId() + ext);
			productImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}
		return "redirect:/bookUpPage";
	}

	// 同一個控制器類別內，當有任何請求要執行控制器方法，在這之前，所有@ModelAttribute都會先執行
	// 一般控制器方法能用的參數，@ModelAttribute修飾的方法也能用
	@ModelAttribute("companyList")
	public Map<Integer, String> getCompanyList() {
		Map<Integer, String> companyMap = new HashMap();
		List<CompanyBean> list = service.getCompanyList();
		for (CompanyBean cb : list) {
			companyMap.put(cb.getId(), cb.getName());
		}
		return companyMap;
		// 如果要return物件，@ModelAttribute等同
		// model.addAttribute("companyList", companyMap);
	}

	@ModelAttribute("itemConlist")
	public List<String> getCategoryList() {
		return service.getAllItem();
	}

	// ------------------------------------------新增圖片用

	@GetMapping("/getPicture/{bookId}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer bookId) {
		String noImagePath = "/resources/images/NoImage.jpg";
		ResponseEntity<byte[]> re = null;
		BookBean bean = service.getBookById(bookId);
		ByteArrayOutputStream baos = null;
		InputStream is = null;
		try {
			Blob blob = bean.getImage();
			if (blob != null) {
				is = blob.getBinaryStream();
			} else if (is == null) {
				is = ctx.getResourceAsStream(noImagePath);// 顯示預設圖片
			}
			baos = new ByteArrayOutputStream();
			int len = 0;
			byte[] b = new byte[819200];
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		byte[] b0 = baos.toByteArray();

		String filename = bean.getImageName();
		String mimeType = null;
		MediaType mediaType = null;
		if (filename != null) {
			mimeType = ctx.getMimeType(filename);
		} else {
			mimeType = ctx.getMimeType(noImagePath);
		}

		mediaType = MediaType.valueOf(mimeType);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(mediaType);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		re = new ResponseEntity<>(b0, headers, HttpStatus.OK);

		return re;
	}

	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = ctx.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = ctx.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}

	// ------------------------------------------AJAX
	// ------------------------------------------AJAX

	@GetMapping("/allbooks")
	public ResponseEntity<List<BookBeanWithImageData>> allBooksWithImageData() {
		System.out.println("A----------------------");
		List<BookBeanWithImageData> list = service.getAllBooksWithImageData();
		ResponseEntity<List<BookBeanWithImageData>> re = new ResponseEntity<>(list, HttpStatus.OK);
		return re;
	}

	// -------------------------------------------AJAX 出版社

	@GetMapping("/getBooksByPubllisher")
	public ResponseEntity<List<BookBeanWithImageData>> getBooksWithImageDataByPublisher(
			@RequestParam(value = "publisherId", defaultValue = "0") Integer publisherId) {
		List<BookBeanWithImageData> listTarget = service.getBooksImageDataByPublisher(publisherId);
//		Map<String, Object> map =  service.getBooksAmountByPublisherId(publisherId);
//		map.put("books", listTarget);
		ResponseEntity<List<BookBeanWithImageData>> re = new ResponseEntity<>(listTarget, HttpStatus.OK);
		return re;
	}

	@GetMapping("/allPublishers")
	public ResponseEntity<List<CompanyBean>> allPublishers() {
		List<CompanyBean> list = service.getCompanyList();
		ResponseEntity<List<CompanyBean>> re = new ResponseEntity<>(list, HttpStatus.OK);
		return re;
	}

	// -------------------------------------------AJAX 分類

	@GetMapping("/bookCategory/{item2}/{order2}")
	public ResponseEntity<List<BookBeanWithImageData>> allFoodPublishers(@PathVariable("item2") String item,
			@PathVariable("order2") String order,
			@RequestParam(value = "publisherId", defaultValue = "0") Integer publisherId, Model model) {
		List<BookBeanWithImageData> list = service.getBookByItemJson(item, order, publisherId);
		ResponseEntity<List<BookBeanWithImageData>> re = new ResponseEntity<>(list, HttpStatus.OK);
		return re;
	}

	@GetMapping("/測試用")
	public String test() {
		return "測試用";

	}

	@ModelAttribute
	public MemberBean createMemberBean(Model model) {
		Members m = (Members) model.getAttribute("LoginOK");
		
		MemberBean mb = new MemberBean();
		if (m != null) {
		   mb.setMemberId(m.getId().toString());
		   mb.setName(m.getName());
		   List<Delivery> ldy = Dservice.findAllDelivery();
		   for (int i = 0; i < ldy.size(); i++ ) {
			   Delivery dy = ldy.get(i);
			   if ( dy.getMembers().getId() == m.getId()) {
				    mb.setAddress(dy.getCity()+dy.getRegion()+dy.getStreet());
			   }
		   }
		   mb.setEmail(m.getMail());
		   mb.setTel(m.getPhone());
		   model.addAttribute("memberBean", mb);
		} 
		return mb;
	}
}
