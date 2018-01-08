package org.pwm.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.pwm.dao.PwmDAO;
import org.pwm.model.SearchDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PwmService {

	@Autowired
	PwmDAO pwmDao;

	/**
	 * 
	 * @return
	 */
	public Map<String, List<String>> getDataList() {
		Map<String, List<String>> dataMap = pwmDao.getDataMap();

		return dataMap;
	}

	/**
	 * 
	 * @param searchDetails
	 * @return
	 */
	public String fetchPassWord(SearchDetails searchDetails) throws SQLException {
		String password = "";
		password = pwmDao.fetchPassWord(searchDetails);
		return password;
	}

	/**
	 * 
	 * @param userId
	 * @param password
	 * @return
	 * @throws SQLException
	 */
	public String validateUser(String userId, String password) throws SQLException {
		String validateFlg = "";
		System.out.println("inside service"+validateFlg);
		validateFlg = pwmDao.validateUser(userId, password);
		return validateFlg;
	}

}
