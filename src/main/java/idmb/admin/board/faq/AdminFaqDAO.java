package idmb.admin.board.faq;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("adminFaqDAO")
public class AdminFaqDAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> adminFaqList(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectList("admin.adminFaqList", map);
	}
	
	public void adminInsertFaq(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.insert("admin.adminInsertFaq", map);
	}
	
	public void adminUpdateFaq(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.update("admin.adminUpdateFaq", map);
	}

}
