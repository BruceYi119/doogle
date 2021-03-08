package kr.co.doogle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.type.JdbcType;

import kr.co.doogle.dto.BulkOrderDTO;
import kr.co.doogle.dto.EcoCategoryDTO;
import kr.co.doogle.dto.EcoDTO;


@Mapper
public interface BulkOrderMapper {

//	@Select("select * from bulk_order")
//	@Result(property = "question", column = "question", jdbcType = JdbcType.CLOB, javaType = String.class)
//	List<dto> getAll();
	   
	@Insert("insert into bulk_order(bono, name, phone, email, hopedate, type, question, writedate) "
			+ "values(s_bulk_order.nextval, #{dto.name}, #{dto.phone}, #{dto.email}, #{dto.hopedate}, #{dto.type}, #{dto.question}, sysdate)")
	void insert(@Param("dto") BulkOrderDTO dto);
	
	@Select("select count(*) from bulk_order ${where}")
	int getTotal(@Param("where") String where, @Param("name") String name);
	
	@Select({"select  bono,name,phone,email,to_char(hopedate,'YYYY-MM-DD') hopedate,type,question,to_char(writedate,'YYYY-MM-DD') writedate from "
			+ "(select seq, tt.* from (select rownum seq, t.* from "
			+ "(select * from bulk_order ${where} order by writedate asc, bono asc) t) tt where seq >= #{start}) where rownum <= #{end}"})
	List<BulkOrderDTO> getAllPaging(@Param("start") int start, @Param("end") int end, @Param("where") String where, @Param("name") String name);
	
	@Select("select bono,name,phone,email,to_char(hopedate,'YYYY-MM-DD') hopedate,type,question,to_char(writedate,'YYYY-MM-DD') writedate from bulk_order where bono=#{bono} ")
	@Result(property = "question", column = "question", jdbcType = JdbcType.CLOB, javaType = String.class)
	BulkOrderDTO getContent(int bono);
	
//	@Select("select bono,name,phone,email,to_char(hopedate,'YYYY-MM-DD') hopedate,type,question,to_char(writedate,'YYYY-MM-DD') writedate from bulk_order")
//	@Result(property = "question", column = "question", jdbcType = JdbcType.CLOB, javaType = String.class)
//	List<BulkOrderDTO> getPcategory();
}