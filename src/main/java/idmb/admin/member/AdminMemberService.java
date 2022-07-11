package idmb.admin.member;
import java.util.Date;
import java.util.List;
import java.util.Map;

import idmb.model.MemberBean;

public interface AdminMemberService {
	
	public List<Map<String, Object>> adminMemberList() throws Exception;
	
	public Map<String, Object> adminMemberDetail(MemberBean member) throws Exception;
	
	public List<Map<String, Object>> adminSearchMember(String searchValue, Date searchDate1, Date searchDate2) throws Exception;
	
	public void adminUpdateMember(MemberBean member) throws Exception;
	
}
