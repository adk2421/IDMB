package idmb.admin.board.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import idmb.model.NoticeBean;

@Service("adminNoticeService")
public class AdminNoticeServiceImpl implements AdminNoticeService{

	@Resource(name="adminNoticeDAO")
	private AdminNoticeDAO adminNoticeDAO;
	
	//공지리스트
	@Override
	public List<Map<String, Object>>adminNoticeList() throws Exception{
		return adminNoticeDAO.adminNoticeList();
	}
	
	//공지 상세 정보	
	@Override
	public Map<String, Object>adminNoticeDetail(NoticeBean notice)throws Exception{
		Map<String, Object>map = new HashMap<String, Object>();
		
		map.put("n_num", notice.getN_num());
		
		return adminNoticeDAO.adminNoticeDetail(map);
	
	}
	//공지 작성	
	@Override
	public void adminInsertNotice(NoticeBean notice)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("n_title",notice.getN_title());
		map.put("n_contents", notice.getN_contents());
		
		adminNoticeDAO.adminInsertNotice(map);
	}
	//공지 수정	
	@Override
	public void adminUpdateNotice(NoticeBean notice) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("n_title", notice.getN_title());
		map.put("n_contents", notice.getN_contents());
		map.put("n_num", notice.getN_num());
		
		adminNoticeDAO.adminUpdateNotice(map);
	}
	
	//	공지삭제
	@Override
	public void adminDeleteNotice(NoticeBean notice)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("n_num", notice.getN_num());
		
		adminNoticeDAO.adminDeleteNotice(map);
	}
	
	@Override
	public void adminNoticeHit(NoticeBean notice) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("n_num", notice.getN_num());
		
		adminNoticeDAO.adminNoticeHit(map);
	}
}
