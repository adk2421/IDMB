package idmb.common.board.faq;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import idmb.model.FAQBean;

@Controller
public class FAQController {

	@Resource(name="faqService")
	private FAQService faqService;
	
	@RequestMapping(value="/faqList.do")
	public String faqList(
			FAQBean faq, HttpServletRequest request, Model model) throws Exception{
		
		//Faq들의 리스트가 필요하므로 ArrayList형의 'list' 생성
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
				
		list = faqService.faqList(faq);
		
		//model로 위에서 정의한 값 전송
		model.addAttribute("faqList",list);
		
		//tiles.xml의 definition name="FAQList"로 이동
		return "faqList";
	}
	
		
	
}
