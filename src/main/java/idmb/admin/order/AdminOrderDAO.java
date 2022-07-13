package idmb.admin.order;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("adminOrderDAO")
public class AdminOrderDAO {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> adminOrderList() throws Exception{
		return sqlSessionTemplate.selectList("admin.adminOrderList");
	}
	
	public List<Map<String, Object>> adminSearchOrder(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectList("admin.adminSearchOrder", map);
	}
	
	public Map<String, Object> adminOrderDetail(Map<String, Object> map) throws Exception{
		return sqlSessionTemplate.selectOne("admin.adminOrderDetail", map);
	}
	
	public void adminUpdateOrder(Map<String, Object> map) throws Exception{
		sqlSessionTemplate.selectList("admin.adminUpdateOrder", map);
	}

}
