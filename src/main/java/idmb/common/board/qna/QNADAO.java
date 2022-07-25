package idmb.common.board.qna;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("qnaDAO")
public class QNADAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertQna(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.insert("qna.insertQna", map);
	}
	
	public List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectList("qna.qnaList", map);
	}
	
	public List<Map<String, Object>> searchQna(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectList("qna.searchQna", map);
	}
	
	public Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectOne("qna.qnaDetail", map);
	}
	
	public void updateQna(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.update("qna.updateQna", map);
	}
	
	public void deleteQna(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.delete("qna.deleteQna", map);
	}
	
	public List<Map<String, Object>> myQnaList(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectList("qna.myQnaList", map);
	}

}
