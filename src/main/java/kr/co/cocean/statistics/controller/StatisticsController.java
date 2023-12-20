package kr.co.cocean.statistics.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StatisticsController {

	@GetMapping(value="statistics.list.do")
	public String statisticsList(Model model) {
		model.addAttribute("string","string");
		return "statistics/statistics";
	}
}
