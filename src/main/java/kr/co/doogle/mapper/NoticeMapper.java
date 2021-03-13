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

import kr.co.doogle.dto.NoticeDTO;

@Mapper
public interface NoticeMapper {
	
	//공지사항 등록 
	@Insert("insert into notice(type,nno,name,title,content,writeDate,state) " +
	" values (#{dto.type},s_notice.nextval,#{dto.name},#{dto.title},#{dto.content},sysdate,#{dto.state})")
	int insert(@Param("dto") NoticeDTO dto);
	
	//공지사항 조회
	@Select({"select nno,title,content,name,read_cnt,type,writedate,state from (select seq, tt.* from (select rownum seq, t.* from "
			+ " (select * from notice ${where} order by nno desc ) t) tt where seq >= #{start}) where rownum <= #{end}"})
	@Result(property = "content", column = "content", jdbcType = JdbcType.CLOB, javaType = String.class)
	List<NoticeDTO> getAll(@Param("start") int start, @Param("end")int end, @Param("where")String where, @Param("title")String title);
	
	//페이지 처리를 위한 레코드 수 조회
	@Select("select count(*) from notice ${where}")
	int getTotal(@Param("where") String where, @Param("title") String title);
	
	//단일 계정 조회
	@Select("select * from notice where nno=#{param1}")
	NoticeDTO getOne(@Param("no") int no);
	
	//이전글 다음글 조회
	@Select("select * from (select nno,title, lead(title,1) over(order by nno) next, " 
			+" lag(title,1) over(order by nno) prev from notice) where nno = #{param1}")
	NoticeDTO pre_nex(@Param("no") int no);
	
	// 공지사항 수정
	@Update("update notice set name = #{name},state=#{state},title=#{title},content=#{content} where nno=#{nno}")
	int update(NoticeDTO dto);
	
	// 공지사항 삭제
	@Delete("delete from notice where nNo=#{param1}")
	int delete(@Param("no") int no);
	
	// 공지사항 조회수 증가
	@Update("update notice set read_cnt = read_cnt+ 1 where nno=#{param1}")
	int noticeReadCnt(@Param("no") int no);
	
}