package idmb.common.member;

import java.util.Map;

import idmb.model.MemberBean;

public interface JoinService {

    public Map<String, Object> confirmId(MemberBean member) throws Exception;

    public Map<String, Object> checkPw(MemberBean member) throws Exception;

    public void insertMember(MemberBean member) throws Exception;

}
