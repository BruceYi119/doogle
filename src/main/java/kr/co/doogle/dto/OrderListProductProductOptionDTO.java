package kr.co.doogle.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderListProductProductOptionDTO {
	
	private int pno, pono, pprice, poprice, quantity;
	private double discount;
	private String pname, poname;

}
