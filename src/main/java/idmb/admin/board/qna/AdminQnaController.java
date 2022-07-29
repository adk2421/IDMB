package idmb.admin.board.qna;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import idmb.model.QNABean;
import idmb.util.Paging;

@Controller
public class AdminQnaController {

	@Resource(name="adminQnaService")
	private AdminQnaService adminQnaService;
	
	@RequestMapping(value="/adminQnaMain.do")
	public String adminQnaMain() throws Exception{
		
		return "adminQnaMain";
	}
	
	@RequestMapping(value="/adminQnaList.do")
	public String adminQnaList(
			QNABean qna, HttpServletRequest request, Model model) throws Exception{
		
		/* 페이징을 위한 변수 */
		int pageSize = 5; // 페이지당 출력할 회원의 수
		int START = 1;
		int END = pageSize;
		int currentPage = 1; // 현재 페이지
		
		int totalCount; // 전체 회원의 수
		int pageBlock = 5; // 표시할 페이지의 수
		String url = "adminQnaList.do";
		String searchUrl = "";	
		
		//검색 종류, 검색어, 카테고리 입력받음
		String q_category = request.getParameter("q_category");
		String SORT = request.getParameter("SORT");
		String searchValue = request.getParameter("searchValue");
		String qst = request.getParameter("qst");
		
		//검색조건 유무에 따른 searchUrl 설정
		if(SORT == null) { //초기페이지
			searchUrl = "&q_category="+q_category;
		}
		else {
			 if(qst == null) {
				if(searchValue == null || searchValue.trim() == "") {
					searchUrl = "&q_category="+q_category+"&SORT="+SORT+
							"&searchValue=";
				} else {
					searchUrl = "&q_category="+q_category+"&SORT="+SORT+
							"&searchValue="+searchValue;	
				}
			 }
			 else {
				if(searchValue == null || searchValue.trim() == "") {
					searchUrl = "&q_category="+q_category+"&SORT="+SORT+
							"&searchValue=&qst="+qst;
				} else {
					searchUrl = "&q_category="+q_category+"&SORT="+SORT+
							"&searchValue="+searchValue+"&qst="+qst;
				}
			}
		}
		
		//기본 페이지가 아닌 경우
		if(request.getParameter("page")!=null) {
			currentPage = Integer.parseInt(request.getParameter("page")); //현재 페이지
			START = 1 + pageSize * (currentPage-1); //1,11,21 단위로 상품 출력
			END = pageSize * currentPage;
		}					
		
		//검색 조건 유무에 따른 totalCount 개수 확인
		if(SORT == null) {
			totalCount = adminQnaService.adminQnaCount(qna);
		} else {
			totalCount = adminQnaService.adminSearchQnaCount(qna, searchValue, SORT, qst);
		}
		
		//페이징
		Paging paging = new Paging(totalCount, pageBlock, pageSize, currentPage, url, searchUrl);
				
		//QNA들의 리스트가 필요하므로 ArrayList형의 'list' 생성
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		if(SORT == null) {
			list = adminQnaService.adminQnaList(qna, START, END);
		} else { //SORT == null 인경우. 초기페이지
			list = adminQnaService.adminSearchQna(qna, searchValue, SORT, qst, START, END);
		}
		
		//model로 위에서 정의한 값 전송
		model.addAttribute("q_category",q_category);
		model.addAttribute("SORT", SORT);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("qst", qst);
		model.addAttribute("adminQnaList", list);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("paging",paging);		
		
		//tiles.xml의 definition name="adminQnaList"로 이동
		return "adminQnaList";
	}
	
	@RequestMapping(value="/adminQnaDetail.do")
	public String adminQnaDetail(
			QNABean qna, HttpServletRequest request, Model model) throws Exception {
		
		//특정 QNA의 map만 필요하므로 HashpMap형태의 'map' 생성		
		Map<String, Object> map = new HashMap<String, Object>();
		//추출한 QNA의 답글만 따로 추출
		Map<String, Object> mapR = new HashMap<String, Object>();
		
		//adminQnaList에서 q_num=? 로 입력받은 q_num값을 qna에 주어 상세정보 검색		
		map = adminQnaService.adminQnaDetail(qna);
		mapR = adminQnaService.adminQnaRe(qna);
		
		//model로 위에서 정의한 값 전송
		model.addAttribute("adminQnaBean",map);
		model.addAttribute("adminQnaReBean",mapR);
		
		//tiles.xml의 definition name="adminQnaDetail"로 이동
		return "adminQnaDetail";	
	}
	
	@RequestMapping(value="/adminInsertQnaForm.do")
	public String adminInsertQnaForm(
			QNABean qna, HttpServletRequest request, Model model) throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();

		map = adminQnaService.adminQnaDetail(qna);
		
		model.addAttribute("adminQnaBean",map);
		
		return "adminInsertQnaForm";
		
	}
	
	@RequestMapping(value="/adminInsertQna.do")
	public String adminInsertQna(
			QNABean qna, HttpServletRequest request, Model model) throws Exception{
		
		//textarea 형식으로 상세정보를 입력받았기 때문에 enter를 문자 처리 해주어야함.
		String q_contents = request.getParameter("q_contents");
		q_contents = q_contents.replace("\r\n","<br>");
		
		qna.setQ_contents(q_contents);
		
		//QNA 답변 상태 변경
		adminQnaService.adminUpdateQna(qna);
		//QNA 답변 작성
		adminQnaService.adminInsertQna(qna);
		
		model.addAttribute("msg", "답변이 작성되었습니다.");
		model.addAttribute("url", "/adminQnaMain.do");
		
		//tile.xml로 이동하지 않고 바로 jsp 실행
		return "admin/board/qna/adminInsertQna";
	}
	
	@RequestMapping(value="/adminDeleteQna.do")
	public String adminDeleteQna(
			QNABean qna, Model model) throws Exception{
		
		adminQnaService.adminDeleteQna(qna);
		
		model.addAttribute("msg", "문의가 삭제되었습니다.");
		model.addAttribute("url", "/adminQnaMain.do");
		
		return "admin/board/qna/adminDeleteQna";
	}
	
}
