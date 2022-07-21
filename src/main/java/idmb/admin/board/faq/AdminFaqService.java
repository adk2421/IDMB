package idmb.admin.board.faq;

import java.util.List;
import java.util.Map;

import idmb.model.FAQBean;

public interface AdminFaqService {
	
	public List<Map<String, Object>> adminFaqList(FAQBean faq) throws Exception;
	
	public Map<String, Object> adminFaqDetail(FAQBean faq) throws Exception;
	
	public void adminInsertFaq(FAQBean faq) throws Exception;
	
	public void adminUpdateFaq(FAQBean faq) throws Exception;
	
	public void adminDeleteFaq(FAQBean faq) throws Exception;
}
