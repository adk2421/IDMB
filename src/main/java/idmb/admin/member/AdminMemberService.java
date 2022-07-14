package idmb.admin.member;

import java.util.List;
import java.util.Map;

import idmb.model.MemberBean;

public interface AdminMemberService {
	
	public List<Map<String, Object>> adminMemberList() throws Exception;
	
	public Map<String, Object> adminMemberDetail(MemberBean member) throws Exception;
	
	public List<Map<String, Object>> adminSearchMember(
			String searchValue, String SORT) throws Exception;
	
	public void adminUpdateMember(MemberBean member) throws Exception;
	
}
