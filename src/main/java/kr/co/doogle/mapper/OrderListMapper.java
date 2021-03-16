package kr.co.doogle.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.doogle.dto.OrderListDTO;
import kr.co.doogle.dto.OrderListProductProductOptionDTO;

@Mapper
public interface OrderListMapper {

	@Select("select * from order_list where mno = #{mno}")
	ArrayList<OrderListDTO> getAll(@Param("mno") String mno);

	@Select("select f.name fname, f.loc floc, ol.pno pno, ol.pono pono, ol.pono pono, p.name pname, po.name poname, ol.quantity, p.price pprice, po.price poprice, p.discount discount"
			+ " from order_list ol left join product p on ol.pno = p.pno left join product_option po on ol.pono = po.pono left join files f on f.fno = p.fno "
			+ " where ol.mno = #{mno} and ol.ono = #{ono} order by ol.olno")
	ArrayList<OrderListProductProductOptionDTO> getSummDetail(@Param("mno") String mno, @Param("ono") String ono);

	@Select("select f.name fname, f.loc floc, ol.pno pno, ol.pono pono, p.name pname, po.name poname "
			+ "from order_list ol left join product p on ol.pno = p.pno left join product_option po on ol.pono = po.pono left join files f on f.fno = p.fno "
			+ "where ol.mno = #{mno} and ol.ono = #{ono} order by ol.olno")
	ArrayList<OrderListProductProductOptionDTO> getSumm(@Param("mno") String mno, @Param("ono") int ono);

	@Select("select f.name fname, f.loc floc, ol.pno pno, ol.pono pono, p.name pname, po.name poname from order_list ol left join product p on ol.pno = p.pno left join product_option po on ol.pono = po.pono left join files f on f.fno = p.fno where ol.mno = #{mno} and ol.ono = #{ono} and ol.writedate between '21/01/01' and '21/12/31' order by ol.olno")
	ArrayList<OrderListProductProductOptionDTO> getSumm2021(@Param("mno") String mno, @Param("ono") int ono);

	@Select("select f.name fname, f.loc floc, ol.pno pno, ol.pono pono, p.name pname, po.name poname from order_list ol left join product p on ol.pno = p.pno left join product_option po on ol.pono = po.pono left join files f on f.fno = p.fno where ol.mno = #{mno} and ol.ono = #{ono} and ol.writedate between '20/01/01' and '20/12/31' order by ol.olno")
	ArrayList<OrderListProductProductOptionDTO> getSumm2020(@Param("mno") String mno, @Param("ono") int ono);

	@Select("select f.name fname, f.loc floc, ol.pno pno, ol.pono pono, p.name pname, po.name poname from order_list ol left join product p on ol.pno = p.pno left join product_option po on ol.pono = po.pono left join files f on f.fno = p.fno where ol.mno = #{mno} and ol.ono = #{ono} and ol.writedate between '19/01/01' and '19/12/31' order by ol.olno")
	ArrayList<OrderListProductProductOptionDTO> getSumm2019(@Param("mno") String mno, @Param("ono") int ono);

	@Insert("insert into order_list(olno,mno,ono,pno,quantity) values(S_ORDER_LIST.nextval,#{mno},#{ono},#{pno},#{quantity})")
	int insertProductOrderList(@Param("mno") String mno, @Param("ono") int ono, @Param("pno") int pno,
			@Param("quantity") int quantity);

	@Insert("insert into order_list(olno,mno,ono,pno,pono,quantity) values(S_ORDER_LIST.nextval,#{mno},#{ono},#{pno},#{pono},#{quantity})")
	int insertOptionOrderList(@Param("mno") String mno, @Param("ono") int ono, @Param("pno") int pno,
			@Param("pono") int pono, @Param("quantity") int quantity);

}
