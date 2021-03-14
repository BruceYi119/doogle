package kr.co.doogle.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentDTO {
	
	private int pmno,mno,ono,payment,saving,productTotalPrice,deliveryPrice,productDisPrice,couponDisPrice,savingPrice;
	private String type,cardName,cardMonth;
	private Date writedate;
}
