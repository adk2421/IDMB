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
	
	public List<Map<String, Object>> adminMemberList() throws Exception{
		return sqlSessionTemplate.selectList("admin.adminMemberList");
	}
	
	public Map<String, Object> adminMemberDetail(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectOne("admin.adminMemberDetail", map);
	}
	
	public List<Map<String, Object>> adminSearchMember(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectList("admin.adminSearchMember", map);
		
	}
	
	public void adminUpdateMember(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.update("admin.adminUpdateMember", map);
	}
}
