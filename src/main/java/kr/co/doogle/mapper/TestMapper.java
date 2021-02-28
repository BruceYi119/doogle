package kr.co.doogle.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.doogle.dto.TestDTO;

@Mapper
public interface TestMapper {

	@Select("select s_test.nextval seq from dual")
	int getSeq();

	@Insert("insert into test values(#{dto.tno}, #{dto.con})")
	int add(@Param("dto") TestDTO dto);

}