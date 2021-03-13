package kr.co.doogle.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeDTO {
	private int nno,read_cnt,state;
	private String name,title,content,writedate,type,next,prev,search;
	
}
