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
	private String name, brand, subject, sel_unit, weight, pack_type, info, dis_yn, earn_yn, only_yn, od_yn, fno, sel_yn, writedate;
	private String cpack_type, cdis_yn, cearn_yn, conly_yn, cod_yn, csel_yn, cctno, cctno1, cctno2;
}