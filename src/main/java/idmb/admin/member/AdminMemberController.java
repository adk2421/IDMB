package idmb.admin.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import idmb.model.MemberBean;
import idmb.util.MapToBean;

@Controller
public class AdminMemberController {
	
	//Resource 모음
	@Resource(name="AdminMemberService")
	private AdminMemberService adminMemberService;
	
	
	//RequestMapping 모음
	@RequestMapping(value="/adminMemberList.do")
	public String adminMemberList(
			MemberBean member, HttpServletRequest request, Model model) throws Exception {
		
		//검색 조건을 위한 값
		String SORT = null;
		SORT = request.getParameter("SORT");
		
		//검색어를 위한 값
		String searchValue = null;
		searchValue = request.getParameter("searchValue");
		
		List<Map<String, Object>> list = adminMemberService.adminMemberList();
		
		List<MemberBean> adminMemberBeanList = new ArrayList<MemberBean>();
		for(Map<String, Object> mapObject : list) {
			adminMemberBeanList.add(MapToBean.mapToMember(mapObject));	
		}
		
		model.addAttribute("adminMemberBeanList", adminMemberBeanList);
		
		//select 태그에서 검색 조건을 위한 값
		model.addAttribute("SORT", SORT);
		
		//input 태그에서 검색어를 위한 값
		model.addAttribute("searchValue", searchValue);
		
		return "adminMemberList";
	}
	
	
	
	
	
	
	

}
