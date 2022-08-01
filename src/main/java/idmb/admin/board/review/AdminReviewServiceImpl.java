package idmb.admin.board.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import idmb.model.ReviewBean;

@Service("adminReviewService")
public class AdminReviewServiceImpl implements AdminReviewService{
	
	@Resource(name="adminReviewDAO")
	private AdminReviewDAO adminReviewDAO;
		
	// 후기 리스트
	@Override
	public List<Map<String, Object>> adminReviewList(int START, int END) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("START", START);
		map.put("END", END);
		
		return adminReviewDAO.adminReviewList(map);	
	}
	
	// 후기 검색
	@Override
	public List<Map<String, Object>> adminSearchReview(
			String SORT, String searchValue, int START, int END) throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("SORT", SORT);
		map.put("searchValue", searchValue);
		map.put("START", START);
		map.put("END", END);
		
		return adminReviewDAO.adminSearchReview(map);
	}
	
	// 후기 상세 정보
	@Override
	public Map<String, Object> adminReviewDetail(ReviewBean review) throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("r_num", review.getR_num());
		
		return adminReviewDAO.adminReviewDetail(map);	
	}
	
	// 후기 답변 작성 
	@Override
	public void adminInsertReview(ReviewBean review) throws Exception{
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("r_code", review.getR_code());
		map.put("r_name", review.getR_name());
		map.put("r_contents", review.getR_contents());
		map.put("r_groupnum", review.getR_groupnum());
		
		adminReviewDAO.adminInsertReview(map);		
	}
		
	// 후기 삭제 (처리)
	@Override
	public void adminDeleteReview(ReviewBean review) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("r_num", review.getR_num());
		
		adminReviewDAO.adminDeleteReview(map);	
	}
	
	// 후기 수
	@Override
	public int adminReviewCount() throws Exception{
		Map<String,Object> map = adminReviewDAO.adminReviewCount();
		
		return Integer.parseInt(String.valueOf(map.get("COUNT")));
	}
	
	@Override
	public int adminSearchReviewCount(String SORT, String searchValue) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("SORT", SORT);
		map.put("searchValue", searchValue);
		
		Map<String, Object> countMap = adminReviewDAO.adminSearchReviewCount(map);
		int count = Integer.parseInt(String.valueOf(countMap.get("COUNT")));
		return count;		
	}
}