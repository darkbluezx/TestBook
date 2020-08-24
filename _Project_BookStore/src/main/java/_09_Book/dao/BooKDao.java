package _09_Book.dao;

import java.util.List;

import _09_Book.model.BookBean;
import _09_Book.model.BookBeanWithImageData;
import _09_Book.model.CompanyBean;

public interface BooKDao {

	List<BookBean> getBook();

	List<BookBean> hotBook();//首頁熱門商品顯示
	
	List<BookBean> queryKeyBook(String book);//主搜尋列
	
	List<BookBean> queryUpdateKeyBook(String book);//修改頁面搜尋列
	
	List<BookBean> querymultiBook(String book,String author,Integer company,String item,
			Double price1,Double price2);//多重篩選
	
	void updateStock(int productid,int newQuantity);
	
//	void  upAllBook(BookBean bean,Integer bookId);
	
	int  upAllBook(BookBean bean,int companyId); //修改書籍
	
	int deleteBook(int no);
	
	List<String> getAllItem();
	
	List<String> getAllOrder(); //排序
	
	List<BookBean> getBookByItem(String item);
	
	List<BookBean> OrderByPriceDesc();
	
	List<BookBean> OrderByPrice();
	
	public BookBean getBookById(int bookId);
	
	void  addProduct(BookBean book);
	CompanyBean  getCompanyById(int companyId);
	List<CompanyBean>  getCompanyList();
	
	//---------------------------------------AJAX
	
	List<BookBeanWithImageData> getAllBooksWithImageData();
	
	public List<BookBeanWithImageData> getBooksImageDataByPublisher(Integer publisherId);
	
	List<BookBeanWithImageData> getBookByItemJson(String item,String order,Integer publisherId);
}
