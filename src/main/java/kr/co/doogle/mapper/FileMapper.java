package kr.co.doogle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.doogle.dto.FileDTO;

@Mapper
public interface FileMapper {

	@Select("select * from files ${where}")
	List<FileDTO> getAll(@Param("where") String where, @Param("fno") String fno);

	@Select("select count(*) from files ${where}")
	int getTotal(@Param("where") String where, @Param("ctno") int ctno);

	@Select("select s_files.nextval from dual")
	int getSeq();

	@Select("select * from files ${where}")
	FileDTO getOne(@Param("where") String where, @Param("fno") String fno);

	@Insert("insert into files(fno, name, real_name, loc, ctno) values(#{dto.fno}, #{dto.name}, #{dto.real_name}, #{dto.loc}, #{dto.ctno})")
	int add(@Param("dto") FileDTO dto);

}