package kr.co.doogle.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BasketProductDTO {
	private int bno,mno,pno,pono,quantity;
    private String writedate;
	
    
	private int jpno,price,discount,earn,cno,cno1,cno2,fno,jquantity;
	private String pname,psubject,sel_unit,weight,pack_type,info,dis_not,earn_not,sel_not,jwritedate;
}