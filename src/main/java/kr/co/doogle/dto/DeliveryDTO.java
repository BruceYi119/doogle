package kr.co.doogle.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor	
@NoArgsConstructor
public class DeliveryDTO {
	
	private int dno,mno;
	private String addr,addr_detail,receive_name,phone,writedate,default_yn,type;
}
