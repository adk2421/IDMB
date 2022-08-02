package idmb.common.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import idmb.common.board.qna.QNAService;
import idmb.common.board.review.ReviewService;
import idmb.common.order.OrderService;
import idmb.common.product.ProductService;
import idmb.model.MemberBean;
import idmb.model.OrderBean;
import idmb.model.ProductBean;
import idmb.model.QNABean;
import idmb.model.ReviewBean;
import idmb.util.MapToBean;

@Controller
public class MemberController {

    @Resource(name = "joinService")
	private JoinService joinService;

	@Resource(name = "loginService")
	private LoginService loginService;

	@Resource(name = "myInfoService")
	private MyInfoService myInfoService;
	
	@Resource (name="orderService")
    private OrderService orderService;
	
	@Resource(name="qnaService")
	private QNAService qnaService;
	
	@Resource(name="productService")
	private ProductService productService;
	
	@Resource(name="reviewService")
	private ReviewService reviewService;
	
	// 회원가입 폼 이동
	@RequestMapping(value = "/joinForm.do")
	public String joinForm(Model model) {

		return "member/joinForm";
	}

	// 회원가입 아이디 중복확인
	@RequestMapping(value = "/confirmIdAjax.do")
	@ResponseBody
	public Map<String, String> confirmIdAjax(MemberBean member, @RequestBody String message) throws Exception {
		Map<String, String> msg = new HashMap<String, String>();
		
		System.out.println("ID : " + member.getId());
		
		// 공백을 입력 받았을 경우
		if (member.getId().trim().equals("")) {
			msg.put("message", "아이디를 입력해주세요");
			return msg;
		} 

		// 관리자 아이디를 입력 받았을 경우
		if (member.getId().trim().equals("ADMIN")) {
			msg.put("message", "이 아이디는 사용할 수 없습니다.");
			return msg; 
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map = joinService.checkId(member);
		
		
		if (map != null) {
			// 중복된 아이디 있음
			msg.put("message", "이미 가입된 아이디입니다.");
		
		} else {
			// 중복된 아이디 없음
			msg.put("message", "사용할 수 있는 아이디입니다.");
		}
		
		return msg;
	
	}
	
	/*
	@RequestMapping(value = "/confirmId.do")
	public String confirmId(MemberBean member, Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		// 공백을 입력 받았을 경우 
		if (member.getId().trim().equals("")) {
			model.addAttribute("msg", "아이디를 입력해주세요");
			model.addAttribute("url","/joinForm.do");
			return "/member/confirmId";
		}
		 
		// 관리자 아이디를 입력 받았을 경우
		if (member.getId().trim().equals("ADMIN")) {
			model.addAttribute("msg", "이 아이디는 사용할 수 없습니다.");
			model.addAttribute("url", "/joinForm.do");
			return "/member/confirmId"; 
		}

		map = joinService.checkId(member);

		if (map != null) { // 중복된 아이디 있음 
			model.addAttribute("msg", "이미 가입된 아이디입니다.");
			model.addAttribute("url", "/joinForm.do"); } else { //중복된 아이디 없음
			model.addAttribute("msg", "사용할 수 있는 아이디입니다."); model.addAttribute("url","/joinForm.do"); }

		return "/member/confirmId";
	}
	*/

	// 회원가입
	@RequestMapping(value = "/joinSuccess.do")
	public String joinSuccess(MemberBean member, BindingResult result, Model model) throws Exception {

		// new MemberValidator().validate(member, result);
		
		System.out.println("joinSuccess 실행");
		
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
			
			model.addAttribute("msg", "가입 완료 되었습니다.");
			model.addAttribute("url", "/loginForm.do");
		}

		return "joinSuccess";
	}
	
	// 로그인 폼 이동
	@RequestMapping(value = "/loginForm.do")
	public String loginForm(Model model) throws Exception {
		
		return "loginForm";
	}

