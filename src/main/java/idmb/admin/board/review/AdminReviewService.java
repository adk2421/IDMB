package idmb.admin.board.review;

import java.util.Date;
import java.util.List;
import java.util.Map;

import idmb.model.ReviewBean;

public interface AdminReviewService {
	
	public List<Map<String, Object>> adminReviewList() throws Exception;
	
	public List<Map<String, Object>> adminSearchReview(Date searchDate1, Date searchDate2) throws Exception;
	
	public void adminInsertReview(ReviewBean review) throws Exception;
	
	public void adminDeleteReview(ReviewBean review) throws Exception;

}
