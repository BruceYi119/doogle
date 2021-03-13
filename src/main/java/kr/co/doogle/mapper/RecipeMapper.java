package kr.co.doogle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.doogle.dto.RecipeDTO;

@Mapper
public interface RecipeMapper {

	@Select("select * from recipe order by writedate desc")
	List<RecipeDTO> getAll();
	
	@Select("select * from recipe ${where} order by writedate desc")
	List<RecipeDTO> getChoice(@Param("where") String where, @Param("ctno") Integer ctno);
	
	@Select("select fno from recipe order by writedate desc")
	List<Integer> getFno();
	
	@Select("select fno from recipe ${where} order by writedate desc")
	List<Integer> getFnoChoice(@Param("where") String where, @Param("ctno") Integer ctno);

	@Select("select fno from recipe ${where} order by writedate desc")
	List<Integer> getFnoSearch(@Param("where") String where, @Param("title") String title);
	
	@Select("select * from recipe where rno = #{rno}")
	RecipeDTO getOne(@Param("rno") int rno);
	
	@Select("select * from (select rno, title, lag(rno,1) over(order by rno) pre_rno, "
			+ "lag(title,1) over(order by rno) pre_title, lead(rno,1) over(order by rno) next_rno, "
			+ "lead(title,1) over(order by rno) next_title from recipe) where rno=#{rno}")
	RecipeDTO getPN(@Param("rno") int rno);
	
//	@Insert("insert into recipe  values(s_recipe.nextval, #{rdto.title}, #{rdto.content}, #{rdto.fno}, #{rdto.name}, 0, sysdate")
	@Insert({"insert into recipe(rno, title, content, ctno, fno, name)  "
			+ " values(s_recipe.nextval, #{rdto.title}, #{rdto.content}, "
			+ "#{rdto.ctno}, #{rdto.fno}, #{rdto.name})"})
	int insert(@Param("rdto") RecipeDTO rdto);

	@Update({"update recipe set title=#{dto.title}, content=#{dto.content}, "
			+ "ctno=#{dto.ctno}, fno=#{dto.fno}, name=#{dto.name} ${where} "})
	int mod(@Param("dto") RecipeDTO dto,@Param("where") String where, @Param("rno") Integer rno);
	
	@Delete({"delete from recipe where rno=#{rno}"})
	int delete(@Param("rno") int rno);
	
	@Update("update recipe set read_cnt=read_cnt+1 where rno= #{rno}")
	void setReadnum(@Param("rno") int rno);
	
	@Select("select count(*) from recipe ${where}")
	int getTotal(@Param("where") String where, @Param("ctno") Integer ctno);
	@Select("select count(*) from recipe ${where}")
	int getSearchTotal(@Param("where") String where, @Param("title") String title);

	@Select({"select rno, title, content, ctno, fno, name, read_cnt, writedate from "
			+ "(select seq, tt.* from (select rownum seq, t.* from "
			+ "(select * from recipe ${where} order by writedate desc) t) tt where seq >= #{start}) where rownum <= #{end}"})
	List<RecipeDTO> getAllPaging(@Param("start") int start, @Param("end") int end, @Param("where") String where, @Param("ctno") Integer ctno);

	@Select({"select rno, title, content, ctno, fno, name, read_cnt, writedate from "
			+ "(select seq, tt.* from (select rownum seq, t.* from "
			+ "(select * from recipe ${where} order by writedate desc) t) tt where seq >= #{start}) where rownum <= #{end}"})
	List<RecipeDTO> getSearchPaging(@Param("start") int start, @Param("end") int end, @Param("where") String where, @Param("title") String title);
	
	@Select({"select fno from "
			+ "(select seq, tt.* from (select rownum seq, t.* from "
			+ "(select * from recipe ${where} order by writedate desc) t) tt where seq >= #{start}) where rownum <= #{end}"})
	List<Integer> getFnoPaging(@Param("start") int start, @Param("end") int end, @Param("where") String where, @Param("ctno") Integer ctno);


}