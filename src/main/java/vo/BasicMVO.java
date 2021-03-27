package vo;

import lombok.Data;

//** 공통모듈 구현 1.
//VO (Value Object, DTO: Data Transfer Object) 
//=> member 테이블의 구조
//=> 자료를 주고 받는 통로 역할

// MultipartFile (Interface)
// -> CommonsMultipartFile
@Data
public class BasicMVO {

	
	private int	   BASICM_SEQ;
	private String BASICM_ID;
	private String BASICM_PWD;
	private String BASICM_NM;
	private String BASICM_PNUM;
	private String BASICM_EMAIL;

} // vo
