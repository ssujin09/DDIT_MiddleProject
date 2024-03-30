package meeting.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MeetingDetailVO {
	
	private int meetingDetailNo;
	private int meetingNo;
	private String cstmrId;
	
	
	public MeetingDetailVO() {
		// TODO Auto-generated constructor stub
	}


	public MeetingDetailVO(int meetingDetailNo, int meetingNo, String cstmrId) {
		super();
		this.meetingDetailNo = meetingDetailNo;
		this.meetingNo = meetingNo;
		this.cstmrId = cstmrId;
	}
	
	
}
