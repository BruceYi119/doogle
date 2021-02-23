package kr.co.doogle.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberDTO implements Serializable {
	private static final long serialVersionUID = -8204326534932710183L;
	private int mno;
	private String id, pw, name, phone, birth, gender, zipcode, addr, addr_detail, email, mtype, del_yn, writedate;
}