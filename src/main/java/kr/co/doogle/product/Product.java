package kr.co.doogle.product;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.doogle.dto.ProductDTO;

@Service
public class Product {

	private List<ProductDTO> list;

	public List<ProductDTO> convert(List<ProductDTO> list) {
		int i = 0;

		for (ProductDTO d : list) {
			if (i == 0) {
				this.list = new ArrayList<ProductDTO>();
				i++;
			}

			ProductDTO dto = d;
			dto.setCpack_type(convertPackType(dto.getPack_type()));
			dto.setCdis_yn(convertDisYn(dto.getDis_yn()));
			dto.setCearn_yn(convertEarnYn(dto.getEarn_yn()));
			dto.setConly_yn(convertOnlyYn(dto.getOnly_yn()));
			dto.setCod_yn(convertOdYn(dto.getOd_yn()));
			dto.setCsel_yn(convertSelYn(dto.getSel_yn()));
			this.list.add(dto);
		}

		return this.list;
	}

	public ProductDTO convert(ProductDTO dto) {
		ProductDTO row = dto;
		dto.setCpack_type(convertPackType(dto.getPack_type()));
		dto.setCdis_yn(convertDisYn(dto.getDis_yn()));
		dto.setCearn_yn(convertEarnYn(dto.getEarn_yn()));
		dto.setConly_yn(convertOnlyYn(dto.getOnly_yn()));
		dto.setCod_yn(convertOdYn(dto.getOd_yn()));
		dto.setCsel_yn(convertSelYn(dto.getSel_yn()));
		return row;
	}

	private String convertPackType(String packType) {
		String str;
		switch (packType) {
			case "r" : str = "상온"; break;
			case "c" : str = "냉장"; break;
			case "f" : str = "냉동"; break;
			default : str = "기타";
		}

		return str;
	}

	private String convertDisYn(String disYn) {
		String str;

		switch (disYn) {
			case "y" : str = "할인"; break;
			default : str = "할인안됨";
		}
		
		return str;
	}

	private String convertEarnYn(String earnYn) {
		String str;

		switch (earnYn) {
			case "y" : str = "적립"; break;
			default : str = "적립안됨";
		}
		
		return str;
	}

	private String convertOnlyYn(String onlyYn) {
		String str;

		switch (onlyYn) {
			case "y" : str = "두글만팜"; break;
			default : str = "일반상품";
		}

		return str;
	}

	private String convertOdYn(String odYn) {
		String str;
		
		switch (odYn) {
			case "y" : str = "최저가"; break;
			default : str = "일반상품";
		}
		
		return str;
	}

	private String convertSelYn(String selYn) {
		String str;
		
		switch (selYn) {
			case "y" : str = "판매함"; break;
			default : str = "판매안함";
		}
		
		return str;
	}

}