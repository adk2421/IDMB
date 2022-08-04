package idmb.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMainController {

	@RequestMapping(value="/adminMain.do")
	public String adminMain(HttpServletRequest request, Model model) throws Exception{
			
		return "adminMain";
	}
}