	// 로그인
	@RequestMapping(value = "/login.do")
	public String login(MemberBean member, HttpSession session, Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		map = loginService.selectMember(member);
			
		if (map == null) {
			// 로그인 실패
			model.addAttribute("msg", "회원을 찾을 수 없습니다.");
			model.addAttribute("url", "/loginForm.do");
			
		} else {
			// 비밀번호 체크
			if (member.getPasswd().equals(map.get("PASSWD"))) {
				// 로그인 성공
				
				// 탈퇴유무 체크
				if (map.get("DELFLAG").equals("Y")) {
					model.addAttribute("msg", "탈퇴한 회원입니다.");
					model.addAttribute("url", "/loginForm.do");
					return "/member/login";
				}

				// 세션 등록
				session.setAttribute("id", map.get("ID"));
				session.setAttribute("name", map.get("NAME"));
				session.setAttribute("reserve", map.get("RESERVE"));
				session.setAttribute("passwd", map.get("PASSWD"));
				session.setAttribute("name", map.get("NAME"));
				session.setAttribute("phone", map.get("PHONE"));
				session.setAttribute("birth", map.get("BIRTH"));
				session.setAttribute("email", map.get("EMAIL"));
				session.setAttribute("postcode", map.get("POSTCODE"));
				session.setAttribute("address1", map.get("ADDRESS1"));
				session.setAttribute("address2", map.get("ADDRESS2"));
				session.setAttribute("reserve", map.get("RESERVE"));
				session.setAttribute("joindate", map.get("JOINDATE"));
				session.setAttribute("delflag", map.get("DELFLAG"));

				// 관리자 체크
				if (map.get("ID").equals("ADMIN")) {
					model.addAttribute("url", "/adminMain.do");
				
				} else {
					model.addAttribute("url", "/myPage.do");
				}
				
			} else {
				// 비밀번호 틀림
				model.addAttribute("msg", "비밀번호가 틀립니다.");
				model.addAttribute("url", "/loginForm.do");
			}
		}
		
		return "/member/login";
	}

	// 로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(HttpServletRequest request, Model model) throws Exception {

		// 세션 무효화
		request.getSession().invalidate();

		model.addAttribute("msg", "로그아웃 하셨습니다.");
		model.addAttribute("url", "/");

