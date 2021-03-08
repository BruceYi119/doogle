package kr.co.doogle.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PropositionCategoryDTO {
	private int ppno, ctno, lv, pctno, idx;
	private String title,content,fno,writedate, name, type, jwritedate;
}
