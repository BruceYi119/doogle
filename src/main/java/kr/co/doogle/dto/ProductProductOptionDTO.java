package kr.co.doogle.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductProductOptionDTO {

	/*상품*/
	private int pno,pprice,earn;
	private String brand,pname,dis_not,earn_not;
	private Double discount;
	
	/*상품옵션*/
	private int pono,oprice;
	private String oname;

}
