package kr.co.doogle.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Qna_AnswerDTO {

	private int qano,qnno;
	private String name,content,writedate;
}
