package idmb.admin.board.faq;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import idmb.model.FAQBean;

@Controller
public class AdminFaqController {
	
	@Resource(name="adminFaqService")
	private AdminFaqService adminFaqService;
	
	@RequestMapping(value="/adminFaqList.do")
	public String adminFaqList(
			FAQBean faq, HttpServletRequest request, Model model) throws Exception{
		
		//Faq들의 리스트가 필요하므로 ArrayList형의 'list' 생성
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
				
		list = adminFaqService.adminFaqList(faq);
		
		//model로 위에서 정의한 값 전송
		model.addAttribute("adminFaqList",list);
		
		//tiles.xml의 definition name="adminFaqList"로 이동
		return "adminFaqList";
	}
	
	@RequestMapping(value="/adminInsertFaqForm.do")
	public String adminInsertFaqForm(FAQBean faq, Model model)throws Exception{
		
		//tiles.xml의 definition name="adminInsertFaqForm"로 이동
		return "adminInsertFaqForm";
	}
	
	@RequestMapping(value="/adminInsertFaq.do")
	public String adminInsertFaq(
			FAQBean faq, HttpServletRequest request, Model model) throws Exception{
		
		//textarea 형식으로 상세정보를 입력받았기 때문에 enter를 문자 처리 해주어야함.
		String f_contents = request.getParameter("f_contents");
		f_contents = f_contents.replace("\r\n","<br>");
		
		faq.setF_contents(f_contents);
		
		adminFaqService.adminInsertFaq(faq);
		
		model.addAttribute("msg", "FAQ가 작성되었습니다.");
		model.addAttribute("url", "/adminFaqList.do?f_category=cost");
		
		//tile.xml로 이동하지 않고 바로 jsp 실행
		return "admin/board/faq/adminInsertFaq";
	}
	
	@RequestMapping(value="/adminUpdateFaqForm.do")
	public String adminUpdateFaqForm(FAQBean faq, Model model)throws Exception{
		
		//F_NUM 값을 파라미터로 넘겨받음
		Map<String, Object> map = new HashMap<String, Object>();
		
		map = adminFaqService.adminFaqDetail(faq);
		
		model.addAttribute("adminFaqBean",map);
		
		//tiles.xml의 definition name="adminUpdateFaqForm"로 이동
		return "adminUpdateFaqForm";
	}
	
	@RequestMapping(value="/adminUpdateFaq.do")
	public String adminUpdateFaq(
			FAQBean faq, HttpServletRequest request, Model model) throws Exception{
		
		//textarea 형식으로 상세정보를 입력받았기 때문에 enter를 문자 처리 해주어야함.
		String f_contents = request.getParameter("f_contents");
		f_contents = f_contents.replace("\r\n","<br>");
		
		faq.setF_contents(f_contents);
		
		adminFaqService.adminUpdateFaq(faq);
		
		model.addAttribute("msg", "FAQ가 수정되었습니다.");
		model.addAttribute("url", "/adminFaqList.do?f_category=cost");
		
		//tile.xml로 이동하지 않고 바로 jsp 실행
		return "admin/board/faq/adminUpdateFaq";
	}
	
	@RequestMapping(value="/adminDeleteFaq.do")
	public String adminDeleteFaq(
			FAQBean faq, HttpServletRequest request, Model model) throws Exception{
		
		adminFaqService.adminDeleteFaq(faq);
		
		model.addAttribute("msg", "FAQ가 삭제되었습니다.");
		model.addAttribute("url", "/adminFaqList.do?f_category=cost");
		
		//tile.xml로 이동하지 않고 바로 jsp 실행
		return "admin/board/faq/adminDeleteFaq";
	}
	

}
