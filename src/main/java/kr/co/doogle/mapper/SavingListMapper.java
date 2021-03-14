package kr.co.doogle.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface SavingListMapper {
	
	@Insert("insert into saving_list(svlno,svno,mno,credit) values(S_SAVING_LIST.nextval,#{svno},#{mno},#{creditEarned})")
	int insertOne(@Param("svno") int svno,@Param("mno") String mno,@Param("creditEarned") String creditEarned);

}
