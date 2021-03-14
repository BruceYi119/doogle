package kr.co.doogle.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BasketProductProdctOptionFileDTO {
	/*장바구니*/
	private int bno,mno,pno,quantity;
	private String writedate;
	/*상품*/
	private int stock;
	private String brand,pname,pack_type,dis_not,earn_not,sel_not;
	private Double discount,pprice,earn;
	
	/*상품옵션*/
	private int pono,oprice;
	private String oname;
	
	/*이미지파일*/
	private int fno;
	private String fname,loc;
}