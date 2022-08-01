package idmb.common.board.review;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import idmb.common.product.ProductService;
import idmb.model.ReviewBean;

@Controller
public class Reviewcontroller {

	@Resource(name="reviewService")
	private ReviewService reviewService;
	
	@Resource(name="productService")
	private ProductService productService;
	
	@RequestMapping(value="/reviewList.do")
	public String reviewList(Model model)throws Exception{
		
		List<Map<String, Object>> brlist = new ArrayList<Map<String, Object>>();
		brlist = reviewService.bestReviewList();
		
		List<Map<String, Object>> nrlist = new ArrayList<Map<String, Object>>();
		nrlist = reviewService.newReviewList();

		model.addAttribute("bestReviewList",brlist);
		model.addAttribute("newReviewList",nrlist);
				
		return "reviewList";
	}
	
	@RequestMapping(value="/insertReview.do")
	public String insertReview(ReviewBean review, HttpServletRequest request, Model model) throws Exception{
		
		//textarea 형식으로 상세정보를 입력받았기 때문에 enter를 문자 처리 해주어야함.
		String r_contents = request.getParameter("r_contents");
		r_contents = r_contents.replace("\r\n","<br>");
		
		review.setR_contents(r_contents);
		
		reviewService.insertReview(review);
		
		//이전페이지로 돌아가기
		String old_url = request.getHeader("REFERER");
		
		model.addAttribute("msg", "리뷰가 작성되었습니다.");
		model.addAttribute("url", old_url);
		
		return "board/review/insertReview";
	}
}
