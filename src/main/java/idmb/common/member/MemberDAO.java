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
		return sqlSessionTemplate.selectOne("member.checkId", map);
	}

    // 패스워드 확인
	public Map<String, Object> checkPw(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("member.checkPw", map);
	}
	
	// 회원 검색
	public Map<String, Object> selectMember(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("member.selectMember", map);
	}
	
	// 회원 등록
	public void insertMember(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.insert("member.insertMember",map);
	}
	
	// 아이디 찾기
	public Map<String, Object> findId(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("member.findId", map);
	}
	
	// 패스워드 찾기
	public Map<String, Object> findPw(Map<String, Object> map) throws Exception {
		return sqlSessionTemplate.selectOne("member.findPw", map);
	}

	// 회원 정보 변경
	public void updateMember(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.update("member.updateMember",map);
	}

	// 회원 탈퇴
	public void deleteMember(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.update("member.deleteMember",map);
	}
	
	// 회원 작성 게시물 수
	public Map<String, Object> memberArticleCount(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectOne("member.memberArticleCount",map);
	}
	
}