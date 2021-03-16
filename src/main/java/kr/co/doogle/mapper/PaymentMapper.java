package kr.co.doogle.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.doogle.dto.PaymentDTO;
import kr.co.doogle.dto.PaymentMemberDTO;

@Mapper
public interface PaymentMapper {
	
	@Select("select p.pmno pmno, p.mno mno, p.ono ono, p.type type, p.payment payment, p.saving saving,"
			+ " p.writedate writedate, p.delivery_price deliveryPrice,"
			+ " p.product_dis_price productDisPrice, p.coupon_dis_price couponDisPrice,"
			+ " p.saving_price savingPrice, p.product_total_price productTotalPrice,"
			+ " p.card_name cardName, p.card_month cardMonth, m.id id, m.name name,"
			+ " m.phone phone from payment p left join member m on p.mno = m.mno order by p.pmno")
	ArrayList<PaymentMemberDTO> getAdminPayment();
	
	@Select("select writedate, type,payment,saving,product_total_price productTotalPrice,delivery_price deliveryPrice,"
			+ "product_dis_price productDisPrice, coupon_dis_price couponDisPrice, saving_price savingPrice,"
			+ " card_name cardName, card_month cardMonth "
			+ "from payment where mno = #{mno} and ono = #{ono}")
	PaymentDTO getOne(@Param("mno") String mno,@Param("ono") String ono); 
	
	@Insert("insert into payment(pmno,mno,ono,type,payment,saving,"
			+ "product_total_price,delivery_price,product_dis_price,coupon_dis_price,saving_price,card_name,card_month) "
			+ "values(S_PAYMENT.nextval,#{mno},#{ono},#{type},#{payment},#{saving},"
			+ "#{productTotalPrice},#{deliveryPrice},#{productDisPrice},#{couponDisPrice},#{savingPrice},#{cardName},#{cardMonth})")
	int insertPayment(@Param("mno") String mno,@Param("ono") int ono,@Param("type") String type,@Param("payment") String payment,@Param("saving") String saving,
			@Param("productTotalPrice") String productTotalPrice,@Param("deliveryPrice") String deliveryPrice,
	@Param("productDisPrice") String productDisPrice,
	@Param("couponDisPrice") String couponDisPrice,
	@Param("savingPrice") String savingPrice,
	@Param("cardName") String cardName,
	@Param("cardMonth") String cardMonth
	);
}
