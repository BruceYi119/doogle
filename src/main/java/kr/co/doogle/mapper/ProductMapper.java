package kr.co.doogle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.doogle.dto.ProductDTO;

@Mapper
public interface ProductMapper {

	@Select({"select pno, price, discount, earn, ctno, ctno1, ctno2, quantity, name, brand, subject, sel_unit, weight, "
			+ "pack_type, info, dis_yn, earn_yn, only_yn, od_yn, fno, sel_yn, writedate from "
			+ "(select seq, tt.* from (select rownum seq, t.* from "
			+ "(select * from product ${where} order by writedate desc) t) tt where seq >= #{start}) where rownum <= #{end}"})
	List<ProductDTO> getAll(@Param("start") int start, @Param("end") int end, @Param("where") String where, @Param("ctno") String ctno,  @Param("ctno1") String ctno1, @Param("ctno2") String ctno2);

	@Select("select count(*) from product ${where}")
	int getTotal(@Param("where") String where, @Param("ctno") String ctno, @Param("ctno1") String ctno1, @Param("ctno2") String ctno2);

	@Insert({"insert into product("
			+ "pno, brand, name, subject, sel_unit, weight, pack_type, info, price, discount, dis_yn, earn, earn_yn, ctno, ctno1, ctno2, only_yn, od_yn, fno, quantity, sel_yn) "
			+ "values(s_product.nextval, #{dto.brand}, #{dto.name}, #{dto.subject}, #{dto.sel_unit}, #{dto.weight}, #{dto.pack_type}, #{dto.info}, #{dto.price}, #{dto.discount}, "
			+ "#{dto.dis_yn}, #{dto.earn}, #{dto.earn_yn}, #{dto.ctno}, #{dto.ctno1}, #{dto.ctno2}, #{dto.only_yn}, #{dto.od_yn}, #{dto.fno}, #{dto.quantity}, #{dto.sel_yn})"})
	int add(@Param("dto") ProductDTO dto);

}