package idmb.common.member;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import idmb.model.MemberBean;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

    @Resource(name = "memberDAO")
    private MemberDAO memberDAO;

    @Override
    public Map<String, Object> checkId(MemberBean member) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("id", member.getId());

        return memberDAO.confirmId(map);
    }

    @Override
    public Map<String, Object> checkPw(MemberBean member) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("id", member.getId());

        return memberDAO.confirmId(map);
    }

    @Override
    public Map<String, Object> searchId(MemberBean member) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("name", member.getName());
        map.put("phone", member.getPhone());

        return memberDAO.confirmId(map);
    }

    @Override
    public Map<String, Object> searchPw(MemberBean member) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("id", member.getId());
        map.put("name", member.getName());
        map.put("phone", member.getPhone());

        return memberDAO.confirmId(map);
    }

    
}
