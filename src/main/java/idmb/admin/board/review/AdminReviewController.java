package idmb.admin.board.review;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import idmb.admin.product.AdminProductService;
import idmb.model.ProductBean;
import idmb.model.ReviewBean;

@Controller
public class AdminReviewController {

	@Resource(name="adminReviewService")
	private AdminReviewService adminReviewService;
	
	@Resource(name="adminProductService")
	private AdminProductService adminProductService;
	
	
	@RequestMapping(value="/adminReviewList")
	public String adminReviewList(HttpServletRequest request, Model model)throws Exception{
		
		//검색 종류, 검색어
		String SORT = null;
		String searchValue = null;
				
		//검색 종류, 검색어 입력받음
		SORT = request.getParameter("SORT");
		searchValue = request.getParameter("searchValue");
		
		//Review들의 전체 리스트가 필요하므로 ArrayList형의 'list' 생성
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		//검색어가 없는 경우는 ReviewList()
		if(searchValue == null || searchValue.trim() =="") {
			list = adminReviewService.adminReviewList();
		}
		//검색어가 있는 경우는 SearchReview()
		else {
			list = adminReviewService.adminSearchReview(SORT, searchValue);
		}
		
		//model로 위에서 정의한 값 전송
		model.addAttribute("SORT", SORT);
		model.addAttribute("searchValue", searchValue);		
		model.addAttribute("adminReviewList",list);
		
		//tiles.xml의 definition name="adminReviewList"로 이동
		return "adminReviewList";
	}
	
	@RequestMapping(value="/adminReviewDetail.do")
	public String adminReviewDetail(
			ReviewBean review, ProductBean product, Model model)throws Exception{
		
		//특정 Review의 map만 필요하므로 HashpMap형태의 'rmap' 생성		
		Map<String, Object> rmap = new HashMap<String, Object>();
		
		//특정 Review가 달린 Product의 Map이 필요하므로 HashpMap형태의 'pmap' 생성	
		Map<String, Object> pmap = new HashMap<String, Object>();
		
		rmap = adminReviewService.adminReviewDetail(review);
		pmap = adminProductService.adminSearchProductCode(product);
		
		model.addAttribute("adminReviewBean",rmap);
		model.addAttribute("adminReviewProduct",pmap);
		
		//tiles.xml의 definition name="adminReviewDetail"로 이동
		return "adminReviewDetail";
	}
	
	
	
	
	@RequestMapping(value="/adminDeleteReview.do")
	public String adminDeleteReview(ReviewBean review, Model model)throws Exception{
		
		adminReviewService.adminDeleteReview(review);
		
		model.addAttribute("msg", "후기가 삭제되었습니다.");
		model.addAttribute("url", "/adminReviewList.do");		
		
		//tiles로 보내지 않고 바로 adminDeleteReview.jsp 실행.
		return "admin/board/review/adminDeleteReview";
		
	}
	
	
}
