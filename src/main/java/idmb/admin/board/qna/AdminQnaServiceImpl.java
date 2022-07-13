package idmb.admin.board.qna;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import idmb.model.QNABean;

@Service("adminQnaService")
public class AdminQnaServiceImpl implements AdminQnaService{

	@Resource(name="adminQnaDAO")
	private AdminQnaDAO adminQnaDAO;
	
	//Qna리스트
	@Override
	public List<Map<String, Object>> adminQnaList()throws Exception{
		
		return adminQnaDAO.adminQnaList();
	}
	
	@Override
	public List<Map<String, Object>> adminSearchQna(QNABean qna,
			String searchValue, Date searchDate1, Date searchDate2, String SORT) throws Exception
	{
		Map<String, Object> map = new HashMap<String,Object>();
		
		map.put("q_category",qna.getQ_category());
		map.put("searchValue", searchValue);
		map.put("searchDate1", searchDate1);
		map.put("searchDate2", searchDate2);
		map.put("SORT", SORT);
		
		return adminQnaDAO.adminSearchQna(map);
	}
	
	@Override
	public Map<String, Object> adminQnaDetail(QNABean qna) throws Exception{
		Map<String, Object>map = new HashMap<String, Object>();
		
		map.put("q_num", qna.getQ_num());
		
		return adminQnaDAO.adminQnaDetail(map);
	}
	
	
	public void adminInsertQna(QNABean qna) throws Exception{
		Map<String, Object>map = new HashMap<String, Object>();
		
		map.put("q_code", qna.getQ_code());
		map.put("q_category", qna.getQ_category());
		map.put("q_title", qna.getQ_title());
		map.put("q_contents", qna.getQ_contents());
		map.put("q_product", qna.getQ_product());
		map.put("q_groupnum", qna.getQ_groupnum());
		
		adminQnaDAO.adminInsertQna(map);
	}
	
	public void adminUpdateQna(QNABean qna) throws Exception{
		Map<String, Object>map = new HashMap<String, Object>();
		
		map.put("q_status", qna.getQ_status());
		map.put("q_num", qna.getQ_num());
		
		adminQnaDAO.adminUpdateQna(map);
	}
	
	public void adminDeleteQna(QNABean qna) throws Exception{
		Map<String, Object>map = new HashMap<String, Object>();
		
		map.put("q_num", qna.getQ_num());
		
		adminQnaDAO.adminDeleteQna(map);
	}
}