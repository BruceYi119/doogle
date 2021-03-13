package kr.co.doogle.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.doogle.dto.DeliveryDTO;
import kr.co.doogle.dto.DeliveryMemberDTO;
import kr.co.doogle.dto.NoticeDTO;


@Mapper
public interface DeliveryMapper {
	
	//배송지 추가 
	@Insert("insert into delivery(dno,mno,addr,addr_detail,receive_name,phone,writedate,default_yn,type) "+ 
			" values (s_delivery.nextval,#{dto.mno}, #{dto.addr}, #{dto.addr_detail}, "+
			" #{dto.receive_name}, #{dto.phone}, sysdate,#{dto.default_yn},#{dto.type})")
	int insert(@Param("dto") DeliveryDTO dto);
	
	//배송지 수정을 위한 단일 조회
	@Select("select m.mno,m.name,m.addr,m.addr_detail, m.phone from delivery d inner join member m " +
			" on d.mno = m.mno where m.id=#{param1}")
	DeliveryMemberDTO get_one(String id);

	//배송지 전체 조회
	@Select("select * from delivery where mno=#{param1} order by dno asc")
	List<DeliveryDTO> getAll(int mno);

//	//회원 아이디를 통한 회원번호 조회
//	@Select("select mno from member where id=#{param1}")
//	int getId(String id);
	
	// 회원 주소지 조회(회원 번호 기준)
	@Select("select addr from delivery where mno=#{param1}")
	ArrayList<String> getAddr(int mno);
	
	//회원 주소지 조회(배송지 번호 기준)
	@Select("select addr from delivery where dno=#{param1}")
	String updateGet(String dno);
	
	//회원 주소지 조회(배송지 번호 기준)
	@Select("select addr_detail from delivery where dno=#{param1}")
	String updateGet2(String dno);
	
	// 배송지 수정
	@Update("update delivery set addr_detail=#{dto.addr_detail},receive_name=#{dto.receive_name},phone=#{dto.phone} where dno=#{dno}")
	int update(DeliveryDTO dto,@Param("dno") String dno);

	// 배송지 삭제
	@Delete("delete from delivery where dno=#{param1}")
	int delete(@Param("dno") String dno);
	
	// 샛별배송 / 택배 배송 / 구분
	@Select("select dno from delivery where REGEXP_LIKE (addr,'^[서울,인천,경기]{2}')")
	ArrayList<Integer> addrRegexp();
	
	// 기본 배송지로 설정 수정
	@Update("update delivery set default_yn='y' where dno=#{param1}")
	void defaultUpdate(String dno);
	
	// 기본 배송지 이외 다른 배송지는 기본배송지에서 제외
	@Update("update delivery set default_yn='n'")
	void defaultUpdateNo();
}
