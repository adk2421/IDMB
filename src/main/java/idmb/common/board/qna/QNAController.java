package idmb.common.board.qna;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import idmb.common.member.MyInfoService;
import idmb.model.QNABean;

@Controller
public class QNAController {
	
	@Resource(name="qnaService")
	private QNAService qnaService;
	
	@Resource(name="myInfoService")
	private MyInfoService myInfoService;
	
	@RequestMapping(value="/qnaMain.do")
	public String qnaMain() throws Exception{
		
		return "board/qna/qnaMain";
	}
	
	@RequestMapping(value="/qnaList.do")
	public String qnaList(QNABean qna, HttpServletRequest request, Model model) throws Exception{
		
		//검색 종류, 검색어
		String SORT = null;
		String searchValue = null;
		String qst = null;
		
		//검색 종류, 검색어, 카테고리 입력받음
		String q_category = request.getParameter("q_category");
		SORT = request.getParameter("SORT");
		searchValue = request.getParameter("searchValue");
		qst = request.getParameter("qst");		

		//QNA들의 리스트가 필요하므로 ArrayList형의 'list' 생성
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		if(searchValue == null || searchValue.trim() == "") {
			if(qst == null) {
				if(SORT == null) {
					list = qnaService.qnaList(qna);
				} else {
					list = qnaService.searchQna(qna, searchValue, SORT, qst);
				}
			} else {
				list = qnaService.searchQna(qna, searchValue, SORT, qst);
			}
		//검색값이 있는 경우
		} else {
			list = qnaService.searchQna(qna, searchValue, SORT, qst);
		}
		
		//model로 위에서 정의한 값 전송
		model.addAttribute("q_category",q_category);
		model.addAttribute("SORT", SORT);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("qst", qst);
		model.addAttribute("qnaList", list);
		
		//tiles.xml의 definition name="qnaList"로 이동
		return "qnaList";
	}
	
	
	@RequestMapping(value="/myQnaList.do")
	public String myQnaList() throws Exception{
		
		return "";
	}

}
