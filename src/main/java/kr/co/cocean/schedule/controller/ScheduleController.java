package kr.co.cocean.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScheduleController {

	@RequestMapping(value="/schedule.do")
	public String schedule() {
		
		return "schedule/schedule";
	}
}
