package idmb.admin.board.qna;

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
	public List<Map<String, Object>> adminQnaList(QNABean qna, int START, int END)throws Exception{
		Map<String, Object> map = new HashMap<String,Object>();
		
		map.put("q_category",qna.getQ_category());
		map.put("START", START);
		map.put("END", END);

		return adminQnaDAO.adminQnaList(map);
	}
	
	@Override
	public List<Map<String, Object>> adminSearchQna(QNABean qna,
			String searchValue, String SORT, String qst, int START, int END) throws Exception
	{
		Map<String, Object> map = new HashMap<String,Object>();
		
		map.put("q_category",qna.getQ_category());
		map.put("searchValue", searchValue);
		map.put("SORT", SORT);
		map.put("qst", qst);
		map.put("START", START);
		map.put("END", END);
		
		return adminQnaDAO.adminSearchQna(map);
	}
	
	@Override
	public Map<String, Object> adminQnaDetail(QNABean qna) throws Exception{
		Map<String, Object>map = new HashMap<String, Object>();
		
		map.put("q_num", qna.getQ_num());
		
		return adminQnaDAO.adminQnaDetail(map);
	}
	
	@Override
	public Map<String, Object> adminQnaRe(QNABean qna) throws Exception{
		Map<String, Object>map = new HashMap<String, Object>();
		
		map.put("q_num", qna.getQ_num());
		
		return adminQnaDAO.adminQnaRe(map);
	}
	
	@Override
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
	
	@Override
	public void adminUpdateQna(QNABean qna) throws Exception{
		Map<String, Object>map = new HashMap<String, Object>();
		
		map.put("q_groupnum", qna.getQ_groupnum());
		
		adminQnaDAO.adminUpdateQna(map);
	}
	
	@Override
	public void adminDeleteQna(QNABean qna) throws Exception{
		Map<String, Object>map = new HashMap<String, Object>();
		
		map.put("q_num", qna.getQ_num());
		
		adminQnaDAO.adminDeleteQna(map);
	}
	
	@Override
	public int adminQnaCount(QNABean qna) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("q_category",qna.getQ_category());
		
		Map<String, Object> countMap = adminQnaDAO.adminQnaCount(map);
		int count = Integer.parseInt(String.valueOf(countMap.get("COUNT")));
		return count;
	}
	
	@Override
	public int adminSearchQnaCount(QNABean qna, String searchValue, String SORT, String qst) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("q_category",qna.getQ_category());
		map.put("searchValue", searchValue);
		map.put("SORT", SORT);
		map.put("qst", qst);
		
		Map<String, Object> countMap = adminQnaDAO.adminSearchQnaCount(map);
		int count = Integer.parseInt(String.valueOf(countMap.get("COUNT")));
		return count;	
	}	
}