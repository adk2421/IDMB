package idmb.admin.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import idmb.model.MemberBean;

@Service("AdminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Resource (name="adminMemberDAO")
	private AdminMemberDAO adminMemberDAO;
	
	//--사용자 리스트--
	@Override
	public List<Map<String, Object>> adminMemberList() throws Exception{
		return adminMemberDAO.adminMemberList();		
	}
	
	//-- 사용자 상세정보 --
	@Override
	public Map<String, Object> adminMemberDetail(MemberBean member) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", member.getId());
		
		return adminMemberDAO.adminMemberDetail(map);		
	}
		
	//-- 사용자 검색 --
	@Override
	public List<Map<String, Object>> adminSearchMember(
			String searchValue, String SORT) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchValue",searchValue);
		map.put("SORT", SORT);
		
		return adminMemberDAO.adminSearchMember(map);		
	}
	
	//-- 사용자 정보 수정 --
	@Override
	public void adminUpdateMember(MemberBean member) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", member.getId());
		map.put("delflag", member.getDelflag());
		
		adminMemberDAO.adminUpdateMember(map);
	}
	
	
}
