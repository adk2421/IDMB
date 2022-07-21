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

@Controller
public class AdminQnaController {

	@Resource(name="adminQnaService")
	private AdminQnaService adminQnaService;
	
	@RequestMapping(value="/adminQnaMain.do")
	public String adminQnaMain() throws Exception{
		
		return "admin/board/qna/adminQnaMain";
	}
	
	@RequestMapping(value="/adminQnaList.do")
	public String adminQnaList(
			QNABean qna, HttpServletRequest request, Model model) throws Exception{
		
		//검색 종류, 검색어
		String SORT = null;
		String searchValue = null;
		
		//검색 종류, 검색어, 카테고리 입력받음
		String q_category = request.getParameter("q_category");
		SORT = request.getParameter("SORT");
		searchValue = request.getParameter("searchValue");
		
		//QNA들의 리스트가 필요하므로 ArrayList형의 'list' 생성
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		if(searchValue == null || searchValue.trim() =="") {
			list = adminQnaService.adminQnaList(qna);
		}
		else {
			list = adminQnaService.adminSearchQna(qna, searchValue, SORT);
		}
		
		//model로 위에서 정의한 값 전송
		model.addAttribute("SORT", SORT);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("q_category",q_category);
		model.addAttribute("adminQnaList", list);
		
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
