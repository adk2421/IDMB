package idmb.common.board.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import idmb.model.NoticeBean;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	
	@Resource(name="noticeDAO")
	private NoticeDAO noticeDAO;
	
	@Override
	public List<Map<String, Object>> noticeList() throws Exception{
		return noticeDAO.noticeList();
		
	}
	
	@Override
	public Map<String, Object> noticeDetail(NoticeBean notice) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("n_num",notice.getN_num());
		
		return noticeDAO.noticeDetail(map);
	}
	
	
	@Override
	public void updateNoticeHit(NoticeBean notice) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("n_num", notice.getN_num());
		
		noticeDAO.updateNoticeHit(map);
		
	}
	

}
