package idmb.common.board.review;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import idmb.common.product.ProductService;

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
}
