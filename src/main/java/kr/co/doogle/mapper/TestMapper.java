package kr.co.doogle.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.type.JdbcType;

import kr.co.doogle.dto.TestDTO;

@Mapper
public interface TestMapper {
	@Insert("insert into test values(s_test.nextval, #{con})")
	int insert(@Param("con") String con);

	@Select("select * from test")
	@Results({
		@Result(column = "con", jdbcType = JdbcType.CLOB, javaType = String.class)
	})
	TestDTO getAll();
}