package kr.co.doogle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.type.JdbcType;

import kr.co.doogle.dto.CategoryDTO;
import kr.co.doogle.dto.PropositionCategoryDTO;
import kr.co.doogle.dto.PropositionDTO;


@Mapper
public interface PropositionMapper {

	@Select("select ppno,title,ctno,to_char(writedate,'YYYY-MM-DD') as writedate from proposition ")
	@Result(property = "question", column = "question", jdbcType = JdbcType.CLOB, javaType = String.class)
	List<PropositionDTO> getAll();
	   
//	@select("select * from category")
//	List<dto> getCategory(@Param("dto") CategoryDTO dto);
	@Insert("insert into proposition(ppno,title,content,ctno,fno,writedate)"
			+ " values(s_proposition.nextval,#{dto.title},#{dto.content},#{dto.ctno},#{dto.fno},sysdate)")
	void insert(@Param("dto") PropositionDTO dto);
	
	@Select("select p.ppno,p.title,p.content,p.ctno,to_char(p.writedate,'YYYY-MM-DD') writedate, c.name from proposition p left join category c on p.ctno = c.ctno")
	@Result(property = "question", column = "question", jdbcType = JdbcType.CLOB, javaType = String.class)
	List<PropositionCategoryDTO> getPcategory();
	
	@Select("select p.ppno,p.title,p.content,p.ctno,to_char(p.writedate,'YYYY-MM-DD') as writedate,c.name from proposition p left join category c on p.ctno = c.ctno "
			+ "where ppno=#{ppno} ")
	@Result(property = "question", column = "question", jdbcType = JdbcType.CLOB, javaType = String.class)
	PropositionCategoryDTO getContent(int ppno);
	
	@Update("update proposition set ctno=#{dto.ctno},title=#{dto.title},content=#{dto.content} where ppno=#{dto.ppno}")
	@Result(property = "question", column = "question", jdbcType = JdbcType.CLOB, javaType = String.class)
	void update(@Param("dto") PropositionDTO dto);
	
	@Delete("delete from proposition where ppno=#{ppno}")
	void delete(@Param("ppno") int ppno);
	
	@Select("select count(*) from proposition ${where}")
	int getTotal(@Param("where") String where, @Param("ctno") String ctno);
	
	@Select({"select  ppno,title,content,ctno,fno,writedate from "
			+ "(select seq, tt.* from (select rownum seq, t.* from "
			+ "(select * from proposition ${where} order by writedate asc, ctno asc, ppno asc) t) tt where seq >= #{start}) where rownum <= #{end}"})
	List<PropositionDTO> getAllPaging(@Param("start") int start, @Param("end") int end, @Param("where") String where, @Param("ctno") String ctno);

}