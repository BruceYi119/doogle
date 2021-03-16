package kr.co.doogle.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BasketDeliveryDTO {
	private int dno,mno;
	private String addr,addr_detail,receive_name,phone,type,default_yn,writedate;
}
