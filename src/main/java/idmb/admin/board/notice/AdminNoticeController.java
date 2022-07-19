package idmb.admin.board.notice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import idmb.model.NoticeBean;

@Controller
public class AdminNoticeController {
	
	@Resource(name="adminNoticeService")
	private AdminNoticeService adminNoticeService;
	
	@RequestMapping(value="/adminNoticeList.do")
	public String adminNoticeList(NoticeBean notice, Model model)throws Exception{
		
		//Notice들의 리스트가 필요하므로 ArrayList형의 'list' 생성
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
						
		list = adminNoticeService.adminNoticeList();
		
		model.addAttribute("adminNoticeList",list);
		
		return "adminNoticeList";
	}
	
	@RequestMapping(value="/adminNoticeDetail.do")
	public String adminNoticeDetail(NoticeBean notice, Model model)throws Exception{
		
		//특정 Notice의 map만 필요하므로 HashMap형태의 'map' 생성
		Map<String, Object> map = new HashMap<String, Object>();
	    
		map = adminNoticeService.adminNoticeDetail(notice);
		
		model.addAttribute("adminNoticeBean",map);
		
		//tiles.xml의 definition name="adminNoticeDetail"로 이동
		return "adminNoticeDetail";
	}
	
	

}
