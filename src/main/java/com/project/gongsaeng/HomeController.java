package com.project.gongsaeng;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.PlaceinfoService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	PlaceinfoService service;
	
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
		
		String[] title = {"서울 북부", "서울 남부", "서울 서부", "서울 동부", "수도권"};
		String[] north = {"서촌","북촌/익선동","성북구","혜화","부암동","동대문"};
		String[] south = {"청담/삼성동","신사/압구정","강남/양재","고터/반포"};
		String[] west = {"한남","이태원","연남동","망원/서교","신촌","용산","문래동"};
		String[] east = {"성수","잠실","건대","강동구"};
		String[] carea = {"수원","성남","판교","파주","송도","하남"};
		model.addAttribute("title", title);
		model.addAttribute("north", north);
		model.addAttribute("south", south);
		model.addAttribute("west", west);
		model.addAttribute("east", east);
		model.addAttribute("carea", carea);
		
		return "home";
	}
	
	@RequestMapping(value="/mainp")
	public ModelAndView mainpage(ModelAndView mv) {
		/*
		List<PlaceinfoVO> list = service.selectList();
		if(list != null) {
			int listsize=list.size();
			mv.addObject("pVO", list);
			
			List<String> thumbList = new ArrayList<String>();
			for (int i = 0; i < listsize; i++) {
				int placeid = list.get(i).getPlace_id();
				List<PlacefileVO> imgList = service.getFileList(placeid);
				thumbList.add(imgList.get(0).getFile_path());
			}
			
		} else {
			
			mv.addObject("msg", "출력할 장소가 없습니다.");
		}
		*/
		mv.setViewName("mytarget/mainpage");
		return mv;
	}
	
	@RequestMapping(value="/mypage")
	public ModelAndView mypage(ModelAndView mv) {
		mv.setViewName("mytarget/mypage");
		return mv;
	}
}
