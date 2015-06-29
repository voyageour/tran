package com.corporate.carpool.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.corporate.carpooldb.db.CarpoolService;
import com.corporate.carpooldb.dto.User;

@Controller
public class DashboardController {

	Logger log = Logger.getLogger(DashboardController.class);

	@Autowired
	CarpoolService carpoolService=null;

	@RequestMapping(value = "/home.jsp")
	public ModelAndView getLoginPage1(HttpServletRequest req, Principal principal){

		String viewName = "index";
		log.debug("Request came for displaying home page.");
		ModelAndView modelAndView = new ModelAndView(viewName);


		log.debug("Fetching list of all user, to display count on home page.");
		List<User> listOfAllUser= carpoolService.getAllUser();
		log.debug("Completed fetching list of all user with object value :"+listOfAllUser);

		log.info("Adding count of all registered users, so that view can display it.");
		modelAndView.addObject("totalUserCount", listOfAllUser.size());


		return modelAndView;

	}

}
