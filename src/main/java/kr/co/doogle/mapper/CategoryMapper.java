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

	@Select("${sql}")
	List<CategoryDTO> getQueryAll(@Param("sql") String sql);

	@Select("select * from category order by type asc, writedate desc")
	List<CategoryDTO> getAll();

	@Select("select ctno from category where type = #{type} and lv = #{lv}")
	int getCtno(@Param("type") String type, @Param("lv") int lv);

	@Insert("insert into category values(s_category.nextval(), #{dto.name}, #{dto.lv}, #{pctno}, #{dto.type}, sysdate)")
	int add(@Param("dto") CategoryDTO dto);

	@Insert("insert into category(ctno, name, lv, type) values(s_category.nextval, #{dto.name}, #{dto.lv}, #{dto.type})")
	int addCategory(@Param("dto") CategoryDTO dto);

	@Insert("insert into category(ctno, name, lv, type, pctno) values(s_category.nextval, #{dto.name}, #{dto.lv}, #{dto.type}, #{dto.pctno})")
	int addCategoryLv(@Param("dto") CategoryDTO dto);

	@Update("update category set name = #{dto.name}, lv = #{dto.lv}, pctno = #{dto.pctno}, type = #{dto.type}, #{dto.writedate}")
	int mod(@Param("dto") CategoryDTO dto);

	@Delete("delete from category where ctno = #{ctno}")
	int del(@Param("ctno") int ctno);

	@Select("select count(*) from category where lv = 0 and type in (${type})")
	int checkInitCategory(@Param("type") String type);

}