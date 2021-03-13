package kr.co.doogle.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Saving_listDTO implements Serializable {
	private static final long serialVersionUID = 1108009830755967957L;
	private int svlno, svno, mno, credit; 
	private String expiry, writedate;

}
