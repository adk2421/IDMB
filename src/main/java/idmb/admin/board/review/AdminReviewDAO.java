package idmb.admin.board.review;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("adminReviewDAO")
public class AdminReviewDAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> adminReviewList(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectList("admin.adminReviewList", map);
	}
	
	public List<Map<String, Object>> adminSearchReview(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectList("admin.adminSearchReview", map);
	}
	
	public Map<String, Object> adminReviewDetail(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectOne("admin.adminReviewDetail", map);
	}
	
	public void adminInsertReview(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.insert("admin.adminInsertReview", map);
	}
	
	public void adminDeleteReview(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.delete("admin.adminDeleteReview", map);
	}
	
	public Map<String, Object> adminReviewCount() throws Exception{
		return sqlSessionTemplate.selectOne("admin.adminReviewCount");
	}

	public Map<String, Object> adminSearchReviewCount(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectOne("admin.adminSearchReviewCount",map);
	}
}
