package _02_statistics.dao.impl;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.type.IntegerType;
import org.hibernate.type.StringType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _02_statistics.dao.StatisticsDao;
import _02_statistics.model.StatisticFormatBean;

@Repository
public class StatisticsDaoImpl implements StatisticsDao{
	
	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public StatisticFormatBean singleItemTotalByMonth(Integer itemId, LocalDate selectMonth) {
		StatisticFormatBean sfb = null;
		Session session = factory.getCurrentSession();
		
		return sfb;
	}

	@Override
	public List<StatisticFormatBean> multiItemTotalByMonth(Integer itemId, LocalDate selectMonth) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StatisticFormatBean singleItemTotalByYear(Integer itemId, LocalDate selectYear) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StatisticFormatBean> multiItemTotalByYear(Integer itemId, LocalDate selectYear) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings({ "unchecked", "null" })
	@Override
	public List<StatisticFormatBean> top10ItemTotalByMonth(LocalDate selectTime) {
		List<StatisticFormatBean> list = new ArrayList<StatisticFormatBean>();
		Session session = factory.getCurrentSession();
		String sql = "SELECT distinct top 10 a.productNo, a.productName, c.price, convert(bigint, sum(a.productQuantity) over(partition by a.productNo))as itemQuantity " + 
				"FROM (orderitem as a INNER JOIN" + 
				"(SELECT * FROM ordermain " + 
				"where month(orderTime) = DATEPART(mm, '" + selectTime + "') " + 
				"and year(orderTime) = DATEPART(yy, '" + selectTime + "')) as b on a.orderNo = b.orderNo) " + 
				"INNER JOIN (select * from book) as c on a.productNo = c.bookId " + 
				"WHERE b.orderCancel = 1 order by itemQuantity desc";
				
		List<Object[]> list2 = session.createSQLQuery(sql)
											   .addScalar("productNo", IntegerType.INSTANCE)
											   .addScalar("productName", StringType.INSTANCE)
											   .addScalar("price", IntegerType.INSTANCE)
											   .addScalar("itemQuantity", IntegerType.INSTANCE)
											   .list();
		
		for (Object[] objects : list2) {
			Integer productNo = (Integer) objects[0];
			String productName = (String) objects[1];
			Integer price = (Integer) objects[2];
			Integer itemQuantity = (Integer) objects[3];
			StatisticFormatBean sfb = new StatisticFormatBean(productNo, productName, price, itemQuantity);
			list.add(sfb);
		}
		
		return list;
	}
	
	
	
}
