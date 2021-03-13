package kr.co.doogle.dto;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SavingDTO implements Serializable {
	private static final long serialVersionUID = 2729546946518370824L;
	private int svno, mno, credit, exp_credit;
	private Date writedate;
}
