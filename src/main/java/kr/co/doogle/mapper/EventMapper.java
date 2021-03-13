package kr.co.doogle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.doogle.dto.EventDTO;

@Mapper
public interface EventMapper {

	
	@Select("select * from event order by writedate desc")
	List<EventDTO> getAll();
	
	@Select("select fno_main from event order by writedate desc")
	List<Integer> getFno_main();
	
	@Select("select * from event where eno= #{eno}")
	EventDTO getOne(@Param("eno") int eno);
	
	@Select("select count(*) from event ${where}")
	int getTotal(@Param("where") String where, @Param("ctno") Integer ctno);

	@Select({"select eno, fno_main, content, link, writedate from "
			+ "(select seq, tt.* from (select rownum seq, t.* from "
			+ "(select * from event ${where} order by writedate desc) t) tt where seq >= #{start}) where rownum <= #{end}"})
	List<EventDTO> getAllPaging(@Param("start") int start, @Param("end") int end, @Param("where") String where, @Param("ctno") Integer ctno);

	@Insert({"insert into event(eno, fno_main,content,link) "
			+ "values(s_event.nextval, #{edto.fno_main}, "
			+ "#{edto.content}, #{edto.link})"})
	int insert(@Param("edto") EventDTO edto);
	
	@Update({"update event set fno_main=#{edto.fno_main}, "
			+ "content=#{edto.content}, link=#{edto.link} ${where}"})
	int mod(@Param("edto") EventDTO edto, @Param("where") String where, @Param("eno") Integer eno);	

	@Delete("delete from event where eno=#{eno}")
	int del(@Param("eno") int eno);

}
