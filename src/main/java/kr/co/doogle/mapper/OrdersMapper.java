package kr.co.doogle.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.doogle.dto.OrdersDTO;
import kr.co.doogle.dto.OrdersMemberDTO;
import kr.co.doogle.dto.OrdersPaymentDTO;

@Mapper
public interface OrdersMapper {
	
	@Select("select S_ORDERS.nextval from dual")
	int getSeq();
	
	@Select("select count(*) from orders ${where}")
	int getTotal (@Param("where") String where,@Param("ono") Integer ono);
	
	@Select("select * from orders where mno = #{mno} and ono = #{ono}")
	OrdersDTO getOne(@Param("mno") String mno,@Param("ono") String ono);
	
	@Select("select o.ono ono, o.mno mno, o.type type, o.writedate writedate, m.id id, m.name name, m.phone phone from orders o left join member m on o.mno = m.mno order by o.writedate")
	ArrayList<OrdersMemberDTO> getAdminOrders();
	
	@Select("select o.ono ono, o.type type, o.writedate writedate, pm.payment payment from orders o left join payment pm on o.ono = pm.ono where o.mno = #{mno} order by ono")
	ArrayList<OrdersPaymentDTO> getSumm(@Param("mno") String mno);
	
	@Select("select o.ono ono, o.type type, o.writedate writedate, pm.payment payment from orders o left join payment pm on o.ono = pm.ono where o.mno = #{mno} and o.writedate between '21/01/01' and '21/12/31' order by o.ono")
	ArrayList<OrdersPaymentDTO> getSumm2021(@Param("mno") String mno);
	
	@Select("select o.ono ono, o.type type, o.writedate writedate, pm.payment payment from orders o left join payment pm on o.ono = pm.ono where o.mno = #{mno} and o.writedate between '20/01/01' and '20/12/31' order by o.ono")
	ArrayList<OrdersPaymentDTO> getSumm2020(@Param("mno") String mno);
	
	@Select("select o.ono ono, o.type type, o.writedate writedate, pm.payment payment from orders o left join payment pm on o.ono = pm.ono where o.mno = #{mno} and o.writedate between '19/01/01' and '19/12/31' order by o.ono")
	ArrayList<OrdersPaymentDTO> getSumm2019(@Param("mno") String mno);
	
	@Insert("insert into orders(ono,mno,product_cnt) values(#{ono},#{mno},#{product_cnt})")
	int insertOrders(@Param("ono") int sno,@Param("mno") String mno,@Param("product_cnt") int product_cnt);
	
	@Update("update orders set type = 'c' where ono = #{ono} and mno = #{mno} and writedate = sysdate")
	int cancelOrder(@Param("ono") String ono,@Param("mno") String mno);
}
