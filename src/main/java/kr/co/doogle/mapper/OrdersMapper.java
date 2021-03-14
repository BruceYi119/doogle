package kr.co.doogle.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.doogle.dto.OrdersDTO;
import kr.co.doogle.dto.OrdersPaymentDTO;

@Mapper
public interface OrdersMapper {
	
	@Select("select S_ORDERS.nextval from dual")
	int getSeq();
	
	@Select("select * from orders where mno = #{mno} and ono = #{ono}")
	OrdersDTO getOne(@Param("mno") String mno,@Param("ono") String ono);
	
	@Select("select o.ono ono, o.type type, o.writedate writedate, p.payment payment from orders o left join payment p on o.ono = p.ono where o.mno = #{mno} order by ono")
	ArrayList<OrdersPaymentDTO> getSumm(@Param("mno") String mno);
	
	@Select("select o.ono ono, o.type type, o.writedate writedate, p.payment payment from orders o left join payment p on o.ono = p.ono where o.mno = #{mno} and o.writedate between '21/01/01' and '21/12/31' order by ono")
	ArrayList<OrdersPaymentDTO> getSumm2021(@Param("mno") String mno);
	
	@Select("select o.ono ono, o.type type, o.writedate writedate, p.payment payment from orders o left join payment p on o.ono = p.ono where o.mno = #{mno} and o.writedate between '20/01/01' and '20/12/31' order by ono")
	ArrayList<OrdersPaymentDTO> getSumm2020(@Param("mno") String mno);
	
	@Select("select o.ono ono, o.type type, o.writedate writedate, p.payment payment from orders o left join payment p on o.ono = p.ono where o.mno = #{mno} and o.writedate between '19/01/01' and '19/12/31' order by ono")
	ArrayList<OrdersPaymentDTO> getSumm2019(@Param("mno") String mno);
	
	@Insert("insert into orders(ono,mno) values(#{ono},#{mno})")
	int insertOrders(@Param("ono") int sno,@Param("mno") String mno);
	
	@Update("update orders set type = 'c' where ono = #{ono} and mno = #{mno}")
	int cancelOrder(@Param("ono") String ono,@Param("mno") String mno);
}
