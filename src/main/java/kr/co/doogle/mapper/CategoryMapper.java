package kr.co.doogle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.doogle.dto.CategoryDTO;

@Mapper
public interface CategoryMapper {

	@Select("#{sql}")
	List<CategoryDTO> getQueryAll(@Param("sql") String sql);

	@Select("select * from category order by type asc, writedate desc")
	List<CategoryDTO> getAll();

	@Insert("insert into category values(s_category.nextval(), #{dto.name}, #{dto.lv}, #{dto.pctno}, #{dto.type}, sysdate)")
	int add(@Param("dto") CategoryDTO dto);

	@Update("update category set name = #{dto.name}, lv = #{dto.lv}, pctno = #{dto.pctno}, type = #{dto.type}, #{dto.writedate}")
	int mod(@Param("dto") CategoryDTO dto);

	@Delete("delete from category where ctno = #{ctno}")
	int del(@Param("ctno") int ctno);

}