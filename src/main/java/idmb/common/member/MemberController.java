package idmb.common.member;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import idmb.model.MemberBean;
import idmb.util.MapToBean;

@Controller
public class MemberController {

    @Resource(name = "joinService")
	private JoinService joinService;

	@Resource(name = "loginService")
	private LoginService loginService;

	@Resource(name = "myInfoService")
	private MyInfoService myInfoService;
	
	// 회원가입 폼 이동
	@RequestMapping(value = "/joinForm.do")
	public String joinForm(Model model) {

		return "joinFormAjax";
	}

	@RequestMapping(value = "/confirmIdAjax.do")
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
			model.addAttribute("url","/joinForm.do");
			return "/member/confirmId";
		}
		 
		
		
		 /* 관리자 아이디를 입력 받았을 경우 */
		 if(member.getId().trim().equals("ADMIN")) {
			 model.addAttribute("msg", "이 아이디는 사용할 수 없습니다.");
			 model.addAttribute("url", "/joinForm.do");
			 return "/member/confirmId"; 
		 }
		

		map = joinService.checkId(member);

		if(map != null) { // 중복된 아이디 있음 
			model.addAttribute("msg", "이미 가입된 아이디입니다.");
			model.addAttribute("url", "/joinForm.al"); } else { //중복된 아이디 없음
			model.addAttribute("msg", "사용할 수 있는 아이디입니다."); model.addAttribute("url","/joinForm.do"); }

		return "/member/confirmId";
	}

	@RequestMapping(value = "/joinSuccess.do")
	public String joinSuccess(MemberBean member, BindingResult result, Model model) throws Exception {

		// new MemberValidator().validate(member, result);

		if (result.hasErrors()) {
			// 회원가입 실패
			model.addAttribute("msg", "회원가입에 실패했습니다.");
			model.addAttribute("url", "/joinForm.do");
		}

		Map<String, Object> map = joinService.checkId(member);

		if (map != null) {
			// 중복회원 가입시 실패
			model.addAttribute("msg", "이미 가입된 아이디입니다.");
			model.addAttribute("url", "/joinForm.do");

		} else {
			// 회원가입 성공
			joinService.insertMember(member);
			
			model.addAttribute("url", "/loginForm.do");
		}

		return "/member/joinSuccess";
	}
	
	// 로그인 폼 이동
	@RequestMapping(value = "/loginForm.do")
	public String loginForm(Model model) throws Exception {
		return "/member/loginForm";
	}

	@RequestMapping(value = "/login.do")
	public String login(MemberBean member, HttpSession session, Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		MemberBean memberBean = new MemberBean();

		map = loginService.checkId(member);

		if (map == null) {
			// 로그인 실패
			model.addAttribute("msg", "회원을 찾을 수 없습니다.");
			model.addAttribute("url", "/loginForm.do");
		} else {
			memberBean = MapToBean.mapToMember(map); // 검색된 회원

			// 비밀번호 체크
			if (member.getPasswd().equals(memberBean.getPasswd())) {
				// 로그인 성공

				// 정지유무 체크
				if (memberBean.getDelflag().equals("Y")) {
					model.addAttribute("msg", "정지된 회원입니다.");
					model.addAttribute("url", "/loginForm.do");
					return "/member/login";
				}

				// 세션 등록
				session.setAttribute("id", memberBean.getId());

				// 관리자 체크
				if (memberBean.getId().equals("ADMIN")) {
					model.addAttribute("url", "/adminMain.do");
				} else {
					model.addAttribute("url", "/main.do");
				}
			} else {
				// 비밀번호 틀림
				model.addAttribute("msg", "비밀번호가 틀립니다.");
				model.addAttribute("url", "/loginForm.do");
			}
		}
		return "/member/login";
	}

	@RequestMapping(value = "/logout.al")
	public String logout(HttpServletRequest request, Model model) throws Exception {

		request.getSession().invalidate();

		model.addAttribute("msg", "로그아웃 하셨습니다.");
		model.addAttribute("url", "/loginForm.al");

		return "/member/logout";
	}

	@RequestMapping(value = "/findId.do")
	public String findId(Model model) throws Exception {
		return "findId";
	}

	@RequestMapping(value = "/findIdResult.al")
	public String findIdResult(MemberBean member, Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		MemberBean memberBean = new MemberBean();

		map = loginService.searchPhone(member);

		if (map == null) {
			model.addAttribute("Find", "notFound");
		} else {
			memberBean = MapToBean.mapToMember(map);

			if (member.getName().equals(memberBean.getName())) {
				model.addAttribute("memberBean", memberBean);
			} else {
				model.addAttribute("Find", "invalidName");
			}
		}
		return "findIdResult";
	}
}
