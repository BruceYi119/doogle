package kr.co.doogle.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.doogle.dto.LivingProductProductOptionFileDTO;
import kr.co.doogle.dto.ProductProductOptionDTO;

@Mapper
public interface LivingMapper {
	@Insert("insert into living values(s_living.nextval,#{mno},#{pno},sysdate)")
	int addLiving(@Param("mno")int mno,@Param("pno") int pno);
	
	@Select({"select l.*,p.price pprice,brand,p.name pname,discount,dis_yn,earn,earn_yn,pono,po.price oprice,po.name oname,f.fno,f.name fname,loc "
			+ "from living l left join product p on p.pno=l.pno "
			+ "left join product_option po on p.pno=po.pno "
			+ "left join files f on REGEXP_SUBSTR(p.fno, '[^,]+', 1, 1) = f.fno "
			+ "where l.mno=#{mno} order by lno"})
	ArrayList<LivingProductProductOptionFileDTO> livingList(@Param("mno") int mno);
	
	@Delete("delete from living where mno = #{mno} and lno=#{lno}")
	void  deleteLiving(@Param("mno") int mno,@Param("lno") int lno);
	
	@Select("select count(*) from living where mno=#{mno} and pno=#{pno}")
	int isOnTheList(@Param("mno") int mno,@Param("pno") int pno);

	
	@Select("select p.pno,brand,p.name pname,p.price pprice,discount,dis_yn,earn,earn_yn,pono,po.price oprice,po.name oname from product p left join product_option po on p.pno=po.pno where p.pno=#{pno}") 
	ProductProductOptionDTO productList(@Param("pno") int pno);
	
	
	@Select("select count(*) from living where mno=#{mno}")
	int getTotal(@Param("mno") int mno);
	
	@Select({"select lno,mno,pno,pprice,brand,pname,discount,dis_yn,earn,earn_yn,pono,oprice,oname,fno, fname,loc from "
			+ "(select seq, tt.* from (select rownum seq, t.* from "
			+ "(select  lno,l.mno,l.pno,p.price pprice,brand,p.name pname,discount,dis_yn,earn,earn_yn,pono,po.price oprice,po.name oname,f.fno,f.name fname,loc "
			+ "from living l left join product p on p.pno=l.pno "
			+ "	left join product_option po on p.pno=po.pno "
			+ "	left join files f on REGEXP_SUBSTR(p.fno, '[^,]+', 1, 1) = f.fno "
			+ " where l.mno=#{mno} order by lno) t) tt where seq >= #{start}) where rownum <= #{end}"})
	List<LivingProductProductOptionFileDTO> getAllPaging(@Param("start") int start, @Param("end") int end, @Param("mno") int mno);

}
