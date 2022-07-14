package idmb.admin.member;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
			HttpServletRequest request, Model model) throws Exception {
		
		//검색 종류, 검색어
		String SORT = null;
		String searchValue = null;
		
		SORT = request.getParameter("SORT");
		searchValue = request.getParameter("searchValue");
		
		//list 생성
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<MemberBean> adminMemberBeanList = new ArrayList<MemberBean>();
		
		//검색어가 없는 경우는 MemberList()
		if(searchValue == null || searchValue.trim() =="") {
			list = adminMemberService.adminMemberList();
		}
		//검색어가 있는 경우는 SearchMember
		else {
			list = adminMemberService.adminSearchMember(searchValue, SORT);
		}

		for(Map<String, Object> mapObject : list) {
		adminMemberBeanList.add(MapToBean.mapToMember(mapObject)); }
		
		model.addAttribute("SORT", SORT);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("adminMemberBeanList", list);
		
		return "adminMemberList";
	}
	
	@RequestMapping(value="/adminMemberDetail.do")
	public String adminMemberDetail(
			MemberBean member, Model model) throws Exception{
				
		Map<String, Object> map = new HashMap<String, Object>();
	    MemberBean adminMemberBean = new MemberBean();
	      
	    map = adminMemberService.adminMemberDetail(member);
	    adminMemberBean = MapToBean.mapToMember(map);
	      
	    model.addAttribute("adminMemberBean", adminMemberBean);
	  
		return "adminMemberDetail";
	}
	
	
	
	
	
	
	

}
