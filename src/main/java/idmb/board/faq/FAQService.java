package idmb.board.faq;

import java.util.List;
import java.util.Map;

import idmb.model.FAQBean;


public interface FAQService {
	
	public List<Map<String, Object>> faqList(FAQBean FAQ) throws Exception;

}
