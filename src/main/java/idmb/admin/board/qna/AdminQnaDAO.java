package idmb.admin.board.qna;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("adminQnaDAO")
public class AdminQnaDAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> adminQnaList(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectList("admin.adminQnaList", map);
	}
	
	public List<Map<String, Object>> adminSearchQna(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectList("admin.adminSearchQna", map);
	}
	
	public Map<String, Object> adminQnaDetail(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectOne("admin.adminQnaDetail", map);
	}
	
	public Map<String, Object> adminQnaRe(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectOne("admin.adminQnaRe", map);
	}
	
	public void adminInsertQna(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.insert("admin.adminInsertQna", map);
	}
	
	public void adminUpdateQna(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.update("admin.adminUpdateQna", map);
	}
	
	public void adminDeleteQna(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.delete("admin.adminDeleteQna", map);
	}
	
	public Map<String, Object> adminQnaCount(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectOne("admin.adminQnaCount", map);
	}
	
	public Map<String, Object> adminSearchQnaCount(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectOne("admin.adminSearchQnaCount", map);
	}
	
}
