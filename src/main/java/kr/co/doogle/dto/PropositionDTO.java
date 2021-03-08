package kr.co.doogle.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PropositionDTO {
	private int ppno,ctno;
	private String title,content,fno,writedate;
}
