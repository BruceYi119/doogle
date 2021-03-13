package kr.co.doogle.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor	
@NoArgsConstructor
public class Order_listPaymentProductDTO {

	
	private int pno,ono,payment,quantity;
	private String writedate,name;
}
