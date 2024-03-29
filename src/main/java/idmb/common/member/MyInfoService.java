package idmb.common.member;

import java.util.List;
import java.util.Map;

import idmb.model.MemberBean;
import idmb.model.OrderBean;
import idmb.model.ProductBean;

public interface MyInfoService {

    public Map<String, Object> checkPw(MemberBean member) throws Exception;
    
    public Map<String, Object> selectMember(MemberBean member) throws Exception;

    public void updateMember(MemberBean member) throws Exception;

    public void deleteMember(MemberBean member) throws Exception;
    
    public Map<String, Object> memberArticleCount(MemberBean member) throws Exception;

}