package kr.co.doogle.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.doogle.dto.MyCouponCouponDTO;
import kr.co.doogle.dto.MyCouponDTO;

@Mapper
public interface MyCouponMapper {
//  조인문	
//	@Select("select m.cno, m.mcno, c.content from my_coupon m left join coupon c on m.cno = c.cno where m.mno = 1")
//	List<MyCouponCouponDTO> getAll();

	// My_coupon 테이블에 데이터가 하나라도 있는지 조회, insert할때 조건문으로 사용
	@Select("select count(*) from my_coupon where mcno = #{mcno}")
	int getCheck(@Param("mcno") int mcno);
	
	// myCoupon페이지에서 쿠폰추가
	@Insert({"insert into my_coupon(mcno, cno, mno) "
			+ "values(s_my_coupon.nextval, #{dto.cno}, #{dto.mno})"})
	int add(@Param("dto") MyCouponDTO dto);

	// mno 와 일치하는 my_coupon테이블의 모든 데이터 조회
	@Select("select m.mcno, m.cno, m.mno, c.content, c.srat_expiry, c.end_expiry, c.discount, c.dis_price, c.dis_type from my_coupon m left join coupon c on m.cno = c.cno where m.mno = #{mno}")
	List<MyCouponCouponDTO> getAll(@Param("mno") int mno);
	
	// mno 와 일치하는 my_coupon테이블의 쿠폰갯수 조회
	@Select("select count(m.cno) from my_coupon m left join coupon c on m.cno = c.cno where m.mno = #{mno}")
	int getCouponCount(@Param("mno") int mno);

	// shop/mypage/mycoupon 페이징 처리용
	@Select("select count(*) from my_coupon ${where}")
	int getTotal(@Param("where") String where, @Param("mno") String mno);
	
	// shop/mypage/mycoupon 페이징 처리용2
	@Select({"select cno, content, discount, dis_price, srat_expiry, end_expiry, dis_type from "
			+ "(select seq, tt.* from (select rownum seq, t.* from "
			+ "(select m.mcno, m.cno, m.mno, c.content, c.srat_expiry, c.end_expiry, c.discount, c.dis_price, c.dis_type from my_coupon m left join coupon c on m.cno = c.cno where m.mno = #{mno} ) t) "
			+ "tt where seq >= #{start}) where rownum <= #{end}"})
	List<MyCouponCouponDTO> getAllPaging(@Param("start") int start, @Param("end") int end, @Param("mno") int mno);
    
	@Update("")
	int mod();

	@Delete("delete from my_coupon where cno = #{dto2.cno}")
	MyCouponDTO getmyDel(@Param("cno") int cno);

	@Select("select * from my_coupon where mno = #{mno}")
	ArrayList<MyCouponDTO> getMyCoupon(@Param("mno") String mno);

	@Select("select count(*) from my_coupon where mno = #{mno}")
	int myCouponCnt(@Param("mno") String mno);

	@Select("select mc.mcno mcno, c.pno pno, c.content content, c.discount discount, c.dis_price dis_price, c.dis_type dis_type,"
			+ " c.srat_expiry srat_expiry, to_char(c.end_expiry,'YYYY-MM-DD') as end_expiry from my_coupon mc"
			+ " left join coupon c on mc.cno = c.cno where mc.mno = #{mno}")
	ArrayList<MyCouponCouponDTO> getCouponDetails(@Param("mno") String mno);

	@Delete("delete my_coupon where mno = #{mno} and mcno = #{mcno}")
	int deleteSelectedCoupon(@Param("mno") String mno,@Param("mcno") String mcno);

}