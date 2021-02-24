package kr.co.doogle.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CategoryDTO implements Serializable {
	private static final long serialVersionUID = -7906539490392127293L;
	private int ctno, lv, pctno, idx;
	private String name, type, writedate;
//	private Date writedate;
}