package kr.co.doogle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.doogle.dto.SavingDTO;
import kr.co.doogle.dto.SavingListDTO;

@Mapper
public interface SavingListMapper {
	
	@Insert("insert into saving_list(svlno,svno,mno,credit) values(S_SAVING_LIST.nextval,#{svno},#{mno},#{creditEarned})")
	int insertOne(@Param("svno") int svno,@Param("mno") String mno,@Param("creditEarned") String creditEarned);

	// 특정 회원의 saving_list 테이블에서 가장 빠른 기간내에 소멸 예정할 쿠폰의 만료날짜 
	@Select("select to_char( min(expiry), 'yy-mm-dd' ) from saving_list where mno = #{mno}")
	String exp(@Param("mno") int mno);
	
	// shop/mypage/mysaving 페이징 처리용
	@Select("select count(*) from saving_list ${where}")
	int getTotal(@Param("where") String where, @Param("mno") String mno);
	
	// shop/mypage/mysaving 페이징 처리용2
	@Select({"select mno, olno, credit, expiry, type, writedate from "
			+ "(select seq, tt.* from (select rownum seq, t.* from "
			+ "(select * from saving_list where mno = #{mno}) t) "
			+ "tt where seq >= #{start}) where rownum <= #{end}"})
	List<SavingListDTO> getAllPaging(@Param("start") int start, @Param("end") int end, @Param("mno") int mno);
	
	// shop/mypage/mysaving 페이징 처리용3
	@Select("select count(*) from saving_list where mno = #{mno}")
	int getSavingListCnt(@Param("mno") int mno);

	
}
