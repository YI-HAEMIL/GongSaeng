package vo;

import lombok.Data;

@Data
public class PlacefileVO {
	private String origin_nm;
	private String file_nm;
	private long file_size;
	private String file_url;
	private int place_id;
}
