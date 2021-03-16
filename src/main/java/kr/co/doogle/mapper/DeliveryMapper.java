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

@Mapper
public interface DeliveryMapper {

	// 배송지 추가
	@Insert("insert into delivery(dno,mno,addr,addr_detail,receive_name,phone,writedate,default_yn,type) "
			+ " values (s_delivery.nextval,#{dto.mno}, #{dto.addr}, #{dto.addr_detail}, "
			+ " #{dto.receive_name}, #{dto.phone}, sysdate,#{dto.default_yn},#{dto.type})")
	int insert(@Param("dto") DeliveryDTO dto);

	// 배송지 수정을 위한 단일 조회
	@Select("select m.mno,m.name,m.addr,m.addr_detail, m.phone from delivery d inner join member m "
			+ " on d.mno = m.mno where m.id=#{param1}")
	DeliveryMemberDTO get_one(String id);

	// 배송지 전체 조회
	@Select("select * from delivery where mno=#{param1} order by dno asc")
	List<DeliveryDTO> getAll(int mno);

//	//회원 아이디를 통한 회원번호 조회
//	@Select("select mno from member where id=#{param1}")
//	int getId(String id);

	// 회원 주소지 조회(회원 번호 기준)
	@Select("select addr from delivery where mno=#{param1}")
	ArrayList<String> getAddr(int mno);

	// 회원 주소지 조회(배송지 번호 기준)
	@Select("select addr from delivery where dno=#{param1}")
	String updateGet(String dno);

	// 회원 주소지 조회(배송지 번호 기준)
	@Select("select addr_detail from delivery where dno=#{param1}")
	String updateGet2(String dno);

	// 배송지 수정
	@Update("update delivery set addr_detail=#{dto.addr_detail},receive_name=#{dto.receive_name},phone=#{dto.phone} where dno=#{dno}")
	int update(DeliveryDTO dto, @Param("dno") String dno);

	// 배송지 삭제
	@Delete("delete from delivery where dno=#{param1}")
	int delete(int dno);

	// 샛별배송 / 택배 배송 / 구분
	@Select("select dno from delivery where REGEXP_LIKE (addr,'^[서울,인천,경기]{2}')")
	ArrayList<Integer> addrRegexp();

	// 기본 배송지로 설정 수정
	@Update("update delivery set default_yn='y' where dno=#{param1}")
	void defaultUpdate(int dno);

	// 기본 배송지 이외 다른 배송지는 기본배송지에서 제외
	@Update("update delivery set default_yn='n' where mno=#{param1}")
	void defaultUpdateNo(int mno);

	@Select("select * from delivery where mno=${mno} and default_yn ='y'")
	DeliveryDTO getDefault(@Param("mno") String mno);

	@Select("select first_value(addr) over(order by dno) from delivery where mno=#{param1} and rownum =1")
	String firstAddr(int mno);

	@Select("select first_value(dno) over(order by dno) from delivery where mno=#{param1} and rownum =1")
	int firstAddrDno(int mno);

	@Update("update delivery set type = 's' where dno = #{dno}")
	int firstAddrUpdate(int dno);

	@Update("update delivery set receive_name = #{receive_name}, phone = #{phone},pickuptype =#{pickuptype},"
			+ "pickuptype_content = #{pickuptype_content},pickuptype_detail = #{pickuptype_detail},delivery_msg = #{delivery_msg}"
			+ " where mno = #{mno} and default_yn ='y'")
	int updateAddr(@Param("receive_name") String receive_name, @Param("phone") String phone,
			@Param("pickuptype") String pickuptype, @Param("pickuptype_content") String pickuptype_content,
			@Param("pickuptype_detail") String pickuptype_detail, @Param("delivery_msg") String delivery_msg,
			@Param("mno") String mno);

}
