package kr.co.doogle.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.type.JdbcType;

import kr.co.doogle.dto.QnaDTO;
import kr.co.doogle.dto.Qna_AnswerDTO;

@Mapper
public interface QnaAnswerMapper {

	//1:1 문의 전체 조회
	@Select({"select qnno,mno,ono,title,content,ctno,name,email,email_yn,phone,phone_yn,fno,writedate from ( select seq,tt.* from "
			+ " ( select rownum seq,t.* from (select * from qna ${where} order by qnno desc ) t) tt where seq >= #{start}) where rownum <=#{end}"})
	List<QnaDTO> getAll(@Param("start") int start, @Param("end")int end, @Param("where")String where, @Param("ctno") Integer ctno);
	
	// 페이지처리를 위한 레코드수 조회
	@Select("select count(*) from qna ${where}")
	int getTotal (@Param("where") String where,@Param("ctno") Integer ctno);
	
	// 1:1 문의 하나 조회
	@Select("select title, ctno, name, ono,mno,email,phone,content,qnno from qna where qnno=#{param1}")
	QnaDTO getOne(@Param("no")int qnno);
	
	// 1:1 문의 답변 등록(관리자)
	@Insert("insert into qna_answer values (s_qna_answer.nextval,#{dto.qnno},#{dto.name},#{dto.content},sysdate)")
	int insert(@Param("dto") Qna_AnswerDTO dto);
	
	// 답변 완료 체크를 위한 번호 조회
	@Select("select qnno from qna_answer")
	ArrayList<Integer> getQnno();
	
	// 답변 내용 조회
	@Select("select content from qna_answer where qnno = #{param1}")
	@Result(property = "content", column = "content", jdbcType = JdbcType.CLOB, javaType = String.class)
	String getContent(@Param("qnno") int qnno);
	
	// 이메일 알림 후, 이메일 전송 완료 처리를 위한 수정
	@Update("update qna set email_yn = 'o' where qnno=#{param1}")
	void emailOk(@Param("qnno") int qnno);
	
	// 문자 알림 후, 문자 전송 완료 처리를 위한 수정
	@Update("update qna set phone_yn = 'o' where qnno=#{param1}")
	void phoneOk(@Param("qnno") int qnno);
	
}
