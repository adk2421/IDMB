package idmb.board.notice;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("noticeDAO")
public class NoticeDAO {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> noticeList(Map<String,Object> map) throws Exception{
		return sqlSessionTemplate.selectList("notice.noticeList", map);
	}
	
	public Map<String, Object> noticeDetail(Map<String,Object> map) throws Exception{
		return sqlSessionTemplate.selectOne("notice.noticeDetail", map);
	}
	
	public void updateNoticeHit(Map<String,Object> map) throws Exception{
		sqlSessionTemplate.update("notice.updateNoticeHit", map);
	}
	
}
