package kr.co.doogle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.doogle.dto.AlarmDTO;
import kr.co.doogle.dto.AlarmProductDTO;
import kr.co.doogle.dto.MemberDTO;
import kr.co.doogle.dto.ProductDTO;

@Mapper
public interface AlarmMapper {
	
	//ajax 의 정보를 받아서 재입고 알림 테이블에 입력
	@Insert("insert into alarm values (s_alarm.nextval,#{dto.mno},#{dto.pno},sysdate)")
	int insert(@Param("dto") AlarmDTO dto);
	
	//재입고 알림 신청을 최신순으로 정렬
	@Select("select * from alarm order by writedate desc")
	List<AlarmDTO> getAll();
	
//	//상품테이블에서 재입고알림을 위해 수량 체크.
//	@Select("select name,quantity,pno from product where pno=#{pno}")
//	List<ProductDTO> getQuantity(int pno);
	
	//재입고 알림을 보낼 휴대폰번호,이메일 번호 조회
	@Select("select name,phone,email from member where mno=#{mno}")
	MemberDTO getMailPhone(int mno);
	
	//상품명 조회
	@Select("select name from product where pno=#{pno}")
	String productName(int pno);
}
