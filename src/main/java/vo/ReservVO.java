package vo;

import lombok.Data;

@Data
public class ReservVO {
	private String reserv_id;
	private String basicm_id;
	private int place_id;
	private String use_date;
	private String use_starttime;
	private String use_endtime;
	private String use_number;
	private String use_purpose;
	private String reg_date;
	private int confirm;
}
