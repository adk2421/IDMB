package idmb.common.board.notice;

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
public class NoticeController {

	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	@RequestMapping(value="/noticeList.do")
	public String noticeList(NoticeBean notice, Model model)throws Exception{
		
		//Notice들의 리스트가 필요하므로 ArrayList형의 'list' 생성
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
						
		list = noticeService.noticeList();
		
		model.addAttribute("noticeList",list);
		
		//tiles.xml의 definition name="noticeList"로 이동
		return "noticeList";
	}
	
	@RequestMapping(value="/noticeDetail.do")
	public String noticeDetail(NoticeBean notice, Model model)throws Exception{
		
		//특정 Notice의 map만 필요하므로 HashMap형태의 'map' 생성
		Map<String, Object> map = new HashMap<String, Object>();
	   	
		//특정 Notice의 조회수를 1 증가
		noticeService.updateNoticeHit(notice);
		
		map = noticeService.noticeDetail(notice);
		
		model.addAttribute("noticeBean",map);
		
		//tiles.xml의 definition name="noticeDetail"로 이동
		return "noticeDetail";
	}
}
