package meeting.vo;

import java.time.LocalDate;
import java.time.LocalTime;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MeetingVO {

	private int meetingNo;
	private String meetingRegion;
	private int meetingNmpr;
	private LocalDate meetingDate;
	private LocalTime meetingTime;
	private String meetingComment;
	private String cstmrId;
	private int rstrntCode;
	
	public MeetingVO() {
		// TODO Auto-generated constructor stub
	}

	public MeetingVO(int meetingNo, String meetingRegion, int meetingNmpr, LocalDate meetingDate, LocalTime meetingTime,
			String meetingComment, String cstmrId, int rstrntCode) {
		super();
		this.meetingNo = meetingNo;
		this.meetingRegion = meetingRegion;
		this.meetingNmpr = meetingNmpr;
		this.meetingDate = meetingDate;
		this.meetingTime = meetingTime;
		this.meetingComment = meetingComment;
		this.cstmrId = cstmrId;
		this.rstrntCode = rstrntCode;
	}

	
	
}
