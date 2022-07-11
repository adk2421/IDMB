package idmb.board.qna;

import java.util.List;
import java.util.Map;

import idmb.model.QNABean;

public interface QNAService {
	
	public void insertQna(QNABean QNA) throws Exception;
	
	public List<Map<String, Object>> qnaList() throws Exception;
	
	public Map<String, Object> qnaDetail(QNABean QNA) throws Exception;
	
	public void updateQna(QNABean QNA) throws Exception;
	
	public void deleteQna(QNABean QNA) throws Exception;
	
	public List<Map<String, Object>> myQnaList(QNABean QNA) throws Exception;

}
