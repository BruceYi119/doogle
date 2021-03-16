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
	private int quantity;
	private String brand,pname,dis_yn,earn_yn,sel_yn;
	private Double discount,pprice,earn;
	/*상품옵션*/
	private int pono,oprice;
	private String oname;
	/*이미지파일*/
	private int fno;
	private String fname,loc;
}
