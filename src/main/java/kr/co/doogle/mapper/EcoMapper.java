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

import kr.co.doogle.dto.EcoCategoryDTO;
import kr.co.doogle.dto.EcoDTO;
import kr.co.doogle.dto.PropositionDTO;


@Mapper
public interface EcoMapper {
	@Select("select e.epno,e.title,e.content,e.name,e.ctno,to_char(e.writedate,'YYYY-MM-DD') writedate, c.name cname from eco e left join category c on e.ctno = c.ctno")
	@Result(property = "question", column = "question", jdbcType = JdbcType.CLOB, javaType = String.class)
	List<EcoCategoryDTO> getPcategory();
	
	@Insert({"insert into eco(epno,title,name,content,ctno,fno,writedate) "
			+ "values(s_eco.nextval,#{dto.title},#{dto.name},#{dto.content},#{dto.ctno},#{dto.fno},sysdate)"})
	void insert(@Param("dto") EcoDTO dto);
	
	@Select("select e.epno,e.title,e.name,e.content,e.ctno,to_char(e.writedate,'YYYY-MM-DD') writedate,c.name cname from eco e left join category c on e.ctno = c.ctno "
			+ "where epno=#{epno} ")
	@Result(property = "question", column = "question", jdbcType = JdbcType.CLOB, javaType = String.class)
	EcoCategoryDTO getContent(int epno);
	
	@Update("update eco set ctno=#{dto.ctno},title=#{dto.title},content=#{dto.content},pname=#{dto.name} where epno=#{dto.epno}")
	@Result(property = "question", column = "question", jdbcType = JdbcType.CLOB, javaType = String.class)
	void update(@Param("dto") EcoDTO dto);
	
	@Delete("delete from eco where epno=#{epno}")
	void delete(@Param("epno") int epno);
	
	@Select("select count(*) from eco ${where}")
	int getTotal(@Param("where") String where, @Param("ctno") String ctno);
	
	@Select({"select  epno,title,content,name,ctno,fno,writedate from "
			+ "(select seq, tt.* from (select rownum seq, t.* from "
			+ "(select * from eco ${where} order by writedate asc, ctno asc, epno asc) t) tt where seq >= #{start}) where rownum <= #{end}"})
	List<EcoDTO> getAllPaging(@Param("start") int start, @Param("end") int end, @Param("where") String where, @Param("ctno") String ctno);
}
