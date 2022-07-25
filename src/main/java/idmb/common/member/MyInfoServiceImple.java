package idmb.common.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import idmb.common.order.OrderDAO;
import idmb.model.MemberBean;
import idmb.model.OrderBean;

@Service("myInfoService")
public class MyInfoServiceImple implements MyInfoService {

    @Resource(name = "memberDAO")
    private MemberDAO memberDAO;
    
    @Resource(name = "orderDAO")
    private OrderDAO orderDAO;

    @Override
    public Map<String, Object> checkPw(MemberBean member) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", member.getId());
		
		return memberDAO.checkPw(map);
    }
    
    @Override
    public void updateMember(MemberBean member) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("passwd", member.getPasswd());
        map.put("phone", member.getPhone());
        map.put("email", member.getEmail());
        map.put("postcode", member.getPostcode());
        map.put("address1", member.getAddress1());
        map.put("address2", member.getAddress2());
        
        map.put("id", member.getId());

        memberDAO.updateMember(map);
    }

    @Override
    public void deleteMember(MemberBean member) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", member.getId());
		
		memberDAO.deleteMember(map);
    }

	@Override
	public Map<String, Object> selectMember(MemberBean member) throws Exception {
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("id", member.getId());
		
		return memberDAO.selectMember(map);
	}
    
}