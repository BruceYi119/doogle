package kr.co.doogle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.doogle.dto.CategoryDTO;
import kr.co.doogle.dto.CouponDTO;
import kr.co.doogle.dto.MyCouponDTO;

@Mapper
public interface CouponMapper {

	@Select("select cno, pno, content, discount, dis_price, dis_type, srat_expiry, end_expiry, writedate from coupon")
	List<CouponDTO> getAll();

	
	// 특정 cno와 일치하는 쿠폰 하나의 정보 조회
	@Select("select * from coupon where cno = #{cno}")
	CouponDTO getOne(@Param("cno") int cno);
	
	// admin/coupon/list 페이징 처리용
	@Select("select count(*) from coupon ${where}")
	int getTotal(@Param("where") String where, @Param("cno") String cno);
	
	// admin/coupon/list 페이징 처리용2
	@Select({"select cno, content, pno, discount, dis_price, dis_type, srat_expiry, end_expiry, writedate from "
			+ "(select seq, tt.* from (select rownum seq, t.* from "
			+ "(select * from coupon ${where} order by cno asc) t) tt where seq >= #{start}) where rownum <= #{end}"})
	List<CouponDTO> getAllPaging(@Param("start") int start, @Param("end") int end, @Param("where") String where, @Param("cno") String cno);

	
	// 특정 cno와 일치하는 쿠폰이 존재하는지 카운팅
	@Select("select count(*) from coupon where cno = #{cno}")
	int getCheck(@Param("cno") int cno);
	
	
	@Insert("insert into coupon(cno, pno, content, discount, dis_price, dis_type, srat_expiry, end_expiry) "
		  + "values (#{dto.cno}, #{dto.pno}, #{dto.content}, #{dto.discount}, #{dto.dis_price}, #{dto.dis_type}, #{dto.srat_expiry}, #{dto.end_expiry} )")
	int couponAdd(@Param("dto") CouponDTO dto);
	
	@Update("update coupon set pno = #{dto.pno}, content = #{dto.content}, discount = #{dto.discount}, "
		  + " dis_price = #{dto.dis_price}, dis_type = #{dto.dis_type}, srat_expiry = #{dto.srat_expiry}, "
		  + " end_expiry = #{dto.end_expiry} where cno = #{dto.cno}")
	int mod(@Param("dto") CouponDTO dto);
	
	@Delete("delete from coupon where cno = #{dto.cno}")
	int del(@Param("dto") CouponDTO dto);
	
}