package idmb.common.board.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import idmb.model.QNABean;

@Service("qnaService")
public class QNAServiceImpl implements QNAService {
	
	@Resource(name="qnaDAO")
	private QNADAO qnaDAO;
	
	@Override
	public void insertQna(QNABean QNA) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("q_id", QNA.getQ_id());
		map.put("q_code", QNA.getQ_code());
		map.put("q_category", QNA.getQ_category());
		map.put("q_title", QNA.getQ_title());
		map.put("q_contents", QNA.getQ_contents());
		map.put("q_product", QNA.getQ_product());
		map.put("q_contentspw", QNA.getQ_contentspw());
		
		qnaDAO.insertQna(map);
	}
	
	@Override
	public List<Map<String, Object>> qnaList(QNABean QNA, int START, int END) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("q_category", QNA.getQ_category());
		map.put("START", START);
		map.put("END", END);
		
		return qnaDAO.qnaList(map);
	}
	
	@Override
	public List<Map<String, Object>> searchQna(QNABean qna,
			String searchValue, String SORT, String qst, int START, int END) throws Exception
	{
		Map<String, Object> map = new HashMap<String,Object>();
		
		map.put("q_category",qna.getQ_category());
		map.put("searchValue", searchValue);
		map.put("SORT", SORT);
		map.put("qst", qst);
		map.put("START", START);
		map.put("END", END);
		
		return qnaDAO.searchQna(map);
	}
	
	@Override
	public Map<String, Object> qnaDetail(QNABean QNA) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("q_num", QNA.getQ_num());
		
		return qnaDAO.qnaDetail(map);
		
	}
	
	@Override
	public void updateQna(QNABean QNA) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("q_contents", QNA.getQ_contents());
		map.put("q_num", QNA.getQ_num());
		
		qnaDAO.updateQna(map);
		
		
	}
	
	@Override
	public void deleteQna(QNABean QNA) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("q_num", QNA.getQ_num());
		
		qnaDAO.deleteQna(map);
		
	}
	
	@Override
	public List<Map<String, Object>> myQnaList(QNABean QNA) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("q_id", QNA.getQ_id());
		
		return qnaDAO.myQnaList(map);
		
	}
	
	@Override
	public Map<String, Object> qnaRe(QNABean QNA) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("q_num", QNA.getQ_num());
		
		return qnaDAO.qnaRe(map);
	}
	
	@Override
	public int qnaCount(QNABean qna) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("q_category",qna.getQ_category());
		
		Map<String, Object> countMap = qnaDAO.qnaCount(map);
		int count = Integer.parseInt(String.valueOf(countMap.get("COUNT")));
		return count;
	}
	
	@Override
	public int searchQnaCount(QNABean qna, String searchValue, String SORT, String qst) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("q_category",qna.getQ_category());
		map.put("searchValue", searchValue);
		map.put("SORT", SORT);
		map.put("qst", qst);
		
		Map<String, Object> countMap = qnaDAO.searchQnaCount(map);
		int count = Integer.parseInt(String.valueOf(countMap.get("COUNT")));
		return count;	
	}	

}
