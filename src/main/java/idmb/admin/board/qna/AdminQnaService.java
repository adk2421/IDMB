package idmb.admin.board.qna;

import java.util.Date;
import java.util.List;
import java.util.Map;

import idmb.model.QNABean;

public interface AdminQnaService {
	
	public List<Map<String, Object>> adminQnaList() throws Exception;
	
	public List<Map<String, Object>> adminSearchQna(QNABean qna,
			String searchValue, Date searchDate1, Date searchDate2, String SORT) throws Exception;
	
	public Map<String, Object> adminQnaDetail(QNABean qna) throws Exception;
	
	public void adminInsertQna(QNABean qna) throws Exception;
	
	public void adminUpdateQna(QNABean qna) throws Exception;
	
	public void adminDeleteQna(QNABean qna) throws Exception;

}
