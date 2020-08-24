package _07_Promotion_00_init;

/*  
    程式說明：建立表格與設定初始測試資料。
    表格包括：Book, BookCompany, Member, Orders, OrderItems
 
*/
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Blob;

import java.sql.Timestamp;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _07_Promotion_00_init.util.GlobalService;
import _07_Promotion_00_init.util.HibernateUtils;
import _07_Promotion_00_init.util.SystemUtils2018;
import _08_Promotion_com.web.store.model.DiscountBean;
import _08_Promotion_com.web.store.model.FreeBiesBean;
import _08_Promotion_com.web.store.model.ShoppingDiscountBean;
import _09_Book.model.BookBean;
import _09_Book.model.CompanyBean;
import _09_Book.model.BookOrderBean;

public class EDMTableResetHibernate {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public static void main(String args[]) {

		String line = "";

		int count = 0;
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			
			//廠商資料=============================================================================
			// 1. 由"data/bookCompany.dat"逐筆讀入BookCompany表格內的初始資料，
			// 然後依序新增到BookCompany表格中
			try (
				FileReader fr = new FileReader("data/bookCompany.dat"); 
				BufferedReader br = new BufferedReader(fr);
			) {
				while ((line = br.readLine()) != null) {
					if (line.startsWith(UTF8_BOM)) {
						line = line.substring(1);
					}
					String[] token = line.split("\\|");
					String name = token[0];
					String address = token[1];
					String url = token[2];
					CompanyBean cb = new CompanyBean(null, name, address, url);
					session.save(cb);
				}
			} catch (IOException e) {
				System.err.println("新建BookCompany表格時發生IO例外: " + e.getMessage());
			}
			session.flush();
			System.out.println("BookCompany 資料新增成功");
			
			//商品序列====================================================================			
			try (
					FileReader fr = new FileReader("data/bookOrder.dat"); 
					BufferedReader br = new BufferedReader(fr);
				) {
					while ((line = br.readLine()) != null) {
						if (line.startsWith(UTF8_BOM)) {
							line = line.substring(1);
						}
						String[] token = line.split("\\|");
						String name = token[0];
						BookOrderBean cb = new BookOrderBean(null, name);
						session.save(cb);
					}
				} catch (IOException e) {
					System.err.println("新建BookOrder表格時發生IO例外: " + e.getMessage());
				}
				session.flush();
				System.out.println("bookOrder 資料新增成功");
				

			//商品資料======================================================================
			File file = new File("data/book1.dat");
			// 由"data/book.dat"逐筆讀入Book表格內的初始資料，然後依序新增
			// 到Book表格中
			try (
				FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, "UTF8");
				BufferedReader br = new BufferedReader(isr);
			) {
				while ((line = br.readLine()) != null) {
					System.out.println("line=" + line);
					// 去除 UTF8_BOM: \uFEFF
					if (line.startsWith(UTF8_BOM)) {
						line = line.substring(1);
					}
					String[] token = line.split("\\|");
					BookBean book = new BookBean();
					book.setBookName(token[0].trim());
					book.setAuthor(token[1].trim());
					book.setPrice(Double.parseDouble(token[2]));			
					
					int companyId = Integer.parseInt(token[3].trim());
					CompanyBean cb = session.get(CompanyBean.class, companyId);
					book.setCompanyBean(cb);
					
					// 讀取圖片檔
					Blob blob = GlobalService.fileToBlob(token[4].trim());
					book.setImage(blob);
					book.setImageName(GlobalService.extractFileName(token[4].trim()));
					
					book.setItem(token[5].trim());
					book.setMiniItem(token[6].trim());
					book.setStock(Integer.parseInt(token[7]));
					book.setPoint(Double.parseDouble(token[8]));
					
					session.save(book);
					System.out.println("新增一筆Book紀錄成功");
				}
				// 印出資料新增成功的訊息
				session.flush();
				System.out.println("Book資料新增成功");
			}
			
