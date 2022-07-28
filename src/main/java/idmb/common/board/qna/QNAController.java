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
import idmb.model.MemberBean;
import idmb.model.QNABean;

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
