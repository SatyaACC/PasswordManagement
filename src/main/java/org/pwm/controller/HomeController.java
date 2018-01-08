package org.pwm.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.pwm.model.SearchDetails;
import org.pwm.service.PwmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@Autowired
	PwmService pwmService;

	private static final Logger logger = LogManager.getLogger(HomeController.class);

	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView showLoginPage(HttpServletRequest request, HttpServletResponse response) {
		logger.debug("inside homecontroller");		
		ModelAndView mav = new ModelAndView("adminlogin");
		mav.addObject("errorMsg", "");
		return mav;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView validateUser(HttpServletRequest request,HttpServletResponse response) throws SQLException{
		
		logger.debug("inside login");
		
		//String userId = userDetails.getUser();
		//String pwd = userDetails.getPassword();
		
		String userId = request.getParameter("userid");
		String pwd = request.getParameter("password");
		
		logger.debug("User Id..." + userId);
		
		String validateFlag = pwmService.validateUser(userId, pwd);
		String validateFlagRole[] = validateFlag.split("\\|");
		String flg = "";
		String userRole = "";
		
		if(null != validateFlagRole && validateFlagRole.length==2){
			System.out.println("validateFlagRole length..."+validateFlagRole.length);
			flg = validateFlagRole[0];
			userRole = validateFlagRole[1];
		}
		System.out.println("flg.."+flg);
		if ("Y".equalsIgnoreCase(flg)) {
			Map<String, List<String>> dataMap = pwmService.getDataList();
			ModelAndView mav = new ModelAndView("index");
			mav.addObject("dataMap", dataMap);
			mav.addObject("user",userId);
			return mav;
		} else {
			String errorMsg = "Your UserID/Password is incorrect";
			ModelAndView mav = new ModelAndView("adminlogin");
			mav.addObject("errorMsg", errorMsg);
			return mav;
		}

	}

	/**
	 * 
	 * @param searchDetails
	 * @param result
	 * @return
	 */
	@RequestMapping(value = "/retrieveUser", method = RequestMethod.POST)
	public @ResponseBody String retrieveDetails(@ModelAttribute(value = "searchDetails") SearchDetails searchDetails,
			BindingResult result) throws SQLException {
		logger.debug("inside retireveUser");
		String returnStr = "";
		String password = "";
		String pwdButton = "";
		logger.debug(searchDetails);
		if (null != searchDetails) {
			password = pwmService.fetchPassWord(searchDetails);

			// Preparing Copy button for password if password is not null or
			// empty
			if (null != password && !password.isEmpty()) {
				pwdButton = "******&emsp;<button type='button' id='pwd' value='" + password
						+ "' class='cpyBtn' onclick='copyToClipboard()'>Copy</button>";
			}
			String msg="<h2 class=\"pwdRes\" style=\"color: black;\">Password Details</h2>";
			returnStr = new StringBuffer("<table id='userdetails' class='userdetails'>")
					.append(msg)
					.append("<tr>").append("<th>User</th>")
					.append("<th>Environment</th>").append("<th>Release</th>").append("<th>Applications</th>")
					.append("<th>Password</th>").append("</tr>").append("<tr>")
					.append("<td>" + searchDetails.getUser() + "</td>")
					.append("<td>" + searchDetails.getEnvironment() + "</td>")
					.append("<td>" + searchDetails.getRelease() + "</td>")
					.append("<td>" + searchDetails.getApplication() + "</td>").append("<td>" + pwdButton + "</td>")
					.toString();

		}
		logger.debug("result string created..." + returnStr);
		return returnStr;
	}

}
