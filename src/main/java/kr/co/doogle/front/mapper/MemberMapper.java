package kr.co.doogle.front.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.co.doogle.front.dto.MemberDTO;

@Mapper
public interface MemberMapper {
	@Select("select * from member order by writedate desc")
//	@Results({
//		@Result(property="id", column="member_id"),
//		@Result(property="name", column="member_name")
//	})
	List<MemberDTO> getAll(); 
}