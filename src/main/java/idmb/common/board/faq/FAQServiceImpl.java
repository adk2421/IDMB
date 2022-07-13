package idmb.common.board.faq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import idmb.model.FAQBean;

@Service("faqService")
public class FAQServiceImpl implements FAQService {
	
	@Resource(name="faqDAO")
	private FAQDAO faqDAO;
	
	@Override
	public List<Map<String, Object>> faqList(FAQBean FAQ) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("f_category", FAQ.getF_category());
		
		return faqDAO.faqList(map);
	}

}
