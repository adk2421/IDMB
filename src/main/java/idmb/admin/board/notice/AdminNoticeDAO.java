package idmb.admin.board.notice;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("adminNoticeDAO")
public class AdminNoticeDAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> adminNoticeList(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectList("admin.adminNoticeList", map);
	}
	
	public Map<String, Object> adminNoticeCount() throws Exception{
		return sqlSessionTemplate.selectOne("admin.adminNoticeCount");
	}
	
	public Map<String, Object> adminNoticeDetail(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectOne("admin.adminNoticeDetail", map);
	}
	
	public void adminInsertNotice(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.insert("admin.adminInsertNotice", map);
	}
	
	public void adminUpdateNotice(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.update("admin.adminUpdateNotice", map);
	}
	
	public void adminDeleteNotice(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.delete("admin.adminDeleteNotice", map);
	}
	
	public void adminNoticeHit(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.update("admin.adminNoticeHit", map);
	}

}
