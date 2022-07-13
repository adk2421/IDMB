package idmb.common.member;

import java.util.Map;

import idmb.model.MemberBean;

public interface JoinService {

    public Map<String, Object> checkId(MemberBean member) throws Exception;

    public void insertMember(MemberBean member) throws Exception;

}
