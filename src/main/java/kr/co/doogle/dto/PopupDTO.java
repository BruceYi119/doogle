package kr.co.doogle.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PopupDTO {
	private int puno,top,bottom,left,right;
	private String title,content,start_date,end_date,type,writedate,width,height;
}