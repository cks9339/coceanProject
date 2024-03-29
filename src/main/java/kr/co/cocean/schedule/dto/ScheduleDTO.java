package kr.co.cocean.schedule.dto;




import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.apache.ibatis.type.Alias;

@Alias("schedule")
public class ScheduleDTO {

	private String callendarTitle;
	private int scheduleID;
	private int employeeID;
	private String title;

	private String subCategory;
	private String description;
	private String remarks;
	private String category;
	private String backgroundColor;
	private boolean publicCategory;


	public String getBackgroundColor() {
		return backgroundColor;
	}

	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}

	public int getEmployeeID() {
		return employeeID;
	}

	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}

	public int getScheduleID() {
		return scheduleID;
	}

	public void setScheduleID(int scheduleID) {
		this.scheduleID = scheduleID;
	}
	private String start;
	private String end;



	public LocalDateTime getStart() {
		return LocalDateTime.parse(start, DateTimeFormatter.ISO_DATE_TIME);
	}

	public void setStart(String start) {
		this.start = start;
	}

	public LocalDateTime getEnd() {
		return LocalDateTime.parse(end, DateTimeFormatter.ISO_DATE_TIME);
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getCallendarTitle() {
		return callendarTitle;
	}

	public void setCallendarTitle(String callendarTitle) {
		this.callendarTitle = callendarTitle;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}



	public boolean isPublicCategory() {
		return publicCategory;
	}

	public void setPublicCategory(boolean publicCategory) {
		this.publicCategory = publicCategory;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCallenderTitle() {
		return callendarTitle;
	}

	public void setCallenderTitle(String callederTitle) {
		this.callendarTitle = callederTitle;
	}



}
