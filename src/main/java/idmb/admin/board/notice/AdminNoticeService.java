package idmb.admin.board.notice;

import java.util.List;
import java.util.Map;

import idmb.model.NoticeBean;

public interface AdminNoticeService {
	
	public List<Map<String, Object>> adminNoticeList() throws Exception;
	
	public Map<String, Object> adminNoticeDetail(NoticeBean notice) throws Exception;
	
	public void adminInsertNotice(NoticeBean notice) throws Exception;
	
	public void adminUpdateNotice(NoticeBean notice) throws Exception;
	
	public void adminDeleteNotice(NoticeBean notice) throws Exception;
	
	public void adminNoticeHit(NoticeBean notice) throws Exception;

}
