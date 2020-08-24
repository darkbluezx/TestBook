package _02_statistics.dao;

import java.time.LocalDate;
import java.util.List;

import _02_statistics.model.StatisticFormatBean;

public interface StatisticsDao {
	
	//單品項單月總計
	StatisticFormatBean singleItemTotalByMonth(Integer itemId, LocalDate selectMonth);		
	
	//多品項單月總計
	List<StatisticFormatBean> multiItemTotalByMonth(Integer itemId, LocalDate selectMonth);		
	
	//單品項單年總計
	StatisticFormatBean singleItemTotalByYear(Integer itemId, LocalDate selectYear);		
	
	//多品項單年總計
	List<StatisticFormatBean> multiItemTotalByYear(Integer itemId, LocalDate selectYear);		
	
	//某年某月之銷售數量前十排行榜
	List<StatisticFormatBean> top10ItemTotalByMonth(LocalDate selectTime);		
}
