package kr.co.doogle.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyCouponDTO implements Serializable{
	private static final long serialVersionUID = 7073242520586123398L;
	private int mcno, cno, mno;
	private String writedate;
}
