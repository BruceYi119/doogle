package kr.co.doogle.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaDTO {
	
	private int qnno,mno,ono,count;
	private Integer ctno;
	private String title,content,name,email,email_yn,phone,phone_yn,fno,writedate;
	
}
