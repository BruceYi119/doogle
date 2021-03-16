package kr.co.doogle.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.doogle.dto.BasketDTO;
import kr.co.doogle.dto.BasketDeliveryDTO;
import kr.co.doogle.dto.BasketProductProdctOptionFileDTO;

@Mapper
public interface BasketMapper {

	@Select({
			"select b.*,p.price pprice,discount,earn,p.quantity stock,brand,p.name pname,p.pack_type,dis_yn,earn_yn,sel_yn,po.price oprice,po.name oname,f.fno,f.name fname,loc "
					+ "from basket b left join product p on b.pno = p.pno "
					+ "left join product_option po on b.pno=po.pno and b.pono=po.pono "
					+ "left join files f on REGEXP_SUBSTR(p.fno, '[^,]+', 1, 1) = f.fno "
					+ "where b.mno=#{mno} and sel_yn='y' order by b.bno,p.pack_type" })
	ArrayList<BasketProductProdctOptionFileDTO> getAllSellProduct(@Param("mno") int mno);

	@Select({
			"select b.*,p.price pprice,discount,earn,p.quantity stock,brand,p.name pname,pack_type,dis_yn,earn_yn,sel_yn,po.price oprice,po.name oname,f.fno,f.name fname,loc "
					+ "from basket b left join product p on b.pno = p.pno "
					+ "left join product_option po on b.pno=po.pno and b.pono=po.pono "
					+ "left join files f on REGEXP_SUBSTR(p.fno, '[^,]+', 1, 1) = f.fno "
					+ "where b.mno=#{mno} and pack_type='f' and sel_yn='y' and p.quantity>0 order by bno" })
	ArrayList<BasketProductProdctOptionFileDTO> getFrozenProduct(@Param("mno") int mno);

	@Select({
			"select b.*,p.price pprice,discount,earn,p.quantity stock,brand,p.name pname,pack_type,dis_yn,earn_yn,sel_yn,po.price oprice,po.name oname,f.fno,f.name fname,loc "
					+ "from basket b left join product p on b.pno = p.pno "
					+ "left join product_option po on b.pno=po.pno and b.pono=po.pono "
					+ "left join files f on REGEXP_SUBSTR(p.fno, '[^,]+', 1, 1) = f.fno "
					+ "where (pack_type='r' or pack_type='d') and b.mno=1 and sel_yn='y' and p.quantity>0 order by bno" })
	ArrayList<BasketProductProdctOptionFileDTO> getRoomProduct(@Param("mno") int mno);

	@Select({
			"select b.*,p.price pprice,discount,earn,p.quantity stock,brand,p.name pname,pack_type,dis_yn,earn_yn,sel_yn,po.price oprice,po.name oname,f.fno,f.name fname,loc "
					+ "from basket b left join product p on b.pno = p.pno "
					+ "left join product_option po on b.pno=po.pno and b.pono=po.pono "
					+ "left join files f on REGEXP_SUBSTR(p.fno, '[^,]+', 1, 1) = f.fno "
					+ "where b.mno=#{mno} and pack_type='c' and sel_yn='y' and p.quantity>0 order by bno" })
	ArrayList<BasketProductProdctOptionFileDTO> getColdProduct(@Param("mno") int mno);

	@Select({
			"select b.*,p.price pprice,discount,earn,p.quantity stock,brand,p.name pname,pack_type,dis_yn,earn_yn,sel_yn,po.price oprice,po.name oname,f.fno,f.name fname,loc "
					+ "from basket b left join product p on b.pno = p.pno "
					+ "left join product_option po on b.pno=po.pno and b.pono=po.pono "
					+ "left join files f on REGEXP_SUBSTR(p.fno, '[^,]+', 1, 1) = f.fno "
					+ "where b.mno=#{mno} and (sel_yn='n' or p.quantity=0) order by bno" })
	ArrayList<BasketProductProdctOptionFileDTO> getDisableProduct(@Param("mno") int mno);

	@Select("select mno,dno,addr,addr_detail,type,default_yn from delivery where mno=#{mno}")
	BasketDeliveryDTO deliveryInfo(@Param("mno") int mno);

	@Select("select count(*) from basket where pno=#{bdto.pno} and pono=#{bdto.pono} and mno=#{bdto.mno}")
	int dupChkBasket(@Param("bdto") BasketDTO bdto);

	@Select("select quantity from basket where pno=#{bdto.pno} and pono=#{bdto.pono} and mno=#{bdto.mno}")
	int cntQuantity(@Param("bdto") BasketDTO bdto);

	@Insert("insert into basket values(s_basket.nextval,#{bdto.mno}, #{bdto.pno}, #{bdto.pono}, #{bdto.quantity}, sysdate)")
	void addBasket(@Param("bdto") BasketDTO bdto);

	@Delete("delete from basket where mno = #{mno} and bno = #{bno}")
	int deleteBasket(@Param("mno") int mno, @Param("bno") int bno);

	@Update("update basket set quantity=#{bdto.quantity} where mno=#{bdto.mno} and bno=#{bdto.bno}")
	int updateQuantity(@Param("bdto") BasketDTO bdto, @Param("quantity") int quantity);

	@Update("update basket set quantity=#{quantity} where mno=#{mno} and bno=#{bno}")
	int chgQuantity(@Param("quantity") int quantity, @Param("mno") int mno, @Param("bno") int bno);

	@Select("select b.*, o.price oprice, o.name oname, p.name pname, p.brand brand, p.price pprice, p.discount discount,"
			+ " p.fno fno, f.name fname, f.loc loc from basket b left join product_option o on b.pono = o.pono"
			+ " left join product p on b.pno = p.pno left join files f on p.fno = f.fno "
			+ "where b.bno in(${bno}) and b.mno = #{mno} order by b.bno")
	ArrayList<BasketProductProdctOptionFileDTO> getBasketJoin(@Param("bno") String bno, @Param("mno") String mno);
}