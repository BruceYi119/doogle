package kr.co.doogle.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OrdersMemberDTO {
	
	private int ono, mno;
	private String type, id, name, phone;
	private Date writedate;

}
