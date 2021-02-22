package kr.co.doogle.category;

import java.util.HashMap;

import javax.inject.Inject;

import kr.co.doogle.dto.CategoryDTO;
import kr.co.doogle.mapper.CategoryMapper;

public class Category {

	@Inject
	private CategoryMapper categoryMapper;
	@Inject
	private CategoryDTO dto;
	private HashMap<String, String> type = new HashMap();
	private HashMap<String, String[]> lv0 = new HashMap();
	private HashMap<String, String[]> lv1 = new HashMap();
	private HashMap<String, String[]> lv2 = new HashMap();
	private int[] lv = { 0, 1, 2, 3 };

	{
		type.put("p", "상품");
		type.put("o", "상품제안");
		type.put("q", "자주하는질문");
		type.put("t", "1:1문의");
		type.put("f", "파일");

		lv0.put("p", new String[]{ "채소", "과일·견과·쌀", "수산·해산·건어물", "정육·계란", "국·반찬·메인요리", "샐러드·간편식", "면·양념·오일", "생수·음료·우유·커피", "간식·과자·떡", "베이커리·치즈·델리", "건강식품", "생활용품·리빙", "뷰티·바디케어", "주방용품", "가전제품", "베이비·키즈", "반려동물", "컬리의 추천" });
		lv0.put("o", new String[]{ "신선식품", "정육/달걀", "가공식품", "양념/반찬", "Home Dining", "Deli/Bakery", "Daily+", "기타" });
		lv0.put("q", new String[]{ "회원문의", "주문/결제", "취소/교환/반품", "배송문의", "쿠폰/적립금", "서비스 이용 및 기타" });
		lv0.put("t", new String[]{ "배송지연/불만", "컬리패스 (무료배송)", "반품문의", "A/S문의", "환불문의", "주문결제문의", "회원정보문의", "취소문의", "교환문의", "상품정보문의", "기타문의" });
		lv0.put("f", new String[]{ "상품", "레시피", "1:1문의", "상품제안", "에코포장피드백" });

		lv1.put("채소", new String[]{ "고구마·감자·당근", "시금치·쌈채소·나물", "시금치·쌈채소·나물", "브로콜리·파프리카·양배추", "양파·대파·마늘·배추", "오이·호박·고추", "냉동·이색·간편채소", "콩나물·버섯" });
		lv1.put("과일·견과·쌀", new String[]{ "제철과일", "국산과일", "수입과일", "간편과일", "냉동·건과일", "견과류", "쌀·잡곡" });
		lv1.put("수산·해산·건어물", new String[]{ "제철수산", "생선류", "굴비·반건류", "오징어·낙지·문어", "새우·게·랍스터", "해산물·조개류", "수산가공품", "김·미역·해조류", "건어물·다시팩" });
		lv1.put("정육·계란", new String[]{ "국내산 소고기", "수입산 소고기", "돼지고기", "계란류", "닭·오리고기", "양념육·돈까스", "양고기" });
		lv1.put("국·반찬·메인요리", new String[]{ "국·탕·찌개", "밀키트·메인요리", "밑반찬", "김치·젓갈·장류", "두부·어묵·부침개", "베이컨·햄·통조림" });
		lv1.put("샐러드·간편식", new String[]{ "샐러드·닭가슴살", "도시락·밥류", "파스타·면류", "떡볶이·튀김·순대", "피자·핫도그·만두", "폭립·떡갈비·안주", "죽·스프·카레", "선식·시리얼" });
		lv1.put("면·양념·오일", new String[]{ "파스타·면류", "식초·소스·드레싱", "양념·액젓·장류", "양념·액젓·장류", "식용유·참기름·오일", "소금·설탕·향신료", "밀가루·가루·믹스" });
		lv1.put("생수·음료·우유·커피", new String[]{ "생수·탄산수", "음료·주스", "우유·두유·요거트", "커피", "차" });
		lv1.put("간식·과자·떡", new String[]{ "과자·스낵·쿠키", "초콜릿·젤리·캔디", "떡·한과", "아이스크림" });
		lv1.put("베이커리·치즈·델리", new String[]{ "식빵·빵류", "잼·버터·스프레드", "케이크·파이·디저트", "치즈", "델리", "올리브·피클" });
		lv1.put("건강식품", new String[]{ "영양제", "유산균", "홍삼·인삼·꿀", "건강즙·건강음료", "건강분말·건강환", "다이어트·이너뷰티", "유아동" });
		lv1.put("생활용품·리빙", new String[]{ "휴지·티슈", "여성·위생용품", "세제·청소용품", "화훼·인테리어소품", "의약외품·마스크", "생활잡화·문구" });
		lv1.put("뷰티·바디케어", new String[]{ "스킨케어", "구강·면도", "바디·제모", "헤어케어", "미용기기·소품" });
		lv1.put("주방용품", new String[]{ "주방소모품·잡화", "주방·조리도구", "냄비·팬·솥", "보관용기·텀블러", "식기·테이블웨어", "컵·잔·커피도구" });
		lv1.put("가전제품", new String[]{ "주방가전", "생활가전", "계절가전" });
		lv1.put("베이비·키즈", new String[]{ "분유·간편 이유식", "이유식 재료", "간식·음식·음료", "건강식품", "이유·수유용품", "기저귀·물티슈", "세제·위생용품", "스킨·구강케어", "완구·잡화류" });
		lv1.put("반려동물", new String[]{ "강아지 간식", "강아지 주식", "고양이 간식", "고양이 주식", "반려동물 용품", "배변·위생", "소용량·샘플" });
		lv1.put("컬리의 추천", new String[]{ "식단관리", "간편한 아침식사", "재구매 BEST", "3천원의 행복", "컬리마트", "1인 가구", "뚝딱! 간편식", "베이커리 맛집", "반찬가게", "키토제닉", "비건", "지속가능한 상품", "컬리가 만든 상품", "Kurly Only", "KF365", "1% Table" });

		lv2.put("컬리의 추천", new String[]{ "식단관리", "간편한 아침식사", "재구매 BEST", "3천원의 행복", "컬리마트", "1인 가구", "뚝딱! 간편식", "베이커리 맛집", "반찬가게", "키토제닉", "비건", "지속가능한 상품", "컬리가 만든 상품", "Kurly Only", "KF365", "1% Table" });
	}

	public void initCategory() {
		StringBuilder sb = new StringBuilder();
		String typeStr = type.keySet().toString();
		typeStr = typeStr.replace("[", "");
		typeStr = typeStr.replace("]", "");
		String[] typeStrArr = typeStr.split(",");
		for (int i = 0;i < typeStrArr.length;i++) {
			if (i == typeStrArr.length - 1)
				sb.append("'" + typeStrArr[i].trim() + "'");
			else
				sb.append("'" + typeStrArr[i].trim() + "', ");
		}
		int cnt = categoryMapper.checkInitCategory(sb.toString());

		if (cnt == 0) {
//			for (Entry<String, String> entry : type.entrySet()) {
//				dto.setName(entry.getValue());
//				dto.setType(entry.getKey());
//				dto.setLv(0);
//				categoryMapper.addCategory(dto);
//				int pctno = categoryMapper.getCtno(entry.getKey(), 0);
//
//				for (String v : lv0.get(entry.getKey())) {
//					dto.setName(v);
//					dto.setType(entry.getKey());
//					dto.setLv(1);
//					dto.setPctno(pctno);
//					categoryMapper.addCategoryLv(dto);
//				}
//			}
		}
	}

//	public static void main(String[] arsg) {
//		Category c = new Category();
//		System.out.println(Arrays.toString(c.lv1.get("p")));
//	}

}