package kr.co.doogle.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NextGradeDTO {
	private int pmno,mno,ono,payment,saving;
	private String id,type,writedate,paymentdate;
}