package com.service.gnt.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;
import com.service.gnt.domain.notice.Notice;
import com.service.gnt.model.service.NoticeService;
import io.swagger.annotations.ApiOperation;
@RestController
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	@ApiOperation(value="getNoticeList", notes="공지사항 목록")
	@GetMapping("getNoticeList.do")
	public Map<String,Object> getNoticeList() {
		Map<String,Object> maps = new HashMap<>();
		Map<String,Object> innermap = new HashMap<>();
		String status = "no";
		try {
			List<Notice> data = noticeService.getNoticeList();
			if(noticeService.getNoticeCount()>0) {
				status = "yes";
				int index = 1;
				for(Notice vo : data) {
					if(vo != null) {
						innermap.put(Integer.toString(index++), (Object) vo);
					}					
				}
				maps.put("notice", innermap);
			}			
			maps.put("message", status);
			return maps;
		} catch(Exception e) {
			System.out.println("Error :"+e.getMessage()+e.toString());
			e.printStackTrace();
			maps.put("message", status);
			return maps;
		}
	}
	@ApiOperation(value="getNoticeDetail", notes="공지사항 상세")
	@GetMapping("getNoticeDetail.do")
	public Map<String,Object> getNoticeDetail(int noticeId) {
		Map<String,Object> maps = new HashMap<>();
		String status = "no";
		try {
			Object data = noticeService.getNoticeDetail(noticeId);
			if(data!=null) {
				status = "yes";
				maps.put("notice", data);
			}			
			maps.put("message", status);
			return maps;
		} catch(Exception e) {
			System.out.println("Error :"+e.getMessage()+e.toString());
			e.printStackTrace();
			maps.put("message", status);
			return maps;
		}
	}
	@ApiOperation(value="addNoticeCount", notes="공지사항 조회수 증가")
	@PutMapping("addNoticeCount.do")
	public Map<String,Object> addNoticeCount(int noticeId) {
		Map<String,Object> maps = new HashMap<>();
		String status = "no";
		try {
			Object data = noticeService.getNoticeDetail(noticeId);
			if(data!=null) {
				noticeService.addNoticeCount(noticeId);
				status = "yes";
				maps.put("cnt", noticeService.getNoticeDetail(noticeId).getViewCnt());
			}			
			maps.put("message", status);
			return maps;
		} catch(Exception e) {
			System.out.println("Error :"+e.getMessage()+e.toString());
			e.printStackTrace();
			maps.put("message", status);
			return maps;
		}
	}
}
