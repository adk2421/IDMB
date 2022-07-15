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

@Controller
public class AdminMemberController {
	
	//Resource 모음
	@Resource(name="AdminMemberService")
	private AdminMemberService adminMemberService;
	
	
	//RequestMapping 모음
	@RequestMapping(value="/adminMemberList.do")
	public String adminMemberList(
			HttpServletRequest request, Model model) throws Exception {
		
		//검색 종류, 검색어
		String SORT = null;
		String searchValue = null;
		
		//검색 종류, 검색어 입력받음
		SORT = request.getParameter("SORT");
		searchValue = request.getParameter("searchValue");
		
		//member들의 리스트가 필요하므로 ArrayList형의 'list' 생성
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		//검색어가 없는 경우는 MemberList()
		if(searchValue == null || searchValue.trim() =="") {
			list = adminMemberService.adminMemberList();
		}
		//검색어가 있는 경우는 SearchMember()
		else {
			list = adminMemberService.adminSearchMember(searchValue, SORT);
		}
		
		//model로 위에서 정의한 값 전송
		model.addAttribute("SORT", SORT);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("adminMemberList", list);
		
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
		
		//delflag 체크박스가 빈상태면 null로 입력되어 넘어오기 때문에
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
