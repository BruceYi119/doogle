package kr.co.doogle.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// join문 이용시 별도의 DTO를 만들어서 사용하는 테이블의 모든 컬럼들 다시 다 적어놓기
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyCouponCouponDTO {
	private int cno, mcno, mno, dis_price;
	private double discount;
	private String pno, content, srat_expiry, end_expiry, dis_type;
}