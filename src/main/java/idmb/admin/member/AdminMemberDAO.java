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

    // 아이디 확인
	public Map<String, Object> confirmId(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("member.confirmId", map);
	}

    // 회원 정보 변경
	public void updateMember(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.update("member.updateMember",map);
	}
	
	// 회원 삭제
	public void dropMember(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.update("member.dropMember",map);
	}
}
