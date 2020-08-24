package _02_statistics.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import _02_statistics.model.StatisticFormatBean;
import _02_statistics.service.StatisticService;
import _05_loginSystem.model.Members;

@Controller
@SessionAttributes({"Admin"})
public class StatisticController {
	
	@Autowired
	StatisticService statisticService;
	
	@Autowired
	ServletContext ctx;
	
	@GetMapping("/statistics_Manager")
	public String statistics_Manager(Model model,
			String itemId, String selectMonth) {
		Members m = (Members) model.getAttribute("Admin");
		if (m == null) {
			return "redirect: " + ctx.getContextPath() + "/Login";
		}
		
		return "/_02_statistics/statistics_Manager";
	}
	
	@GetMapping("/a123")
	public ResponseEntity<Map<String,String>> singleItemTotalByMonth(Model model,
			String itemId, String selectMonth) {
		ResponseEntity<Map<String, String>> re = null;
		Map<String, String> sfbMap = new HashMap<String, String>();
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String date = selectMonth + "01";
		LocalDate selectDate = LocalDate.parse(date, formatter);
		
		re = new ResponseEntity<Map<String,String>>(sfbMap, HttpStatus.CREATED);
		
		return re;
	}
	
	//取得特定年月後，顯示相對時間之銷售數量前十排行榜
		@GetMapping(value = "/statistics_Manager/top10")
		public ResponseEntity<List<StatisticFormatBean>> top10ItemTotalByMonth(Model model,
				String selectYear,
				String selectMonth) {

			Integer integer = Integer.valueOf(selectMonth);
			if (integer>0 && integer<10) {
				selectMonth = "0"+ selectMonth;
			} 
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
			String date = selectYear + selectMonth + "01";
			LocalDate selectDate = LocalDate.parse(date, formatter);
			
			List<StatisticFormatBean> list = statisticService.top10ItemTotalByMonth(selectDate);
			ResponseEntity<List<StatisticFormatBean>> re = null;
			
			re = new ResponseEntity<List<StatisticFormatBean>>(list, HttpStatus.CREATED);
			return re;
		}
}
