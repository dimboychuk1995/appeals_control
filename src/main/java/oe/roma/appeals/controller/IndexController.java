package oe.roma.appeals.controller;

import oe.roma.appeals.service.AppealsService;
import oe.roma.appeals.service.IUserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.security.Principal;

/**
 * Handles CRUD requests for users
 * 
 */
@Controller
@RequestMapping("/")
public class IndexController {

	protected static Logger logger = Logger.getLogger("controller");

    @Resource(name = "appealsService")
    private AppealsService appealsService;
    @Resource(name = "userService")
    private IUserService userService;

    @RequestMapping(method = RequestMethod.GET)
    public String getUsersPage(ModelMap model, Principal principal) {
    	logger.debug("Received request to show users page");
        model.addAttribute("currentUser",userService.getUserByName(principal.getName()).getFullname());
        model.addAttribute("reminderList",appealsService.reminderList());
        model.addAttribute("expiredList",appealsService.expiredList());
        model.addAttribute("active", "main");
    	return "index";
	}
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {

    	return "login";
	}
}
