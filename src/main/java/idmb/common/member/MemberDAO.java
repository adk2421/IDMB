package idmb.common.member;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAO {

    @Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 아이디 확인
	public Map<String, Object> checkId(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("member.confirmId", map);
	}

    // 패스워드 확인
	public Map<String, Object> checkPw(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("member.checkPw", map);
	}
	
	// 회원 등록
	public void insertMember(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.insert("member.insertMember",map);
	}
	
	// 아이디 찾기
	public Map<String, Object> searchId(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("member.searchId", map);
	}
	
	// 패스워드 찾기
	public Map<String, Object> searchPw(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("member.searchPw", map);
	}

	// 패스워드 찾기
	public Map<String, Object> searchPhone(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("member.searchPhone", map);
	}

	// 회원 정보 변경
	public void updateMember(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.update("member.updateMember",map);
	}

	// 회원 탈퇴
	public void dropMember(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.update("member.dropMember",map);
	}
	
}