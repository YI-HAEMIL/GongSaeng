package com.project.gongsaeng;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = { "/", "home" }, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="/mainp")
	public ModelAndView mainpage(ModelAndView mv) {
		mv.setViewName("mytarget/mainpage");
		return mv;
	}
	
	@RequestMapping(value="/mloginf")
	public ModelAndView mloginf(ModelAndView mv) {
		mv.setViewName("mytarget/mloginForm");
		return mv;
	}
	
	@RequestMapping(value="/bloginf")
	public ModelAndView bloginf(ModelAndView mv) {
		mv.setViewName("mytarget/bloginForm");
		return mv;
	}
	
	@RequestMapping(value="/mjoinf")
	public ModelAndView mjoinf(ModelAndView mv) {
		mv.setViewName("mytarget/mjoinForm");
		return mv;
	}
	
	@RequestMapping(value="/bjoinf")
	public ModelAndView bjoinf(ModelAndView mv) {
		mv.setViewName("mytarget/bjoinForm");
		return mv;
	}
}
