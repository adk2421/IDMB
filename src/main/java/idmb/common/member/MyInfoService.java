package idmb.common.member;

import java.util.Map;

import idmb.model.MemberBean;

public interface MyInfoService {

    public Map<String, Object> checkPw(MemberBean member) throws Exception;

    public void updateMember(MemberBean member) throws Exception;

    public void dropMember(MemberBean member) throws Exception;
}
