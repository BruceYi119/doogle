package kr.co.doogle.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentMemberDTO {
	private int pmno, mno, ono, deliveryPrice,saving,payment,productDisPrice,couponDisPrice,savingPrice,productTotalPrice;
	private String type,cardName,cardMonth,id,name,phone;
	private Date writedate;
}
