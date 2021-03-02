package kr.co.doogle.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO implements Serializable {
	private static final long serialVersionUID = -5735701504500446075L;
	private int pno, price, discount, earn, ctno, ctno1, ctno2, quantity;
	private String name, brand, psubject, sel_unit, weight, pack_type, info, dis_not, earn_not, only_yn, od_yn, fno, sel_not, writedate;
}