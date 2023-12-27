package kr.co.cocean.mypage.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocean.mypage.dao.AddressDAO;
import kr.co.cocean.mypage.dao.WorkDAO;
import kr.co.cocean.mypage.dto.OutAddressDTO;
import kr.co.cocean.mypage.dto.WorkDTO;

@Service
public class WorkService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired WorkDAO dao;

	public ArrayList<OutAddressDTO> work() {
		
		return dao.work();
	}

	
}