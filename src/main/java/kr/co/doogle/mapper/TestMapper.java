package kr.co.doogle.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.type.JdbcType;

import kr.co.doogle.dto.TestDTO;

@Mapper
public interface TestMapper {
	@Insert("insert into test values(#{dto.tno}, #{dto.con})")
	int insert(@Param("dto") TestDTO dto);

	@Select("select * from test")
	@Result(property = "con" , column = "con", jdbcType = JdbcType.CLOB, javaType = String.class)
	TestDTO getAll();
}