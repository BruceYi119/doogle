package kr.co.doogle.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EcoCategoryDTO {
	private int epno,ctno,lv,pctno,idx;
	private String title,content,name,fno,writedate,cname,type,jwritedate;
}
