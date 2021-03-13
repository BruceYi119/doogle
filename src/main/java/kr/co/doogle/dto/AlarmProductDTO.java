package kr.co.doogle.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AlarmProductDTO {

	private int pno,quantity;
	private String name;
	
}
