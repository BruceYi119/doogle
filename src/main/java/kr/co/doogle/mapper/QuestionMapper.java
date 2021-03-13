package kr.co.doogle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.doogle.dto.QuestionDTO;
	
@Mapper
public interface QuestionMapper {
//	자주하는질문 작성
	@Insert("insert into question (qno,title,content,ctno,type,writedate) "
			+ " values (s_question.nextval,#{dto.title},#{dto.content},#{dto.ctno},#{dto.type},sysdate)")
	int insert(@Param("dto") QuestionDTO dto);
	
	//	자주하는질문 리스트 조회	
	@Select({"select qno,title,content,ctno,type,writedate from (select seq, tt.* from (select rownum seq, t.* from "
			+ " (select * from question ${where} order by qno desc ) t) tt where seq >= #{start}) where rownum <= #{end}"})
	List<QuestionDTO> getAll(@Param("start") int start, @Param("end")int end, @Param("where")String where, @Param("ctno") Integer ctno);
	
//	자주하는질문 삭제
	@Delete("delete from question where qno=#{param1}")
	int delete(@Param("qno") int qno);
	
	// 자주하는 질문 수정을 위한 단일 조회
	@Select("select * from question where qno=#{param1}")
	QuestionDTO getOne(@Param("qno") int qno);
	
	// 자주하는 질문 수정
	@Update("update question set title=#{title},content=#{content},type=#{type},ctno=#{ctno} where qno=#{qno}")
	int update(QuestionDTO dto);
	
	// 자주하는 질문 카테고리별 조회
	@Select("select count(*) from question ${where}")
	int getTotal(@Param("where") String where, @Param("ctno") Integer ctno);
	
	
}
