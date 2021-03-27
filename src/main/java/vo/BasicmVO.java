package vo;

import lombok.Data;

//** 공통모듈 구현 1.
//VO (Value Object, DTO: Data Transfer Object) 
//=> member 테이블의 구조
//=> 자료를 주고 받는 통로 역할

// MultipartFile (Interface)
// -> CommonsMultipartFile
@Data
public class BasicmVO {
	
	private int basicm_seq;
	private String basicm_id;
	private String basicm_pwd;
	private String basicm_nm;
	private String basicm_pnum;
	private String basicm_email;

} // vo
