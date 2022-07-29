package idmb.admin.board.review;

import java.util.List;
import java.util.Map;

import idmb.model.ReviewBean;

public interface AdminReviewService {
	
	public List<Map<String, Object>> adminReviewList(int START, int END) throws Exception;
	
	public List<Map<String, Object>> adminSearchReview(
			String SORT, String searchValue, int START, int END) throws Exception;
	
	public Map<String, Object> adminReviewDetail(ReviewBean review) throws Exception;
	
	public void adminInsertReview(ReviewBean review) throws Exception;
	
	public void adminDeleteReview(ReviewBean review) throws Exception;
	
	public int adminReviewCount() throws Exception;
	
	public int adminSearchReviewCount(String SORT, String searchValue) throws Exception;

}
