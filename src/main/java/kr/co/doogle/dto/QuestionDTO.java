package kr.co.doogle.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QuestionDTO {
	
	private int qno;
	private Integer ctno;
	private String title,content,type,writedate;
	
	
}
