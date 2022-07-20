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
        map.put("passwd", member.getPasswd());

        return memberDAO.checkId(map);
    }

    @Override
    public Map<String, Object> checkPw(MemberBean member) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("id", member.getId());

        return memberDAO.checkPw(map);
    }
    
    @Override
    public Map<String, Object> selectMember(MemberBean member) throws Exception {
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("id", member.getId());
    	map.put("passwd", member.getPasswd());
    	map.put("name", member.getName());
        map.put("phone", member.getPhone());
        map.put("birth", member.getBirth());
        map.put("email", member.getEmail());
        map.put("postcode", member.getPostcode());
        map.put("address1", member.getAddress1());
        map.put("address2", member.getAddress2());
        map.put("reserve", member.getReserve());
        map.put("joindate", member.getJoindate());
        map.put("delflag", member.getDelflag());
        
        return memberDAO.selectMember(map);
    }

    @Override
    public Map<String, Object> findId(MemberBean member) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("name", member.getName());
        map.put("phone", member.getPhone());

        return memberDAO.findId(map);
    }

    @Override
    public Map<String, Object> findPw(MemberBean member) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("id", member.getId());
        map.put("name", member.getName());
        map.put("phone", member.getPhone());

        return memberDAO.findPw(map);
    }

    @Override
    public Map<String, Object> searchPhone(MemberBean member) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("phone", member.getPhone());

        return memberDAO.searchPhone(map);
    }
}
