package kr.co.doogle.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LivingProductProductOptionFileDTO {
	/*늘사는것*/
	private int lno,mno,pno;
	private String writedate;
	/*상품*/
	private int price;
	private String brand,pname;
	/*이미지파일*/
	private int fno;
	private String fname,loc;
}
