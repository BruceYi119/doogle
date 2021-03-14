package kr.co.doogle.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.doogle.dto.SavingDTO;

@Mapper
public interface SavingMapper {

	// 특정 회원의 saving 테이블 정보 출력
	@Select("select * from saving where mno = #{mno}")
	SavingDTO getOne(@Param("mno") int mno);

	@Update("")
	int mod();

	@Delete("")
	int del();

	@Select("select credit from saving where mno=#{mno}")
	SavingDTO getCredit(@Param("mno") String mno);

	@Update("update saving set credit = credit - #{creditUsed}")
	int creditSub(@Param("creditUsed") String creditUsed);

	@Update("update saving set credit = credit + #{credit}")
	int creditAdd(@Param("credit") String credit);

	@Select("select svno from saving where mno = #{mno}")
	int getSvno(@Param("mno") String mno);

}