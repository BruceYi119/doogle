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

import kr.co.doogle.dto.Order_listPaymentProductDTO;
import kr.co.doogle.dto.QnaDTO;
import kr.co.doogle.dto.Qna_AnswerDTO;

@Mapper
public interface QnaMapper {
	
	// 1:1 문의 등록
	@Insert("insert into qna (qnno,mno,ono,title,content,ctno,name,email,email_yn,phone,phone_yn,fno,writedate)"+
			" values(s_qna.nextval,#{dto.mno},#{dto.ono},#{dto.title},#{dto.content},#{dto.ctno}, " +
			" #{dto.name},#{dto.email},#{dto.email_yn},#{dto.phone},#{dto.phone_yn},#{dto.fno},sysdate)")
	int insert(@Param("dto") QnaDTO dto);
	
	// 1:1 문의 내용 조회
	@Select("SELECT qnno,ono,title, content, ctno,name,writedate, (SELECT COUNT(*) AS cnt FROM qna_answer qa WHERE qa.qnno = qna.qnno) count FROM qna")
	@Result(property = "content", column = "content", jdbcType = JdbcType.CLOB, javaType = String.class)
	List<QnaDTO> getAll();
	
	// 1:1 문의 삭제
	@Delete("delete from qna where qnno=#{param1}")
	int delete(@Param("mno") int qnno);
	
	// 1:1 문의 단일 조회
	@Select("select * from qna where qnno=#{param1}")
	QnaDTO getOne(@Param("mno") int qnno);
	
	// 1:1 문의 수정
	@Update("update qna set ono=#{ono},title=#{title},content=#{content},ctno=#{ctno},name=#{name},email=#{email},email_yn=#{email_yn}, "
			+ "phone=#{phone},phone_yn=#{phone_yn},fno=#{fno} where qnno=#{qnno} ")
	int update(QnaDTO dto);
	
	// 주문번호 등록을 위한 과거의 결제내역 조회
	@Select("select o.ono,o.quantity,o.pno,p.payment,p.writedate,d.name "+
			" from order_list o inner join " +
			" payment p on (p.ono = o.ono) left outer join " + 
			" product d on (o.pno = d.pno) and o.mno=#{param1}")
	List<Order_listPaymentProductDTO> qnaOrderList(@Param("mno")int mno);
	
	// 관리자 답변 내용 조회
	@Select("select * from qna_answer")
	@Result(property = "content", column = "content", jdbcType = JdbcType.CLOB, javaType = String.class)
	List<Qna_AnswerDTO> answerGetAll();
	
	// 메일 발송을 위한 관리자 답변 내용 조회
	@Select("select content from qna_answer where qnno=#{param1}")
	@Result(property = "content", column = "content", jdbcType = JdbcType.CLOB, javaType = String.class)
	String getContent(@Param("qnno") int qnno);
	
	// 관리자 답변 수 조회
	@Select("select count(*) from qna_answer where qnno=#{param1}")
	int getCount(@Param("qnno") int qnno);
	
}
