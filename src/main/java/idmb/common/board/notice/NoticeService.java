package idmb.common.board.notice;

import java.util.List;
import java.util.Map;

import idmb.model.NoticeBean;

public interface NoticeService {
	
	public List<Map<String, Object>> noticeList(int START, int END) throws Exception;
	
	public int noticeCount() throws Exception;
	
	public Map<String, Object> noticeDetail(NoticeBean notice) throws Exception;
	
	public void updateNoticeHit(NoticeBean notice) throws Exception;

}
