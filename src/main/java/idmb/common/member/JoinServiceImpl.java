package idmb.common.member;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import idmb.model.MemberBean;

@Service("joinService")
public class JoinServiceImpl implements JoinService {
    
    @Resource(name = "memberDAO")
    private MemberDAO memberDAO;

    @Override
    public Map<String, Object> checkId(MemberBean member) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("id", member.getId());

        return memberDAO.confirmId(map);
    }

    @Override
    public void insertMember(MemberBean member) throws Exception {
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

        memberDAO.insertMember(map);
    }

}