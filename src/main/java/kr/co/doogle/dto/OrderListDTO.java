package kr.co.doogle.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderListDTO {
	
	private int olno,mno,ono,pno,pono,quantity;
	private String type;
	

}
