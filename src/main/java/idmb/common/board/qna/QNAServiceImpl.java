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
	
	public List<Map<String, Object>> qnaList() throws Exception{
		return qnaDAO.qnaList();
		
	}
	
	public Map<String, Object> qnaDetail(QNABean QNA) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("q_num", QNA.getQ_num());
		
		return qnaDAO.qnaDetail(map);
		
	}
	
	public void updateQna(QNABean QNA) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("q_category", QNA.getQ_category());
		map.put("q_contents", QNA.getQ_contents());
		map.put("q_num", QNA.getQ_num());
		
		qnaDAO.updateQna(map);
		
		
	}
	
	public void deleteQna(QNABean QNA) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("q_num", QNA.getQ_num());
		
		qnaDAO.deleteQna(map);
		
	}
	
	public List<Map<String, Object>> myQnaList(QNABean QNA) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("q_id", QNA.getQ_id());
		
		return qnaDAO.myQnaList(map);
		
	}

}
