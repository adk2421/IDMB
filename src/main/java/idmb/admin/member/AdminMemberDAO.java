package idmb.admin.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("adminMemberDAO")
public class AdminMemberDAO {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> adminMemberList(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectList("admin.adminMemberList", map);
	}
	
	public List<Map<String, Object>> adminSearchMember(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectList("admin.adminSearchMember", map);
	}
	
	public Map<String, Object> adminMemberDetail(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectOne("admin.adminMemberDetail", map);
	}
	
	public void adminUpdateMember(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.update("admin.adminUpdateMember", map);
	}
	
	public Map<String, Object> adminMemberCount() throws Exception{
		return sqlSessionTemplate.selectOne("admin.adminMemberCount");
	}
	
	public Map<String, Object> adminSearchMemberCount(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectOne("admin.adminSearchMemberCount", map);
	}
}
