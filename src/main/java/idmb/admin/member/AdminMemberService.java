package idmb.admin.member;

import java.util.Map;

import idmb.model.MemberBean;

public interface AdminMemberService {
	
	public Map<String, Object> selectMember(MemberBean member) throws Exception;

    public Map<String, Object> updateMember(MemberBean member) throws Exception;

    public void dropMember(MemberBean member) throws Exception;
	
}
