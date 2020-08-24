package _09_Book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import _09_Book.dao.BooKDao;
import _09_Book.model.BookBean;
import _09_Book.model.BookBeanWithImageData;
import _09_Book.model.CompanyBean;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	BooKDao dao;
	

	@Transactional
	@Override
	public List<BookBean> getBook() {
//		List<BookBean> beans = null;
//		beans = dao.getBook();
		return dao.getBook();
	}
	
	//---------------------------------------------首頁熱門商品顯示
	
	@Transactional
	@Override
	public List<BookBean> hotBook() {
		return dao.hotBook();
	}
	
	//--------------------------------搜尋
	
	@Transactional
	@Override
	public List<BookBean> queryKeyBook(String book) {
		return dao.queryKeyBook(book);
	}
	
	//--------------------------------------修改搜尋
	
	@Transactional
	@Override
	public List<BookBean> queryUpdateKeyBook(String book) {
		return dao.queryUpdateKeyBook(book);
	}
	
	//--------------------------------多重搜尋
	
	@Transactional
	@Override
	public List<BookBean> querymultiBook(String book,String author,Integer company,String item,
			Double price1,Double price2) {
		return dao.querymultiBook(book,author,company,item,price1,price2);
	}
	
	//--------------------------------篩選類別
	
	@Transactional
	@Override
	public List<String> getAllItem() {
		return dao.getAllItem();
	}
	
	@Transactional
	@Override
	public List<BookBean> getBookByItem(String item) {
		return dao.getBookByItem(item);
	}
	
	//----------------------------------------排序
	
	@Transactional
	@Override
	public List<String> getAllOrder() {
		return dao.getAllOrder();
	}
	
	@Transactional
	@Override
	public List<BookBean> OrderByPriceDesc() {
		return dao.OrderByPriceDesc();
	}
	
	@Transactional
	@Override
	public List<BookBean> OrderByPrice() {
		return dao.OrderByPrice();
	}
	
	//------------------------------------------
	
	@Transactional
	@Override
	public BookBean getBookById(int bookId) {
//		BookBean n = dao.getBookById(bookId);
		return dao.getBookById(bookId);
	}

	@Transactional
	@Override
	public void updateAllStocks() {
		List<BookBean> beans = getBook();
		for(BookBean bean : beans) {
			if(bean.getStock() != null && bean.getStock() <50) {
				dao.updateStock(bean.getBookId(), bean.getStock() + 50);
			}
		}
	}
	
	//-----------------------------------修改書籍資料
	
	@Transactional
	@Override
	public void upAllBook(BookBean bean,int companyId) {
		dao.upAllBook(bean,companyId);
	}
		
	//-----------------------------------刪除書籍
	
	@Transactional
	@Override
	public void deleteBook(int no) {
		dao.deleteBook(no);
		
	}

	//-------------------------------------新增
	@Transactional
	@Override
	public void addProduct(BookBean product) {
		dao.addProduct(product);
		
	}
	@Transactional
	@Override
	public CompanyBean getCompanyById(int companyId) {
		return dao.getCompanyById(companyId);
	}
	@Transactional
	@Override
	public List<CompanyBean> getCompanyList() {
		return dao.getCompanyList();
	}
	
	//------------------------------------AJAX
	
	@Transactional
	@Override
	public List<BookBeanWithImageData> getAllBooksWithImageData() {
		return dao.getAllBooksWithImageData();
	}

	@Transactional
	@Override
	public List<BookBeanWithImageData> getBooksImageDataByPublisher(Integer publisherId) {
		return dao.getBooksImageDataByPublisher(publisherId);
	}
	
	@Transactional
	@Override
	public List<BookBeanWithImageData> getBookByItemJson(String item,String order,Integer publisherId) {
		return dao.getBookByItemJson(item,order,publisherId);
	}

	



	

	


}
