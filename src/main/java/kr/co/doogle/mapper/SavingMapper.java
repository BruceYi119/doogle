package kr.co.doogle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.doogle.dto.MyCouponCouponDTO;
import kr.co.doogle.dto.MyCouponDTO;
import kr.co.doogle.dto.SavingDTO;
import lombok.experimental.PackagePrivate;

@Mapper
public interface SavingMapper {

	// 특정 회원의 saving 테이블 정보 출력
	@Select("select * from saving where mno = #{mno}")
	SavingDTO getOne(@Param("mno") int mno);
	
	
	@Update("")
	int mod();

	@Delete("")
	int del();
}