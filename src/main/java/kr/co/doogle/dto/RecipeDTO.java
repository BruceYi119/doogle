package kr.co.doogle.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecipeDTO {
	private Integer ctno;
	private int rno, fno, read_cnt, hd,next_rno, pre_rno;
	private String title, content,  name, writedate ,next_title, pre_title;
}