package _09_Book.dao;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import _09_Book.model.BookBean;
import _09_Book.model.BookBeanWithImageData;
import _09_Book.model.CompanyBean;


@Repository
public class BooKDaoImpl implements BooKDao {
	
	@Autowired
	SessionFactory factory;
	
	@Autowired
	BooKDao dao;
	
	@Autowired
	ServletContext ctx;

	private int id;

//	@Autowired
//	CompanyBean C;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<BookBean> getBook() { //書籍顯示
		String hql = "FROM BookBean";// order by price
		Session session = factory.getCurrentSession();
		List<BookBean> beans = new ArrayList<>();
		beans = session.createQuery(hql).getResultList();
		return beans;
	}
	
	//---------------------------------------------首頁熱門商品顯示
	
	@SuppressWarnings("unchecked")
	public List<BookBean> hotBook() { 
		String hql = "FROM BookBean b Where b.bookName like :query";
		Session session = factory.getCurrentSession();
		List<BookBean> bean = session.createQuery(hql)
							  .setParameter("query", "%"+"柳丁汁"+"%")
				              .getResultList();
		
		System.out.println("xxxxxxxxxxx"+bean+"xxxxxxxxxxx");	
		return bean;
		
	
	}
	
	//--------------------------------------搜尋
	
	@SuppressWarnings("unchecked")
	public List<BookBean> queryKeyBook(String book) { 
		String hql = "FROM BookBean b Where b.bookName like :query";
		Session session = factory.getCurrentSession();
		List<BookBean> bean = session.createQuery(hql)
							  .setParameter("query", "%"+book+"%")
				              .getResultList();
		return bean;
		
	}
	
	//--------------------------------------修改搜尋
	
	@SuppressWarnings("unchecked")
	public List<BookBean> queryUpdateKeyBook(String book) { 
		String hql = "FROM BookBean b Where b.bookName like :query";
		Session session = factory.getCurrentSession();
		List<BookBean> bean = session.createQuery(hql)
							  .setParameter("query", "%"+book+"%")
				              .getResultList();
		System.out.println("xxxxxxxxx "+ book + " xxxxxxxxx");
		return bean;
		
	}
	
	
	//--------------------------------------多重搜尋
	
		@SuppressWarnings("unchecked")
		public List<BookBean> querymultiBook(String book,String author,Integer company,String item,
				Double price1,Double price2) { 
			
			Session session = factory.getCurrentSession();
					
			Map<String, Object> map = new HashMap<>();
			map.put("book", "%"+book+"%");
			map.put("author", "%"+author+"%");
			map.put("companyId", company);
			map.put("item", item);
			map.put("min", price1);
			map.put("max", price2);
			
			StringBuffer s = new StringBuffer();
			
			s.append("FROM BookBean b Where 1=1 ");
			
			if (map.get("book")!=null){
				s.append(" and b.bookName like :book");
			}
			
			if (map.get("author")!=null){
				s.append(" and b.author like :author");
			}
			
			if (map.get("companyId")!=null){
				s.append(" and companyId = :companyId");
			}
			
			if (map.get("item")!=""){
				s.append(" and b.item = :item");
			}
			
			if (map.get("min")!=null){
				s.append(" and b.price >= :min");
			}
			
			if (map.get("max")!=null){
				s.append(" and b.price <= :max");
			}
			
			Query query = session.createQuery(s.toString());
			query.setProperties(map);
			
			List<BookBean> list = query.list();
			
			System.out.println("xxxxxxxxx "+ book + " xxxxxxxxx");
			System.out.println("xxxxxxxxx "+ author + " xxxxxxxxx");
			System.out.println("xxxxxxxxx "+ company + " xxxxxxxxx");
			System.out.println("xxxxxxxxx "+ item + " xxxxxxxxx");
			System.out.println("xxxxxxxxx "+ price1 + " xxxxxxxxx");
			System.out.println("xxxxxxxxx "+ price2 + " xxxxxxxxx");

			System.out.println("xxxxxxxxx "+ s + " xxxxxxxxx");
			
//			String Tname = "";
//			String Tand = " and ";
//			String Tauthor = "";
//			String Tcompany = "";
//			String Tprice =  "";
//			
//			if(!book.equals("")) {
//				Tname = " b.bookName like :query"  ;
//			}else if(book.equals("")) {
//				Tname = "";
//			}
//				
//			if(!author.equals("")) {
//				Tauthor =  "b.author like :author" ;
//			}else if(author.equals("")) {
//				Tand = "";
//				Tauthor = "";
//			}
//			
	//
//			
//			String hql = "FROM BookBean b Where " + Tname + Tand + Tauthor  + Tand + Tcompany;
//			String hql2 = "FROM BookBean b Where " + Tname + Tand + Tauthor  ;
//			String hql3 = "FROM BookBean b Where " + Tname + Tand  + Tand + Tcompany;
//			String hql4 = "FROM BookBean b Where " + Tname + Tand + Tauthor + Tand + Tcompany;
//			String hql5 = "FROM BookBean b Where "  + Tauthor + Tand  + Tand + Tcompany;
//			String hql6 = "FROM BookBean b Where "  + Tprice;
//			
//			

			return  list;
			
		}
	
	//--------------------------------------類別篩選

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllItem() { //類別篩選
		String hql = "SELECT DISTINCT b.item FROM BookBean b";
		Session session = factory.getCurrentSession();
//		List<String> list = new ArrayList<String>();
//		list = session.createQuery(hql).getResultList();
		return session.createQuery(hql).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BookBean> getBookByItem(String item) { //類別篩選
		String hql = "FROM BookBean b WHERE b.item = :item123";
		Session session = factory.getCurrentSession();	
		return session.createQuery(hql).setParameter("item123", item)
									   .getResultList();
	}
	
	@Override
	public BookBean getBookById(int bookId) {
		Session session = factory.getCurrentSession();
		BookBean bb = session.get(BookBean.class, bookId);
		return bb;
	}
	
	//---------------------------------------排序
	
	@Override
	public List<String> getAllOrder() {
		String hql = "SELECT DISTINCT b.name FROM BookOrderBean b";
		Session session = factory.getCurrentSession();
//		List<String> list = new ArrayList<String>();
//		list = session.createQuery(hql).getResultList();
		return session.createQuery(hql).getResultList();
	}
	
	@Override
	public List<BookBean> OrderByPrice() {
		String hql = "FROM BookBean order by price ";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}
	
	@Override
	public List<BookBean> OrderByPriceDesc() {
		String hql = "FROM BookBean order by price Desc";
		Session session = factory.getCurrentSession();
//		List<BookBean> beans= session.createQuery(hql)
//									 .getResultList();
//		List<BookBean> beans = new ArrayList<>();
//		beans = session.createQuery(hql).getResultList();
		return session.createQuery(hql).getResultList();
	}

	
	//-------------------------------------更新庫存

	
	@Override
	public void updateStock(int productid, int newQuantity) {
		String hql = "UPDATE BookBean b SET b.stock = :qty WHERE bookId = :id";
		Session session = factory.getCurrentSession();
		
		int n = session.createQuery(hql)
				.setParameter("qty", newQuantity)
				.setParameter("id", productid)
				.executeUpdate();
	}
	
	//---------------------------------修改書籍資料
	
	@Override
	public int upAllBook(BookBean bean,int companyId) {
		
        CompanyBean cb = dao.getCompanyById(companyId);
        bean.setCompanyBean(cb);
		
		int n = 0;		
        Session session = factory.getCurrentSession();
        session.saveOrUpdate(bean);
        n++;
		return n;
        	
	}
	
	
	//------------------------------------刪除書籍
	
	@Override
	public int deleteBook(int no) {
		int n = 0;
        Session session = factory.getCurrentSession();
        BookBean bb = new BookBean();
        bb.setBookId(no);
        session.delete(bb);
        n++;
        return n;
	}
	
	//------------------------------新增圖片

	@Override  //取CompanyBean的主鍵ID，塞進BookBean
	public void addProduct(BookBean book) { 
		Session session = factory.getCurrentSession();
		CompanyBean cb = getCompanyById(book.getCompanyId());
		book.setCompanyBean(cb);
		session.save(book);
		
	}

	@Override
	public CompanyBean getCompanyById(int companyId) {
		Session session = factory.getCurrentSession();
//		CompanyBean cb = null;
//		cb = session.get(CompanyBean.class, companyId);
		return session.get(CompanyBean.class, companyId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CompanyBean> getCompanyList() {
		Session session = factory.getCurrentSession();
		String hql = "FROM CompanyBean";
//		List<CompanyBean> list = session.createQuery(hql).getResultList();
		return session.createQuery(hql).getResultList();
	}

	//-----------------------------------------圖片 JSON用
	
	public BookBeanWithImageData addImageData(BookBean bean) {
		BookBeanWithImageData bbwid = null;
		try {
			StringBuffer sb = new StringBuffer();
			String fileName = bean.getImageName();
			String mimeType = ctx.getMimeType(fileName);
			Blob blob = bean.getImage();
			byte[] bytes = blob.getBytes(1, (int) blob.length());
			String prefix = "data:" + mimeType + ";base64,";
			sb.append(prefix);
			Base64.Encoder be = Base64.getEncoder();
			String str = new String(be.encode(bytes));
			sb.append(str);
			String iamgeData = sb.toString();
			bbwid = new BookBeanWithImageData(bean, iamgeData);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return bbwid;		
	}

	//---------------------------------------------AJAX
	
	@Override
	public List<BookBeanWithImageData> getAllBooksWithImageData() {
		List<BookBean> listSource = getBook();
		List<BookBeanWithImageData> listTarget = new ArrayList<>();
		for(BookBean bean : listSource) {
			listTarget.add(addImageData(bean));
		}
		return listTarget;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BookBeanWithImageData> getBooksImageDataByPublisher(Integer publisherId) {
		String hql = "FROM BookBean WHERE companyId = :id";
		Session session = factory.getCurrentSession();
		List<BookBean> listSource = session.createQuery(hql)
					  .setParameter("id", publisherId)
					  .getResultList();
		
		List<BookBeanWithImageData> listTarget = new ArrayList<>();
		for(BookBean bean : listSource) {
			listTarget.add(addImageData(bean));
		}
		return listTarget;
	}

	
	@SuppressWarnings({ "unchecked", "unused" })
	@Override
	public List<BookBeanWithImageData> getBookByItemJson(String item,String order,Integer publisherId) { //類別篩選
		List<BookBeanWithImageData> bbwid = null;
		String hql = "FROM BookBean b WHERE b.item = :item123";
		String hql2 = "FROM BookBean WHERE companyId = :id";
		String hql3 = "FROM BookBean b WHERE b.item = :item123 and companyId = :id ";
		String hqlorder = "FROM BookBean order by price Desc";
		String hqlorder2 = "FROM BookBean order by price";
		String hqlorder3 = "FROM BookBean b WHERE b.item = :item123 and companyId = :id order by price Desc";
		String hqlorder4 = "FROM BookBean b WHERE b.item = :item123 and companyId = :id order by price";
		String hqlorder5 = "FROM BookBean b WHERE b.item = :item123 order by price Desc";
		String hqlorder6 = "FROM BookBean b WHERE b.item = :item123 order by price";
		String hqlorder7 = "FROM BookBean WHERE companyId = :id order by price Desc";
		String hqlorder8 = "FROM BookBean WHERE companyId = :id order by price ";
		
		Session session = factory.getCurrentSession();	
		
		List<BookBean> itemSource = session.createQuery(hql)
									.setParameter("item123", item)
									.getResultList();
		
		List<BookBean> companySource = session.createQuery(hql2)
				  					 .setParameter("id", publisherId)
				  					 .getResultList();
		
		List<BookBean> crossSource = session.createQuery(hql3)
									.setParameter("item123", item)
									.setParameter("id", publisherId)
									.getResultList();
		
		List<BookBean> orderDescSource = session.createQuery(hqlorder)
									.getResultList();
		
		List<BookBean> orderSource2 = session.createQuery(hqlorder2)
									.getResultList();
		
		List<BookBean> crossOrderDescSource = session.createQuery(hqlorder3)
									.setParameter("item123", item)
									.setParameter("id", publisherId)
									.getResultList();
		
		List<BookBean> crossOrderSource = session.createQuery(hqlorder4)
									.setParameter("item123", item)
									.setParameter("id", publisherId)
									.getResultList();
		
		List<BookBean> crossItemDescSource = session.createQuery(hqlorder5)
									.setParameter("item123", item)
									.getResultList();

		List<BookBean> crossItemSource = session.createQuery(hqlorder6)
									.setParameter("item123", item)
									.getResultList();
		
		List<BookBean> crossCompanyDescSource = session.createQuery(hqlorder7)
					 				.setParameter("id", publisherId)
					 				.getResultList();
		
		List<BookBean> crossCompanySource = session.createQuery(hqlorder8)
 									.setParameter("id", publisherId)
 									.getResultList();
		
		
		List<BookBeanWithImageData> listTarget = new ArrayList<>();
		for(BookBean bean : itemSource) {
			listTarget.add(addImageData(bean));
		}
		
		List<BookBeanWithImageData> companyTarget = new ArrayList<>();
		for(BookBean bean1 : companySource) {
			companyTarget.add(addImageData(bean1));
		}
		
		List<BookBeanWithImageData> crossTarget = new ArrayList<>();
		for(BookBean bean2 : crossSource) {
			crossTarget.add(addImageData(bean2));
		}
		
		List<BookBeanWithImageData> orderDescTarget = new ArrayList<>();
		for(BookBean order1 : orderDescSource) {
			orderDescTarget.add(addImageData(order1));
		}
		
		List<BookBeanWithImageData> orderTarget = new ArrayList<>();
		for(BookBean order2 : orderSource2) {
			orderTarget.add(addImageData(order2));
		}
		
		List<BookBeanWithImageData> crossOrderDescTarget = new ArrayList<>();
		for(BookBean order3 : crossOrderDescSource) {
			crossOrderDescTarget.add(addImageData(order3));
		}
		
		List<BookBeanWithImageData> crossOrderTarget = new ArrayList<>();
		for(BookBean order4 : crossOrderSource) {
			crossOrderTarget.add(addImageData(order4));
		}
		
		List<BookBeanWithImageData> crossItemDescTarget = new ArrayList<>();
		for(BookBean order5 : crossItemDescSource) {
			crossItemDescTarget.add(addImageData(order5));
		}
		
		List<BookBeanWithImageData> crossItemTarget = new ArrayList<>();
		for(BookBean order6 : crossItemSource) {
			crossItemTarget.add(addImageData(order6));
		}
		
		List<BookBeanWithImageData> crossCompanyDescTarget = new ArrayList<>();
		for(BookBean order7 : crossCompanyDescSource) {
			crossCompanyDescTarget.add(addImageData(order7));
		}
		
		List<BookBeanWithImageData> crossCompanyTarget = new ArrayList<>();
		for(BookBean order8 : crossCompanySource) {
			crossCompanyTarget.add(addImageData(order8));
		}
		
		
//		if(order.equals("價格由高到低") && publisherId!= null) {
//			return crossTarget;
//		}
		
		
		if(item.equals("蔬果") && publisherId.equals(1) && order.equals("價格由高到低"))  {
			return crossOrderDescTarget;
		}else if(item.equals("蔬果") && publisherId.equals(2) && order.equals("價格由高到低"))  {
			return crossOrderDescTarget;
		}else if(item.equals("蔬果") && publisherId.equals(3) && order.equals("價格由高到低"))  {
			return crossOrderDescTarget;
		}else if(item.equals("書籍") && publisherId.equals(1) && order.equals("價格由高到低"))  {
			return crossOrderDescTarget;
		}else if(item.equals("書籍") && publisherId.equals(2) && order.equals("價格由高到低"))  {
			return crossOrderDescTarget;
		}else if(item.equals("書籍") && publisherId.equals(3) && order.equals("價格由高到低"))  {
			return crossOrderDescTarget;
//		---------------------------------
		}else if(item.equals("蔬果") && publisherId.equals(1) && order.equals("價格由低到高"))  {
			return crossOrderTarget;
		}else if(item.equals("蔬果") && publisherId.equals(2) && order.equals("價格由低到高"))  {
			return crossOrderTarget;
		}else if(item.equals("蔬果") && publisherId.equals(3) && order.equals("價格由低到高"))  {
			return crossOrderTarget;
		}else if(item.equals("書籍") && publisherId.equals(1) && order.equals("價格由低到高"))  {
			return crossOrderTarget;
		}else if(item.equals("書籍") && publisherId.equals(2) && order.equals("價格由低到高"))  {
			return crossOrderTarget;
		}else if(item.equals("書籍") && publisherId.equals(3) && order.equals("價格由低到高"))  {
			return crossOrderTarget;
//		-----------------------------------------------------------------
//		-----------------------------------------------------------------
		}else if(item.equals("蔬果") && order.equals("價格由高到低"))  {
			return crossItemDescTarget;
		}else if(item.equals("書籍") && order.equals("價格由高到低"))  {
			return crossItemDescTarget;	
//		---------------------------------
		}else if(item.equals("蔬果") && order.equals("價格由低到高"))  {
			return crossItemTarget;	
		}else if(item.equals("書籍") && order.equals("價格由低到高"))  {
			return crossItemTarget;	
//		-----------------------------------------------------------------
//		-----------------------------------------------------------------
		}else if(publisherId.equals(1) && order.equals("價格由高到低"))  {
			return crossCompanyDescTarget;	
		}else if(publisherId.equals(2) && order.equals("價格由高到低"))  {
			return crossCompanyDescTarget;		
		}else if(publisherId.equals(3) && order.equals("價格由高到低"))  {
			return crossCompanyDescTarget;
//		---------------------------------	
		}else if(publisherId.equals(1) && order.equals("價格由低到高"))  {
			return crossCompanyTarget;
		}else if(publisherId.equals(2) && order.equals("價格由低到高"))  {
			return crossCompanyTarget;
		}else if(publisherId.equals(3) && order.equals("價格由低到高"))  {
			return crossCompanyTarget;
//		-----------------------------------------------------------------
//		-----------------------------------------------------------------
		}else if(item.equals("蔬果") && publisherId.equals(1))  {
			return crossTarget;	
		}else if(item.equals("蔬果") && publisherId.equals(2))  {
			return crossTarget;	
		}else if(item.equals("蔬果") && publisherId.equals(3))  {
			return crossTarget;	
		}else if(item.equals("書籍") && publisherId.equals(1))  {
			return crossTarget;	
		}else if(item.equals("書籍") && publisherId.equals(2))  {
			return crossTarget;	
		}else if(item.equals("書籍") && publisherId.equals(3))  {
			return crossTarget;	
//		-----------------------------------------------------------------
//		-----------------------------------------------------------------
		}else if(item.equals("蔬果") && publisherId.equals(-1))  {
			return listTarget;
		}else if(item.equals("書籍") && publisherId.equals(-1))  {
			return listTarget;
		}else if(item.equals("請挑選") && publisherId.equals(1))  {
			return companyTarget;
		}else if(item.equals("請挑選") && publisherId.equals(2))  {
			return companyTarget;
		}else if(item.equals("請挑選") && publisherId.equals(3))  {
			return companyTarget;
		}else if(item.equals("請挑選") && order.equals("價格由高到低"))  {
			return orderDescTarget;
		}else if(item.equals("請挑選") && order.equals("價格由低到高"))  {
			return orderTarget;
		}
		



		
		
		return bbwid;

	}
	

	

	

	


}
