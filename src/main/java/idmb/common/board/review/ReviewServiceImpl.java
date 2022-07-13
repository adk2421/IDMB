package idmb.common.board.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import idmb.model.ReviewBean;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

    @Resource(name = "reviewDAO")
    private ReviewDAO reviewDAO;
    
    @Override
    public List<Map<String, Object>> myReviewList(ReviewBean review) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("r_id", review.getR_id());

        return reviewDAO.myReviewList(map);
    }
	
    @Override
	public List<Map<String, Object>> productReview(ReviewBean review) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("r_code", review.getR_code());

        return reviewDAO.productReview(map);
    }
	
    @Override
	public void insertReview(ReviewBean review) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("r_id", review.getR_id());
		map.put("r_code", review.getR_code());
		map.put("r_name", review.getR_name());
		map.put("r_contents", review.getR_contents());
		map.put("r_rate", review.getR_rate());

		reviewDAO.insertReview(map);
    }

}
