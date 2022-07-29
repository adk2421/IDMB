package idmb.common.board.notice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import idmb.model.NoticeBean;
import idmb.util.Paging;

@Controller
public class NoticeController {

	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	@RequestMapping(value="/noticeList.do")
	public String noticeList(NoticeBean notice, HttpServletRequest request, Model model)throws Exception{
		
		/* 페이징을 위한 변수 */
		int pageSize = 5; // 페이지당 출력할 공지의 수
		int START = 1;
		int END = pageSize;
		int currentPage = 1; // 현재 페이지
		
		int totalCount; // 전체 공지의 수
		int pageBlock = 5; // 표시할 페이지의 수
		String url = "noticeList.do";
		String searchUrl = "";
		
		//기본 페이지가 아닌 경우
		if(request.getParameter("page")!=null) {
			currentPage = Integer.parseInt(request.getParameter("page")); //현재 페이지
			START = 1 + pageSize * (currentPage-1); //1,11,21 단위로 상품 출력
			END = pageSize * currentPage;
		}
		
		totalCount = noticeService.noticeCount();
		
		//페이징
		Paging paging = new Paging(totalCount, pageBlock, pageSize, currentPage, url, searchUrl);

		
		//Notice들의 리스트가 필요하므로 ArrayList형의 'list' 생성
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
						
		list = noticeService.noticeList(START, END);
		
		model.addAttribute("noticeList",list);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("paging",paging);
		
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
