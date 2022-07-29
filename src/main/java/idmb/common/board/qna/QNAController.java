 package idmb.common.board.qna;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import idmb.common.member.MyInfoService;
import idmb.model.QNABean;
import idmb.util.Paging;

@Controller
public class QNAController {
	
	@Resource(name="qnaService")
	private QNAService qnaService;
	
	@Resource(name="myInfoService")
	private MyInfoService myInfoService;
	
	@RequestMapping(value="/qnaMain.do")
	public String qnaMain() throws Exception{
		
		return "qnaMain";
	}
	
	@RequestMapping(value="/qnaList.do")
	public String qnaList(QNABean qna, HttpServletRequest request, Model model) throws Exception{
	
		/* 페이징을 위한 변수 */
		int pageSize = 5; // 페이지당 출력할 회원의 수
		int START = 1;
		int END = pageSize;
		int currentPage = 1; // 현재 페이지
		
		int totalCount; // 전체 회원의 수
		int pageBlock = 5; // 표시할 페이지의 수
		String url = "qnaList.do";
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
			totalCount = qnaService.qnaCount(qna);
		} else {
			totalCount = qnaService.searchQnaCount(qna, searchValue, SORT, qst);
		}
		
		//페이징
		Paging paging = new Paging(totalCount, pageBlock, pageSize, currentPage, url, searchUrl);
				
		//QNA들의 리스트가 필요하므로 ArrayList형의 'list' 생성
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		if(SORT == null) {
			list = qnaService.qnaList(qna, START, END);
		} else {
			list = qnaService.searchQna(qna, searchValue, SORT, qst, START, END);
		}
		
		//model로 위에서 정의한 값 전송
		model.addAttribute("q_category",q_category);
		model.addAttribute("SORT", SORT);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("qst", qst);
		model.addAttribute("qnaList", list);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("paging",paging);	
		
		//tiles.xml의 definition name="qnaList"로 이동
		return "qnaList";
	}
	
	@RequestMapping(value="/qnaDetail.do")
	public String qnaDetail(QNABean qna, HttpServletRequest request, Model model) throws Exception{
		//특정 QNA의 map만 필요하므로 HashpMap형태의 'map' 생성		
		Map<String, Object> map = new HashMap<String, Object>();
		//추출한 QNA의 답글만 따로 추출
		Map<String, Object> mapR = new HashMap<String, Object>();
		
		//adminQnaList에서 q_num=? 로 입력받은 q_num값을 qna에 주어 상세정보 검색		
		map = qnaService.qnaDetail(qna);
		mapR = qnaService.qnaRe(qna);
		
		//model로 위에서 정의한 값 전송
		model.addAttribute("qnaBean",map);
		model.addAttribute("qnaReBean",mapR);
		
		//tiles.xml의 definition name="qnaDetail"로 이동
		return "qnaDetail";	
	}
	
	@RequestMapping(value="/myQnaList.do")
	public String myQnaList(HttpServletRequest request, Model model) throws Exception{
		String id = (String) request.getSession().getAttribute("id");
		QNABean qna = new QNABean();
		qna.setQ_id(id);
		
        List<Map<String, Object>> myQnaList = new ArrayList<Map<String, Object>>();

        myQnaList = qnaService.myQnaList(qna);
        
        model.addAttribute("myQnaList", myQnaList);
        
		return "myQnaList";
	}

	@RequestMapping(value="/insertQnaForm.do")
	public String insertQnaForm(HttpServletRequest request, Model model) throws Exception{
				
		return "insertQnaForm";
	}
	
	@RequestMapping(value="/insertQna.do")
	public String insertQna(
			QNABean qna, HttpServletRequest request, Model model) throws Exception{
		
		String q_contents = request.getParameter("q_contents");
		q_contents = q_contents.replace("\r\n","<br>");
		
		qna.setQ_contents(q_contents);
		
		qnaService.insertQna(qna);
		
		model.addAttribute("msg", "문의가 작성되었습니다.");
		model.addAttribute("url", "/qnaMain.do");
		
		return "board/qna/insertQna";
	}
	
	
	
	@RequestMapping(value="/updateQnaForm.do")
	public String updateQnaForm(QNABean qna, Model model) throws Exception{
		
		//특정 QNA의 map만 필요하므로 HashpMap형태의 'map' 생성		
		Map<String, Object> map = new HashMap<String, Object>();
		//추출한 QNA의 답글만 따로 추출
		Map<String, Object> mapR = new HashMap<String, Object>();
		
		//qnaList에서 q_num=? 로 입력받은 q_num값을 qna에 주어 상세정보 검색		
		map = qnaService.qnaDetail(qna);
		mapR = qnaService.qnaRe(qna);

		//model로 위에서 정의한 값 전송
		model.addAttribute("qnaBean",map);
		model.addAttribute("qnaReBean",mapR);
		
		return "updateQnaForm";
	}

	
	@RequestMapping(value="/updateQna.do")
	public String updateQna(
			QNABean qna, HttpServletRequest request, Model model) throws Exception{
		
		String q_contents = request.getParameter("q_contents");
		q_contents = q_contents.replace("\r\n","<br>");
		
		qna.setQ_contents(q_contents);
		
		qnaService.updateQna(qna);
		
		model.addAttribute("msg", "문의가 수정되었습니다.");
		model.addAttribute("url", "/qnaMain.do");
		
		return "board/qna/updateQna";
	}
	
	
	@RequestMapping(value="/deleteQna.do")
	public String deleteQna(
			QNABean qna, Model model) throws Exception{
		
		qnaService.deleteQna(qna);
		
		model.addAttribute("msg", "문의가 삭제되었습니다.");
		model.addAttribute("url", "/qnaMain.do");
		
		return "board/qna/deleteQna";
	}
	
	
	
	

}