			//贈品活動=====================================================================
			//新增行銷活動"data/FreeBies.dat" 
			File file1 = new File("data/FreeBies.dat");
			try(
				FileInputStream fiis = new FileInputStream(file1);
				InputStreamReader isr1 = new InputStreamReader(fiis, "UTF8");
				BufferedReader bs = new BufferedReader(isr1);	
					
			){
				while ((line = bs.readLine()) != null) {
					if (line.startsWith(UTF8_BOM)) {
						line = line.substring(1);
					}
					String[] token = line.split("\\|");
					FreeBiesBean freebies = new FreeBiesBean();
					
					freebies.setFreeBieEventName(token[0]);
					freebies.setFreeBies(token[1]);
					freebies.setFreeBieThreshold(Integer.parseInt(token[2].trim()));
					freebies.setFreeBieQuota(Integer.parseInt(token[3].trim()));
					freebies.setFreeBieContent(token[4].trim());
					
					// 讀取圖片檔
					Blob blob = SystemUtils2018.fileToBlob(token[5].trim());
					freebies.setFreeBiesImg(blob);
					freebies.setFilename(SystemUtils2018.extractFileName(token[5].trim()));
					
					//日期檔案
					Timestamp a=Timestamp.valueOf(token[6].trim());
					Timestamp b=Timestamp.valueOf(token[7].trim());
					freebies.setFreeBieFromDate(a);
					freebies.setFreeBieFinishDate(b);
					
					int companyId = Integer.parseInt(token[8].trim());
					CompanyBean cb = session.get(CompanyBean.class, companyId);
					freebies.setCompanyBean(cb);
					
					
					session.save(freebies);
					System.out.println("新增一筆freebies活動紀錄成功");
				}
			}catch(IOException e){
				System.err.println("新建FreebiesBean表格時發生IO例外: " + e.getMessage());
				
			}
			
			//出版社折扣==================================================================================
			File file2 = new File("data/discount.dat");
			try(
				FileInputStream f2 = new FileInputStream(file2);
				InputStreamReader isr2 = new InputStreamReader(f2, "UTF8");
				BufferedReader bs2 = new BufferedReader(isr2);	
					
			){
				while ((line = bs2.readLine()) != null) {
					if (line.startsWith(UTF8_BOM)) {
						line = line.substring(1);
					}
					String[] token = line.split("\\|");
					DiscountBean discount = new DiscountBean();
			
					discount.setDiscountEventName(token[0]);
					discount.setDiscountContent(token[1]);
					discount.setThresholdQuantity(Integer.parseInt(token[2].trim()));
					discount.setDiscount(Double.parseDouble(token[3].trim()));
					
					//日期檔案
					Timestamp c=Timestamp.valueOf(token[4].trim());
					Timestamp d=Timestamp.valueOf(token[5].trim());
					discount.setDiscountFromDate(c);
					discount.setDiscountFinishDate(d);
					
					int companyId = Integer.parseInt(token[6].trim());
					CompanyBean cb2 = session.get(CompanyBean.class, companyId);
					discount.setCompanyBean(cb2);
					
					// 讀取圖片檔
					Blob blob = SystemUtils2018.fileToBlob(token[7].trim());
					discount.setDiscountImg(blob);
					discount.setFilename2(SystemUtils2018.extractFileName(token[7].trim()));
					
					
					session.save(discount);
					System.out.println("新增一筆discount活動紀錄成功");
				}
			}catch(IOException e){
				System.err.println("新建DiscountBean表格時發生IO例外: " + e.getMessage());
				
			}
			
			
		
			
			
			//購物車滿額折扣==================================================================================
			File file4 = new File("data/shoppingDiscount.dat");
			try(
				FileInputStream f4 = new FileInputStream(file4);
				InputStreamReader isr4 = new InputStreamReader(f4, "UTF8");
				BufferedReader bs4 = new BufferedReader(isr4);	
					
			){
				while ((line = bs4.readLine()) != null) {
					if (line.startsWith(UTF8_BOM)) {
						line = line.substring(1);
					}
					String[] token = line.split("\\|");
					ShoppingDiscountBean shoppingDiscount = new ShoppingDiscountBean();
			
					shoppingDiscount.setShoppingEventName(token[0]);
					shoppingDiscount.setShoppingEventContent(token[1]);
					shoppingDiscount.setShoppingThreshold(Integer.parseInt(token[2].trim()));
					shoppingDiscount.setShoppingDiscount(Integer.parseInt(token[3].trim()));
					
					//日期檔案
					Timestamp e=Timestamp.valueOf(token[4].trim());
					Timestamp f=Timestamp.valueOf(token[5].trim());
					shoppingDiscount.setShoppingFromDate(e);
					shoppingDiscount.setShoppingFinishDate(f);
									
					session.save(shoppingDiscount);
					System.out.println("新增一筆ShoppingDiscount活動紀錄成功");
				}
			}catch(IOException e){
				System.err.println("新建ShoppingDiscount表格時發生IO例外: " + e.getMessage());
				
			}
			
			//======================================================================================
			
            tx.commit();
		} catch (Exception e) {
			System.err.println("新建表格時發生例外: " + e.getMessage());
			e.printStackTrace();
			tx.rollback();
		} 
		
		//======================================================================================
        factory.close();
	}

}