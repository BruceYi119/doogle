package kr.co.doogle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.doogle.dto.PopupDTO;

@Mapper
public interface PopupMapper {

	@Select("select * from popup order by writedate desc")
	List<PopupDTO> getAll();
	
	@Select("select * from popup where puno=#{puno} order by writedate desc")
	PopupDTO getOne(@Param("puno") int puno);	

	@Select("select count(*) from popup ${where}")
	int getTotal(@Param("where") String where, @Param("ctno") Integer ctno);

	@Select({"select puno, top, bottom, left,right,width, height, title, "
			+ "content,start_date,end_date,type, writedate from "
			+ "(select seq, tt.* from (select rownum seq, t.* from "
			+ "(select * from popup ${where} order by writedate desc) t) tt where seq >= #{start}) where rownum <= #{end}"})
	List<PopupDTO> getAllPaging(@Param("start") int start, @Param("end") int end, @Param("where") String where, @Param("ctno") Integer ctno);

	@Insert({"insert into popup(puno, top, bottom, left, right, "
			+ "width, height, title,content,start_date,end_date) "
			+ "values(s_popup.nextval, #{pudto.top}, #{pudto.bottom}, "
			+ "#{pudto.left}, #{pudto.right},#{pudto.width},#{pudto.height},"
			+ " #{pudto.title},#{pudto.content},#{pudto.start_date},#{pudto.end_date})"})
	int insert(@Param("pudto") PopupDTO pudto);

	@Update({"update popup set top=#{pudto.top}, bottom=#{pudto.bottom}, "
			+ "left=#{pudto.left}, right=#{pudto.right}, width=#{pudto.width}, "
			+ "height=#{pudto.height},title=#{pudto.title},content=#{pudto.content}, "
			+ "start_date=#{pudto.start_date},end_date=#{pudto.end_date} ${where} "})
	int mod(@Param("pudto") PopupDTO pudto, @Param("where") String where, @Param("puno") Integer puno);

	@Delete("delete from popup where puno=#{puno}")
	int del(@Param("puno") int puno);
}
