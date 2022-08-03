package idmb.common.board.review;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("reviewDAO")
public class ReviewDAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> myReviewList (Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectList("review.myReviewList", map);
	}
	
	public List<Map<String, Object>> productReview (Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectList("review.productReview", map);
	}
	
	public void insertReview(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.insert("review.insertReview", map);
	}
	
	public List<Map<String, Object>> bestReviewList () throws Exception{
		return sqlSessionTemplate.selectList("bestReviewList");
	}
	
	public List<Map<String, Object>> newReviewList () throws Exception{
		return sqlSessionTemplate.selectList("newReviewList");
	}
	
	public List<Map<String, Object>> reviewDetail (Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectList("reviewDetail", map);
	}
	
	public void recommendUp(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.update("review.recommendUp", map);
	}
}
