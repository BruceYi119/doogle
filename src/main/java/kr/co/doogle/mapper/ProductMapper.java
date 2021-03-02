package kr.co.doogle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.doogle.dto.ProductDTO;

@Mapper
public interface ProductMapper {

	@Select({"select pno, price, discount, earn, ctno, ctno1, ctno2, quantity, name, brand, psubject, "
			+ "sel_unit, weight, pack_type, info, dis_not, earn_not, only_yn, od_yn, fno, sel_not, writedate from "
			+ "(select seq, tt.* from (select rownum seq, t.* from "
			+ "(select * from category ${param3} order by type asc, lv asc, idx asc) t) tt where seq >= #{param1}) where rownum <= #{param2}"})
	List<ProductDTO> getAll(@Param("start") int start, @Param("end") int end, @Param("where") String where, @Param("ctno") int ctno,  @Param("ctno1") int ctno1, @Param("ctno2") int ctno2);

	@Select("select count(*) from category #{param1}")
	int getTotal(@Param("where") String where, @Param("ctno") int ctno, @Param("ctno1") int ctno1, @Param("ctno2") int ctno2);

}