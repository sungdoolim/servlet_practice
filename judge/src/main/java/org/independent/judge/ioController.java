package org.independent.judge;

import java.util.Locale;

import org.independent.dao.CodeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ioController {
	
@Autowired
public CodeDAO codeDao;	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/io", method = RequestMethod.GET)//judge/io
	public String home(Locale locale, Model model) {
	
		
		return "io";
	}
	@RequestMapping("/inputcode")
	public String inp(String code,Model m) {
		m.addAttribute("text", code);
		codeDao.insertCode(code);
		
		return "inputcode";
	}
}
