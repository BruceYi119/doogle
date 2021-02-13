package kr.co.doogle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.doogle.dto.MemberDTO;

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

	@Select("select * from member where id = #{id} and pw = #{pw} and mtype = 'a'")
	MemberDTO adminLogin(@Param("id") String id, @Param("pw") String pw);

	@Select("select * from member where id = #{id} and pw = #{pw} and mtype = 'n'")
	MemberDTO login(@Param("id") String id, @Param("pw") String pw);

	@Select("select id from member where id = #{id}")
	String isDuplicateId(@Param("id") String id);

	@Insert("insert into member(mno, id, pw, name, phone, birth, zipcode, addr, addr_detail, email) "
			+ "values(s_member.nextval, #{dto.id}, #{dto.pw}, #{dto.name}, #{dto.phone}, #{dto.birth}, #{dto.zipcode}, #{dto.addr}, #{dto.addr_detail}, #{dto.email})")
	int insert(@Param("dto") MemberDTO dto);

	@Select("select * from member where id = #{id}")
	MemberDTO getOne(@Param("id") String id);

	@Update("update member set name = #{dto.name}, phone = #{dto.phone}, birth = #{dto.birth}, zipcode = #{dto.zipcode}, addr = #{dto.addr}, addr_detail = #{dto.addr_detail}"
			+ ", email = #{dto.email} where id = #{dto.id}")
	int updateInfo(@Param("dto") MemberDTO dto);

}