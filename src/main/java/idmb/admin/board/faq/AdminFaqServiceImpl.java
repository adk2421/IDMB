package idmb.admin.board.faq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import idmb.model.FAQBean;

@Service("adminFaqService")
public class AdminFaqServiceImpl implements AdminFaqService{
	
	@Resource(name="adminFaqDAO")
	private AdminFaqDAO adminFaqDAO;
	
	@Override
	//FAQ 리스트. 카테고리별
	public List<Map<String, Object>> adminFaqList(FAQBean faq) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("f_category", faq.getF_category());
		
		return adminFaqDAO.adminFaqList(map);
	}
	
	@Override
	//-- FAQ 작성 --
	public void adminInsertFaq(FAQBean faq) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("f_category",faq.getF_category());
		map.put("f_title", faq.getF_title());
		map.put("f_contents", faq.getF_contents());
		
		adminFaqDAO.adminInsertFaq(map);
	}
	
	@Override
	//-- FAQ 수정 --
	public void adminUpdateFaq(FAQBean faq) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("f_category",faq.getF_category());
		map.put("f_title", faq.getF_title());
		map.put("f_contents", faq.getF_contents());
		
		adminFaqDAO.adminUpdateFaq(map);
	}
}
