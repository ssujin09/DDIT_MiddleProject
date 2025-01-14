package admin.vo;


import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class NoticeVO {

	 private int noticeCode;
	 private String noticeTitle;
	 private String noticeContent;
	 private LocalDate noticeDate;
	 private int noticeCount;
	 
	 
	 public NoticeVO() {
		// TODO Auto-generated constructor stub
	}

	public NoticeVO(int noticeCode, String noticeTitle, String noticeContent, LocalDate noticeDate,
			int noticeCount) {
		this.noticeCode = noticeCode;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeCount = noticeCount;
	}

	 
	 
}
