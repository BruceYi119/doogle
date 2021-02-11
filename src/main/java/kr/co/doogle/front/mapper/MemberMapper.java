package kr.co.doogle.front.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
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

	@Select("select rownum, mno, id, pw, name, phone, birth, zipcode, addr, addr_detail, email, mtype, del_yn, writedate from (select seq, tt.* from (select rownum seq, t.* from (select * from member order by writedate desc) t) tt where seq >= #{start}) where rownum <= #{range}")
	List<MemberDTO> getAllPage(@Param("start") int start, @Param("range") int range);

	@Select("select count(*) from member order by writedate desc")
	int getTotalCnt();
}