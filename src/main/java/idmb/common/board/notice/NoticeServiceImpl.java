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
	public List<Map<String, Object>> noticeList(int START, int END) throws Exception{
		Map<String, Object>map = new HashMap<String, Object>();
		
		map.put("START", START);
		map.put("END", END);
		
		return noticeDAO.noticeList(map);	
	}
	
	//공지 수
	@Override
	public int noticeCount() throws Exception{
		
		Map<String, Object> map = noticeDAO.noticeCount();
		
		return Integer.parseInt(String.valueOf(map.get("COUNT")));
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
