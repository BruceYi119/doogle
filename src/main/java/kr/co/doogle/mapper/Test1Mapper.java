package kr.co.doogle.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.co.doogle.dto.Test1DTO;

@Mapper
public interface Test1Mapper {

	@Insert("insert into test1 values(s_test1.nextval, #{dto.con}, #{dto.tno})")
	int add(@Param("dto") Test1DTO dto);

}