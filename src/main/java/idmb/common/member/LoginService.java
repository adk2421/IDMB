package idmb.common.member;

import java.util.Map;

import idmb.model.MemberBean;

public interface LoginService {

    public Map<String, Object> confirmId(MemberBean member) throws Exception;

    public Map<String, Object> checkPw(MemberBean member) throws Exception;

    public Map<String, Object> searchId(MemberBean member) throws Exception;

    public Map<String, Object> searchPw(MemberBean member) throws Exception;

}
