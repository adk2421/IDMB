package idmb.admin.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import idmb.model.MemberBean;
import idmb.util.Paging;

@Controller
public class AdminMemberController {
	
	//Resource 모음
	@Resource(name="adminMemberService")
	private AdminMemberService adminMemberService;
	
	
	//RequestMapping 모음
	@RequestMapping(value="/adminMemberList.do")
	public String adminMemberList(
			HttpServletRequest request, Model model) throws Exception {
		
		/* 페이징을 위한 변수 */
		int pageSize = 5; // 페이지당 출력할 회원의 수
		int START = 1;
		int END = pageSize;
		int currentPage = 1; // 현재 페이지
		
		int totalCount; // 전체 회원의 수
		int pageBlock = 5; // 표시할 페이지의 수
		String url = "adminMemberList.do";
		String searchUrl = "";		
		
		//검색 종류, 검색어 입력받음
		String SORT = request.getParameter("SORT");
		String searchValue = request.getParameter("searchValue");
		
		//검색조건이 유무에 따른 searchUrl 설정
		if(SORT != null) {
			if(searchValue != null) {
				searchUrl = "&SORT="+SORT+"&searchValue="+searchValue;
			} else {
				searchUrl = "&SORT="+SORT+"&searchValue=";
			}
		} else {
			if(searchValue != null) {
				searchUrl = "&SORT=&searchValue="+searchValue;
			} else {
				searchUrl = "";
			}
		}
		
		//기본 페이지가 아닌 경우
		if(request.getParameter("page")!=null) {
			currentPage = Integer.parseInt(request.getParameter("page")); //현재 페이지
			START = 1 + pageSize * (currentPage-1); //1,11,21 단위로 상품 출력
			END = pageSize * currentPage;
		}		
		
		//검색 조건 유무에 따른 totalCount 개수 확인
		if(SORT != null) {
			if(searchValue != null) {
				totalCount = adminMemberService.adminSearchMemberCount(searchValue, SORT);
			} else {
				totalCount = adminMemberService.adminSearchMemberCount(searchValue, SORT);
			}
		} else {
			if(searchValue != null) {
				totalCount = adminMemberService.adminSearchMemberCount(searchValue, SORT);
			} else {
				totalCount = adminMemberService.adminMemberCount();
			}
		}
		
		//페이징
		Paging paging = new Paging(totalCount, pageBlock, pageSize, currentPage, url, searchUrl);
		
		//member들의 리스트가 필요하므로 ArrayList형의 'list' 생성
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		//검색 조건이 있는 경우
		if(SORT != null) {
			if(searchValue != null) {
				list = adminMemberService.adminSearchMember(searchValue, SORT, START, END);
			} else {
				list = adminMemberService.adminSearchMember(searchValue, SORT, START, END);				
			}
		} else {
			if(searchValue != null) {
				list = adminMemberService.adminSearchMember(searchValue, SORT, START, END);
			} else { //검색 조건이 없는 경우
				list = adminMemberService.adminMemberList(START, END);
			}
		}
		
		//model로 위에서 정의한 값 전송
		model.addAttribute("SORT", SORT);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("adminMemberList", list);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("paging",paging);
		
		//tiles.xml의 definition name="adminMemberList"로 이동
		return "adminMemberList";
	}
	
	@RequestMapping(value="/adminMemberDetail.do")
	public String adminMemberDetail(
			MemberBean member, Model model) throws Exception{
		
		//특정 member의 map만 필요하므로 HashpMap형태의 'map' 생성		
		Map<String, Object> map = new HashMap<String, Object>();
	    
		//adminMemberList에서 id=? 로 입력받은 id값을 member에 주어 상세정보 검색
	    map = adminMemberService.adminMemberDetail(member);
	      
	    model.addAttribute("adminMemberBean", map);
	    
	    //tiles.xml의 definition name="adminMemberDetail"로 이동
		return "adminMemberDetail";
	}
	
	@RequestMapping(value="/adminUpdateMember.do")
	public String adminUpdateMember(
				MemberBean member, Model model) throws Exception{
		
		//Delflag 체크박스가 빈상태면 null로 입력되어 넘어오기 때문에
		//다시 그대로 "N"을 입력해 주어야 함.
		if(member.getDelflag() == null) {
			member.setDelflag("N");
		}
		//체크된 경우 "Y" 값 입력
		else if(member.getDelflag() == "Y") {
			member.setDelflag("Y");
		}
		
		adminMemberService.adminUpdateMember(member);
		
		model.addAttribute("msg", "회원정보가 수정되었습니다.");
		model.addAttribute("url", "/adminMemberList.do");		
		
		//tiles로 보내지 않고 바로 adminUpdateMember.jsp 실행.
		return "admin/member/adminUpdateMember";
	}

}
