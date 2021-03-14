package kr.co.doogle.mapper;

import java.util.ArrayList;
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
	List<CategoryDTO> getAllSql(@Param("sql") String sql);

	@Select("select * from category ${where}")
	List<CategoryDTO> getAll(@Param("where") String where, @Param("type") String type, @Param("lv") String lv, @Param("pctno") String pctno);

	@Select({"select ctno, lv, pctno, idx, name, type, writedate from "
			+ "(select seq, tt.* from (select rownum seq, t.* from "
			+ "(select * from category ${where} order by type asc, lv asc, idx asc) t) tt where seq >= #{start}) where rownum <= #{end}"})
	List<CategoryDTO> getAllPaging(@Param("start") int start, @Param("end") int end, @Param("where") String where, @Param("type") String type);

	@Select("select * from category where ctno = #{ctno}")
	CategoryDTO getOne(@Param("ctno") int ctno);

	@Select("select count(*) from category ${where}")
	int getTotal(@Param("where") String where, @Param("type") String type);

	@Select("select ctno from category where name = #{name} and lv = #{lv}")
	int getCtno(@Param("name") String name, @Param("lv") int lv);

	@Select("select ctno from category where name = #{name} and lv = #{lv} and type = #{type}")
	int getTypeCtno(@Param("name") String name, @Param("lv") int lv, @Param("type") String type);

	@Insert("insert into category values(s_category.nextval(), #{dto.name}, #{dto.lv}, #{pctno}, #{dto.type}, sysdate)")
	int add(@Param("dto") CategoryDTO dto);

	@Insert("insert into category(ctno, name, lv, type, idx) values(s_category.nextval, #{dto.name}, #{dto.lv}, #{dto.type}, #{dto.idx})")
	int addCategory(@Param("dto") CategoryDTO dto);

	@Insert("insert into category(ctno, name, lv, type, idx, pctno) values(s_category.nextval, #{dto.name}, #{dto.lv}, #{dto.type}, #{dto.idx}, #{dto.pctno})")
	int addChildCategory(@Param("dto") CategoryDTO dto);

	@Update("update category set name = #{dto.name}, lv = #{dto.lv}, pctno = #{dto.pctno}, type = #{dto.type}, #{dto.writedate}")
	int mod(@Param("dto") CategoryDTO dto);

	@Delete("delete from category where ctno = #{ctno}")
	int del(@Param("ctno") int ctno);

	@Select("select * from category where type=#{type}")
	ArrayList<CategoryDTO> getCards(@Param("type") String type);

}