package kr.co.doogle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.type.JdbcType;

import kr.co.doogle.dto.TestDTO;

@Mapper
public interface TestMapper {

	@Select("select * from test")
	@Result(property = "con", column = "con", jdbcType = JdbcType.CLOB, javaType = String.class)
	List<TestDTO> getAll();

	@Insert("insert into test values(#{dto.tno}, #{dto.con})")
	int add(@Param("dto") TestDTO dto);
	
	@Select("select tno from test where tt = #{tt}")
	int getTno(@Param("tt") String tt);

}