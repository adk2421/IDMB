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
import idmb.util.Paging;

@Controller
public class AdminReviewController {

	@Resource(name="adminReviewService")
	private AdminReviewService adminReviewService;
	
	@Resource(name="adminProductService")
	private AdminProductService adminProductService;
	
	
	@RequestMapping(value="/adminReviewList")
	public String adminReviewList(HttpServletRequest request, Model model)throws Exception{
		
		/* 페이징을 위한 변수 */
		int pageSize = 5; // 페이지당 출력할 회원의 수
		int START = 1;
		int END = pageSize;
		int currentPage = 1; // 현재 페이지
		
		int totalCount; // 전체 회원의 수
		int pageBlock = 5; // 표시할 페이지의 수
		String url = "adminReviewList.do";
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
				totalCount = adminReviewService.adminSearchReviewCount(SORT, searchValue);
			} else {
				totalCount = adminReviewService.adminSearchReviewCount(SORT, searchValue);
			}
		} else {
			if(searchValue != null) {
				totalCount = adminReviewService.adminSearchReviewCount(SORT, searchValue);
			} else {
				totalCount = adminReviewService.adminReviewCount();
			}
		}
		
		//페이징
		Paging paging = new Paging(totalCount, pageBlock, pageSize, currentPage, url, searchUrl);
		
		//Review들의 리스트가 필요하므로 ArrayList형의 'list' 생성
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		//검색 조건이 있는 경우
		if(SORT != null) {
			if(searchValue != null) {
				list = adminReviewService.adminSearchReview(SORT, searchValue, START, END);
			} else {
				list = adminReviewService.adminSearchReview(SORT, searchValue, START, END);				
			}
		} else {
			if(searchValue != null) {
				list = adminReviewService.adminSearchReview(SORT, searchValue, START, END);
			} else { //검색 조건이 없는 경우
				list = adminReviewService.adminReviewList(START, END);
			}
		}
		
		//model로 위에서 정의한 값 전송
		model.addAttribute("SORT", SORT);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("adminReviewList", list);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("paging",paging);
		
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
