package idmb.common.member;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import idmb.model.MemberBean;

@Controller
public class MemberController {

    @Resource(name = "joinService")
	private JoinService joinService;

	@Resource(name = "loginService")
	private LoginService loginService;

	@Resource(name = "myInfoService")
	private MyInfoService myInfoService;

	@RequestMapping(value = "/joinForm.al")
	public String joinForm(Model model) {

		return "joinFormAjax";
	}

	@RequestMapping(value = "/confirmIdAjax.al")
	@ResponseBody
	public Map<String, String> confirmIdAjax(MemberBean member, @RequestBody String message) throws Exception {
		Map<String, String> msg = new HashMap<String, String>();
		
		System.out.println("ID : " + member.getId());
		
		/*공백을 입력 받았을 경우*/ 
		if (member.getId().trim().equals("")) {
			msg.put("message", "아이디를 입력해주세요");
			return msg;
		} 

		/* 관리자 아이디를 입력 받았을 경우 */
		 if(member.getId().trim().equals("ADMIN")) {
			 msg.put("message", "이 아이디는 사용할 수 없습니다.");
			
			 return msg; 
		 }
		
		 Map<String, Object> map = new HashMap<String, Object>();
		map = joinService.checkId(member);		
		
		if(map != null) { 
			// 중복된 아이디 있음 
			msg.put("message", "이미 가입된 아이디입니다.");
		
		} else {
			//중복된 아이디 없음
			msg.put("message", "사용할 수 있는 아이디입니다.");
		}
		
		return msg;
	
	}
	
	@RequestMapping(value = "/confirmId.al")
	public String confirmId(MemberBean member, Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		/*공백을 입력 받았을 경우*/ 
		if (member.getId().trim().equals("")) {
			model.addAttribute("msg", "아이디를 입력해주세요");
			model.addAttribute("url","/joinForm.al");
			return "/member/confirmId";
		}
		 
		
		
		 /* 관리자 아이디를 입력 받았을 경우 */
		 if(member.getId().trim().equals("ADMIN")) {
			 model.addAttribute("msg", "이 아이디는 사용할 수 없습니다.");
			 model.addAttribute("url", "/joinForm.al");
			 return "/member/confirmId"; 
		 }
		

		map = joinService.checkId(member);

		if(map != null) { // 중복된 아이디 있음 
			model.addAttribute("msg", "이미 가입된 아이디입니다.");
			model.addAttribute("url", "/joinForm.al"); } else { //중복된 아이디 없음
			model.addAttribute("msg", "사용할 수 있는 아이디입니다."); model.addAttribute("url","/joinForm.al"); }

		return "/member/confirmId";
	}

	
}
