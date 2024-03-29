package idmb.common.board.review;

import java.util.List;
import java.util.Map;

import idmb.model.ReviewBean;

public interface ReviewService {
	
	public List<Map<String, Object>> myReviewList (ReviewBean review, int START, int END) throws Exception;
	
	public List<Map<String, Object>> answerReviewList (ReviewBean review) throws Exception;
	
	public List<Map<String, Object>> productReview (ReviewBean review) throws Exception;
	
	public void insertReview(ReviewBean review) throws Exception;

	public List<Map<String, Object>> bestReviewList() throws Exception;
	
	public List<Map<String, Object>> newReviewList() throws Exception;
	
	public List<Map<String, Object>> reviewDetail (ReviewBean review) throws Exception;
	
	public void recommendUp(ReviewBean review) throws Exception;
}
