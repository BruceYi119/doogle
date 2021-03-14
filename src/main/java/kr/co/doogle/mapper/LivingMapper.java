package kr.co.doogle.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.doogle.dto.LivingDTO;
import kr.co.doogle.dto.LivingProductProductOptionFileDTO;
import kr.co.doogle.dto.ProductProductOptionDTO;

@Mapper
public interface LivingMapper {
	@Insert("insert into living values(s_living.nextval,#{mno},#{pno},sysdate)")
	void addLiving(@Param("mno")int mno,@Param("pno") int pno);
	
	@Select("select l.*,price,brand,pname,f.fno,f.name fname,loc from living l left join product p on p.pno=l.pno left join files f on REGEXP_SUBSTR(p.fno, '[^,]+', 1, 1) = f.fno where l.mno=#{mno} order by lno")
	ArrayList<LivingProductProductOptionFileDTO> livingList(@Param("mno") int mno);
	
	@Delete("delete from living where mno = #{mno} and lno=#{lno}")
	void  deleteLiving(@Param("mno") int mno,@Param("lno") int lno);
	
	@Select("select count(*) from living where mno=#{mno} and pno=${pno}")
	int isOnTheList(@Param("mno") int mno,@Param("pno") int pno);

	@Select("select p.pno,brand,pname,p.price pprice,discount,dis_not,earn,earn_not,pono,po.price oprice,po.name oname from product p left join product_option po on p.pno=po.pno where p.pno=${pno}")
	ArrayList<ProductProductOptionDTO> basketPopup(@Param("pno") int pno);
}
