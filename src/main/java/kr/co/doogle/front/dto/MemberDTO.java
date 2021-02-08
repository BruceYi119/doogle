package kr.co.doogle.front.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDTO {
	private int mno;
	private String id, pw, name, phone, birth, zipcode, addr, addr_detail, email, mtype, del_yn, writedate;
}