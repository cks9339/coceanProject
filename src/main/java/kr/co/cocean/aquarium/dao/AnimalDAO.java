package kr.co.cocean.aquarium.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.cocean.aquarium.dto.AnimalDTO;
import kr.co.cocean.aquarium.dto.ClassficationDTO;
import kr.co.cocean.aquarium.dto.InChargeDTO;
import kr.co.cocean.aquarium.dto.LogPlanDTO;
import kr.co.cocean.main.dto.FileDTO;

@Mapper
public interface AnimalDAO {

	ArrayList<AnimalDTO> animalList();

	ArrayList<ClassficationDTO> classficationSearch(String keyword);

	ArrayList<HashMap<String, String>> tankList(int branchID);

	void animalWrte(AnimalDTO param);

	String classfication(int speciesID);

	void upload(FileDTO dto);

	AnimalDTO animalDetail(int animalID);

	ArrayList<InChargeDTO> animalInCharge(int animalID);

	ArrayList<LogPlanDTO> animalLogPlan(int animalID, String con, String month);

	ArrayList<FileDTO> animalImage(int animalID);

	void logplanWrite(LogPlanDTO param);

	HashMap<String, String> employeeInfo(int employeeID);

	void inchargeDel(@Param("animalID") int animalID, @Param("delList") ArrayList<Integer> delList);
	
	void inchargeInsert(@Param("animalID") int animalID, @Param("insertList") ArrayList<Integer> insertList);

	void statusChange(@Param("animalID") int animalID, @Param("status") String status);
}
