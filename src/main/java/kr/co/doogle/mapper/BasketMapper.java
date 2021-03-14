package kr.co.doogle.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Select;

import kr.co.doogle.dto.BasketDTO;
import kr.co.doogle.dto.BasketProductDTO;
import kr.co.doogle.dto.BasketProductProdctOptionFileDTO;

@Mapper
public interface BasketMapper {
	
	//헨리 추가 mapper
	
	@Select("select b.*, o.price oprice, o.name oname, p.name pname, p.brand brand, p.price pprice, p.discount discount,"
			+ " p.fno fno, f.name fname from basket b left join product_option o on b.pono = o.pono"
			+ " left join product p on b.pno = p.pno left join files f on p.fno = f.fno "
			+ "where b.bno in (25,27,35,36) and b.mno = #{mno} order by b.writedate")
	ArrayList<BasketProductProdctOptionFileDTO> getBasketJoin(@Param("mno") String mno); //@Param("bnos") int bnos, 
	
	@Delete("delete from basket where pno = #{pno} and mno = #{mno}")
	int deleteProductOrders(@Param("pno") int pno,@Param("mno") String mno);
	
	@Delete("delete from basket where pono = #{pono} and mno = #{mno}")
	int deleteOptionOrders(@Param("pono") int pono,@Param("mno") String mno);
}

