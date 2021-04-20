package vo;

import lombok.Data;

@Data
public class PlaceableVO {
	private int place_id;
	private String bizm_id;
	private String able_date;
	private String able_starttime;
	private String able_endtime;
	private int available;
}
