package _09_Book.service;

import java.util.List;

import _09_Book.model.BookBean;
import _09_Book.model.BookBeanWithImageData;
import _09_Book.model.CompanyBean;

public interface BookService {
	List<BookBean> getBook();
	
	List<BookBean> hotBook();//首頁熱門商品顯示
	
	List<BookBean> queryKeyBook(String book);//主搜尋列
	
	List<BookBean> queryUpdateKeyBook(String book);//修改頁面搜尋列
	
	List<BookBean> querymultiBook(String book,String author,Integer company,String item,
			Double price1,Double price2);//多重搜尋
	
	void updateAllStocks();
	
	void  upAllBook(BookBean bean,int companyId); //修改書籍
	
	void deleteBook(int no);
	
//	void upAllBook(BookBean book,int bookId);
	
	List<String> getAllItem();
	
	List<String> getAllOrder();//排序
	
	List<BookBean> getBookByItem(String item);
	
	List<BookBean> OrderByPriceDesc();
	
	List<BookBean> OrderByPrice();
	
	public BookBean getBookById(int bookId);
	
	void  addProduct(BookBean book);
	CompanyBean  getCompanyById(int companyId);
	List<CompanyBean>  getCompanyList();
	
	//------------------------------------AJAX
	
	List<BookBeanWithImageData> getAllBooksWithImageData();
	
	public List<BookBeanWithImageData> getBooksImageDataByPublisher(Integer publisherId);
	
	List<BookBeanWithImageData> getBookByItemJson(String item,String order,Integer publisherId);
}
