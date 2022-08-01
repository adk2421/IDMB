package idmb.common.board.qna;

import java.util.List;
import java.util.Map;

import idmb.model.QNABean;

public interface QNAService {
	
	public void insertQna(QNABean QNA) throws Exception;
	
	public List<Map<String, Object>> qnaList(QNABean qna, int START, int END) throws Exception;
	
	public List<Map<String, Object>> searchQna(QNABean qna,
			String searchValue, String SORT, String qst, int START, int END) throws Exception;
	
	public Map<String, Object> qnaDetail(QNABean QNA) throws Exception;
	
	public void updateQna(QNABean QNA) throws Exception;
	
	public void deleteQna(QNABean QNA) throws Exception;
	
	public List<Map<String, Object>> myQnaList(QNABean QNA) throws Exception;
	
	public Map<String, Object> qnaRe(QNABean QNA) throws Exception;

	public int qnaCount(QNABean qna) throws Exception;
	
	public int searchQnaCount(QNABean qna,
			String searchValue, String SORT, String qst) throws Exception;

}
