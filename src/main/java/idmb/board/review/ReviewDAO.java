package idmb.board.review;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("ReviewDAO")
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
	
}
