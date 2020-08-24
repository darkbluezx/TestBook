package _02_statistics.service;

import java.time.LocalDate;
import java.util.List;

import _02_statistics.model.StatisticFormatBean;

public interface StatisticService {
	
	//顯示單一品項單月銷量
	StatisticFormatBean singleItemTotalByMonth(Integer itemId, LocalDate selectMonth);
	
	//顯示多品項單月銷量
	List<StatisticFormatBean> multiItemTotalByMonth(Integer itemId, LocalDate selectMonth);
	
	//顯示單品項單年銷量
	StatisticFormatBean singleItemTotalByYear(Integer itemId, LocalDate selectYear);		
	
	//顯示多品項單年銷量
	List<StatisticFormatBean> multiItemTotalByYear(Integer itemId, LocalDate selectYear);
	
	//某年某月之銷售數量前十排行榜
	List<StatisticFormatBean> top10ItemTotalByMonth(LocalDate selectTime);	
}
