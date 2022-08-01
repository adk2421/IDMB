package idmb.admin.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import idmb.model.MemberBean;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService{
	
	@Resource (name="adminMemberDAO")
	private AdminMemberDAO adminMemberDAO;
	
	//--사용자 리스트--
	@Override
	public List<Map<String, Object>> adminMemberList(int START, int END) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("START", START);
		map.put("END", END);
		
		return adminMemberDAO.adminMemberList(map);		
	}
	
	//-- 사용자 검색 --
	@Override
	public List<Map<String, Object>> adminSearchMember(
			String searchValue, String SORT, int START, int END) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchValue",searchValue);
		map.put("SORT", SORT);
		map.put("START", START);
		map.put("END", END);
		
		return adminMemberDAO.adminSearchMember(map);		
	}
	
	//-- 사용자 상세정보 --
	@Override
	public Map<String, Object> adminMemberDetail(MemberBean member) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", member.getId());
		
		return adminMemberDAO.adminMemberDetail(map);		
	}
			
	//-- 사용자 정보 수정 --
	@Override
	public void adminUpdateMember(MemberBean member) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", member.getId());
		map.put("delflag", member.getDelflag());
		
		adminMemberDAO.adminUpdateMember(map);
	}
	
	//-- 사용자 수 --
	@Override
	public int adminMemberCount() throws Exception{

		Map<String, Object> map = adminMemberDAO.adminMemberCount();
		
		return Integer.parseInt(String.valueOf(map.get("COUNT")));		
	}
	
	//-- 검색 사용자 수 --
	@Override
	public int adminSearchMemberCount(String searchValue, String SORT) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchValue",searchValue);
		map.put("SORT", SORT);
		
		Map<String, Object> countMap = adminMemberDAO.adminSearchMemberCount(map);
		int count = Integer.parseInt(String.valueOf(countMap.get("COUNT")));
		return count;
	}	
}