		return "/member/logout";
	}

	// 아이디 찾기 이동
	@RequestMapping(value = "/findId.do")
	public String findId(Model model) throws Exception {
		
		return "findId";
	}

	// 아이디 찾기 결과
	@RequestMapping(value = "/findIdResult.do")
	public String findIdResult(MemberBean member, Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map = loginService.findId(member);

		if (map == null) {
			// 조회된 값이 없을 때
			model.addAttribute("Find", "notFound");
			
		} else {
			// 조회 성공 시 ID 값 넘기기
			model.addAttribute("id", map.get("ID"));
		}
		
		return "findIdResult";
	}
	
	// 비밀번호 찾기 이동
	@RequestMapping(value = "/findPw.do")
	public String findPw(Model model) throws Exception {
		
		return "findPw";
	}

	// 비밀번호 찾기 결과
	@RequestMapping(value = "/findPwResult.do")
	public String findPwResult(MemberBean member, Model model) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		map = loginService.findPw(member);

		if (map == null) {
			// 조회된 값이 없을 때
			model.addAttribute("Find", "notFound");
			
		} else {
			// 조회 성공 시 PASSWD 값 넘기기
			model.addAttribute("passwd", map.get("PASSWD"));
		}

		return "findPwResult";
	}

	// 마이페이지 이동
	//@RequestMapping(value = "/myPage.do")
	//public String myPage(Model model) throws Exception {
		
	//	return "/member/myPage";
	//}
	
	// 메인페이지 이동
	@RequestMapping(value = "/main.do")
	public String mainPage(Model model) throws Exception {
		
		return "/main";
	}
	
	// 회원정보 폼
	@RequestMapping(value = "/myInfoModifyForm.do")
	public String myInfoModifyForm(Model model, HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		// 세션에서 사용자 아이디를 가져와서 저장
		String id = (String) request.getSession().getAttribute("id");
		System.out.println("session getUserId : " + (String) request.getSession().getAttribute("id"));
		MemberBean memberBean = new MemberBean();
		memberBean.setId(id);

		// DB에서 읽어와 저장
		map = myInfoService.selectMember(memberBean);
		memberBean = MapToBean.mapToMember(map);

		model.addAttribute("memberBean", memberBean);
		
		return "myInfoModifyForm";
	}

	// 회원정보 수정
	@RequestMapping(value = "/myInfoModify.do")
	public String myInfoModify(MemberBean member, BindingResult result, Model model) throws Exception {

		// new MemberValidator().validate(member, result);

		if (result.hasErrors()) {
			// 회원정보 수정 실패
			return "/myInfoModifyForm.do";
		}

		myInfoService.updateMember(member);
		// 회원정보 수정 성공
		model.addAttribute("msg", "회원정보가 수정되었습니다.");
		model.addAttribute("url", "/myInfoModifyForm.do");
		
		return "/member/myInfoModify";
	}

	// 회원탈퇴
	@RequestMapping(value = "/myInfoDelete.do")
	public String myInfoDelete(MemberBean member, HttpServletRequest request, Model model) throws Exception {
	
		// 세션에서 사용자 아이디를 가져와서 저장
		String LoginId = (String) request.getSession().getAttribute("id");
		MemberBean loginMember = new MemberBean();
		loginMember.setId(LoginId);
		
		// DB에서 읽어와 저장
		Map<String, Object> mapMember = loginService.selectMember(loginMember);
		member = MapToBean.mapToMember(mapMember);
		
		myInfoService.deleteMember(member);
		// 회원탈퇴 성공
		model.addAttribute("msg", "이용해주셔서 감사합니다.");
		model.addAttribute("url","/main.do");

		// 세션 무효화
		request.getSession().invalidate();
		
		return "/member/myInfoDelete";
	}
	
	
	// 마이페이지
	@RequestMapping(value = "/myPage.do")
	public String myInfoOrder(Model model, HttpServletRequest request) throws Exception {

		// 세션 id 값 받아오기
		String id = (String) request.getSession().getAttribute("id");
		OrderBean order = new OrderBean();
		order.setO_id(id);
		
		// 주문 처리 현황
        List<Map<String, Object>> countOrderStatus = orderService.countOrderStatus(order);
        
        for (int i = 0; i < countOrderStatus.size(); i++)
        	model.addAttribute((String) countOrderStatus.get(i).get("O_STATUS"), countOrderStatus.get(i).get("CNT"));
		
		// 주문 상품 정보 List
        List<Map<String, Object>> myOrderList = new ArrayList<Map<String, Object>>();

        myOrderList = orderService.myOrderList(order);

        model.addAttribute("myOrderList", myOrderList);
        
        // 내 QNA List
        QNABean qna = new QNABean();
		qna.setQ_id(id);
		
        List<Map<String, Object>> myQnaList = new ArrayList<Map<String, Object>>();

        myQnaList = qnaService.myQnaList(qna);
        
        model.addAttribute("myQnaList", myQnaList);
        
        // 내 Review List
        ReviewBean review = new ReviewBean();
		review.setR_id(id);
		
        List<Map<String, Object>> myReviewList = new ArrayList<Map<String, Object>>();

        myReviewList = reviewService.myReviewList(review);
        
        for (Map<String, Object> reviewList : myReviewList) {
        	String star = "";
        	
        	int rate = Integer.parseInt(reviewList.get("R_RATE").toString());
        	
        	for (int j=0; j<5; j++) {
        		if (j > rate-1)
        			star += "☆";
        		
        		else
        			star += "★";
        	}
        	
        	reviewList.put("R_RATE", star);
        }
        
        model.addAttribute("myReviewList", myReviewList);
           
		return "myPage";
	}
	
	// 최근 본 상품 Session 등록
	@ResponseBody
	@RequestMapping(method = RequestMethod.POST, value = "/viewedProductAjax.do")
	public String viewedProductAjax(@RequestParam Map<String, Object> Arr, Model model, HttpSession session) throws Exception {
		
		ProductBean product = new ProductBean();
		
		List<Map<String, Object>> viewedProduct = new ArrayList<Map<String, Object>>();
		
		System.out.println("Arr.size : " + Arr.size());
		
		for (int i = 0; i < Arr.size(); i++) {
			product.setP_code(Integer.parseInt((String) Arr.get("P_CODE["+ i + "]")));
			viewedProduct.add(productService.productDetail(product));
		}
		
		session.setAttribute("viewedProduct", viewedProduct);
				
		return "redirect:myPage";
	} 
}
