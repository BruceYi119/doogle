package kr.co.doogle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.doogle.dto.NextGradeDTO;

@Mapper
public interface GradeMapper {

	@Select("select pmno,m.mno, id,ono,type,payment,saving,p.writedate, "
			+ "extract(month from p.writedate) as paymentdate "
			+ "from payment p, member m where m.mno=p.mno and id= #{id} order by writedate desc")
	List<NextGradeDTO> getNext(@Param("id") String id);

}