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
			HttpServletRequest request, Model model) throws Exception {
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		//List<MemberBean> adminMemberBeanList = new ArrayList<MemberBean>();
		
		list = adminMemberService.adminMemberList();
		//System.out.println(list);
		/*
		 * for(Map<String, Object> mapObject : list) {
		 * adminMemberBeanList.add(MapToBean.mapToMember(mapObject)); }
		 */
		
		model.addAttribute("adminMemberBeanList", list);
		
		return "adminMemberList";
	}
	
	
	
	
	
	
	

}
