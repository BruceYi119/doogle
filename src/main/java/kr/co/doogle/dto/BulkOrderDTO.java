package kr.co.doogle.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BulkOrderDTO {
	private int bono;
	private String name,phone,email,hopedate,type,question,writedate,ktype;
}
