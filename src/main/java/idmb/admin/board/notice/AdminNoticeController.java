package idmb.admin.board.notice;

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
public class AdminNoticeController {
	
	@Resource(name="adminNoticeService")
	private AdminNoticeService adminNoticeService;
	
	@RequestMapping(value="/adminNoticeList.do")
	public String adminNoticeList(
			NoticeBean notice, HttpServletRequest request, Model model)throws Exception{
		
		/* 페이징을 위한 변수 */
		int pageSize = 5; // 페이지당 출력할 공지의 수
		int START = 1;
		int END = pageSize;
		int currentPage = 1; // 현재 페이지
		
		int totalCount; // 전체 공지의 수
		int pageBlock = 5; // 표시할 페이지의 수
		String url = "adminNoticeList.do";
		String searchUrl = "";
		
		//기본 페이지가 아닌 경우
		if(request.getParameter("page")!=null) {
			currentPage = Integer.parseInt(request.getParameter("page")); //현재 페이지
			START = 1 + pageSize * (currentPage-1); //1,11,21 단위로 상품 출력
			END = pageSize * currentPage;
		}
		
		totalCount = adminNoticeService.adminNoticeCount();
		
		//페이징
		Paging paging = new Paging(totalCount, pageBlock, pageSize, currentPage, url, searchUrl);

		//Notice들의 리스트가 필요하므로 ArrayList형의 'list' 생성
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
						
		list = adminNoticeService.adminNoticeList(START, END);
		
		model.addAttribute("adminNoticeList",list);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("paging",paging);
		
		//tiles.xml의 definition name="adminNoticeList"로 이동
		return "adminNoticeList";
	}
	
	@RequestMapping(value="/adminNoticeDetail.do")
	public String adminNoticeDetail(NoticeBean notice, Model model)throws Exception{
		
		//특정 Notice의 map만 필요하므로 HashMap형태의 'map' 생성
		Map<String, Object> map = new HashMap<String, Object>();
	   	
		//특정 Notice의 조회수를 1 증가
		adminNoticeService.adminNoticeHit(notice);
		
		map = adminNoticeService.adminNoticeDetail(notice);
		
		model.addAttribute("adminNoticeBean",map);
		
		//tiles.xml의 definition name="adminNoticeDetail"로 이동
		return "adminNoticeDetail";
	}
	
	@RequestMapping(value="/adminInsertNoticeForm.do")
	public String Insert(NoticeBean notice, Model model) throws Exception{
		
		//tiles.xml의 definition name="adminInsertNoticeForm"로 이동
		return "adminInsertNoticeForm";		
	}
	
	@RequestMapping(value="/adminInsertNotice.do")
	public String adminInsertNotice(
			NoticeBean notice, HttpServletRequest request, Model model) throws Exception{
		
		//textarea 형식으로 상세정보를 입력받았기 때문에 enter를 문자 처리 해주어야함.
		String n_contents = request.getParameter("n_contents");
		n_contents = n_contents.replace("\r\n","<br>");
		
		notice.setN_contents(n_contents);
		
		adminNoticeService.adminInsertNotice(notice);
		
		model.addAttribute("msg", "공지가 작성되었습니다.");
		model.addAttribute("url", "/adminNoticeList.do");
		
		//tile.xml로 이동하지 않고 바로 jsp 실행
		return "admin/board/notice/adminInsertNotice";
	}	
	

	@RequestMapping(value="/adminUpdateNoticeForm.do")
	public String adminUpdateNoticeForm(NoticeBean notice, Model model) throws Exception{
		
		//N_NUM 값을 파라미터로 넘겨받음
		Map<String, Object> map = new HashMap<String, Object>();
		
		map = adminNoticeService.adminNoticeDetail(notice);
		
		model.addAttribute("adminNoticeBean",map);
		
		//tiles.xml의 definition name="aadminUpdateNoticeForm"로 이동
		return "adminUpdateNoticeForm";		
	}
	
	@RequestMapping(value="/adminUpdateNotice.do")
	public String adminUpdateNotice(
			NoticeBean notice, HttpServletRequest request, Model model) throws Exception{
		
		//textarea 형식으로 상세정보를 입력받았기 때문에 enter를 문자 처리 해주어야함.
		String n_contents = request.getParameter("n_contents");
		n_contents = n_contents.replace("\r\n","<br>");
		
		notice.setN_contents(n_contents);
		
		adminNoticeService.adminUpdateNotice(notice);
		
		model.addAttribute("msg", "공지가 수정되었습니다.");
		model.addAttribute("url", "/adminNoticeList.do");
		
		//tile.xml로 이동하지 않고 바로 jsp 실행
		return "admin/board/notice/adminUpdateNotice";
	}
		
	@RequestMapping(value="/adminDeleteNotice.do")
	public String adminDeleteNotice(
			NoticeBean notice, Model model) throws Exception{
		
		adminNoticeService.adminDeleteNotice(notice);
		
		model.addAttribute("msg", "공지가 삭제되었습니다.");
		model.addAttribute("url", "/adminNoticeList.do");
		
		//tile.xml로 이동하지 않고 바로 jsp 실행
		return "admin/board/notice/adminDeleteNotice";
	}
	

}
