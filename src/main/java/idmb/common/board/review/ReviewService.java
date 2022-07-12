package idmb.common.board.review;

import java.util.List;
import java.util.Map;

import idmb.model.ReviewBean;

public interface ReviewService {
	
	public List<Map<String, Object>> myReviewList (ReviewBean review) throws Exception;
	
	public List<Map<String, Object>> productReview (ReviewBean review) throws Exception;
	
	public void insertReview(ReviewBean review) throws Exception;

}
