package idmb.common.board.faq;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("faqDAO")
public class FAQDAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> faqList(Map<String,Object> map) throws Exception{
		return sqlSessionTemplate.selectList("faq.faqList", map);
	}

}
