package kr.co.doogle.dto;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CouponDTO implements Serializable {
	private static final long serialVersionUID = -3201081118509716984L;
	private int pno, cno, discount, dis_price;
	private String content, dis_type; 
	private Date srat_expiry, end_expiry, writedate;
}