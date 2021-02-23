package kr.co.doogle.category;

import java.util.HashMap;
import java.util.Map.Entry;

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

		lv2.put("식단관리", new String[]{ "샐러드", "클렌즈 주스", "닭가슴살/달걀", "도시락", "프로틴/보조제", "시리얼/선식/간식", "식단관리 채소" });
		lv2.put("간편한 아침식사", new String[]{ "베이커리·델리", "우유·커피·주스", "과일", "샐러드·간편식·스프", "선식·시리얼·그래놀라" });
		lv2.put("재구매 BEST", new String[]{ "신선식품", "가공식품", "반찬·간편식", "리빙·뷰티·펫" });
		lv2.put("3천원의 행복", new String[]{ "1천원 미만", "2천원 미만", "3천원 미만" });
		lv2.put("컬리마트", new String[]{ "라면·간편식", "김치·반찬", "간식·과자·시리얼", "유제품·아이스크림", "생수·음료·커피", "장류·양념·오일", "생활용품" });
		lv2.put("1인 가구", new String[]{ "한끼채소", "과일/쌀", "간편식/재료", "간식/음료", "생활용품" });
		lv2.put("뚝딱! 간편식", new String[]{ "전자레인지용", "에어프라이어용", "밀키트" });
		lv2.put("베이커리 맛집", new String[]{ "사층빵집", "리치몬드 과자점", "아우어베이커리", "빵공장띠에리", "더브레드블루", "무화당", "근대골목단팥빵", "밀도" });
		lv2.put("반찬가게", new String[]{ "정미경키친", "조선호텔김치", "스마일찬", "탐나는 밥상", "Everyday", "동광젓갈" });
		lv2.put("키토제닉", new String[]{ "키토인을 위한 간편식", "요리하는 키토인", "키토인을 위한 간식" });
		lv2.put("비건", new String[]{ "대체육·간편식", "대체유제품·음료", "샐러드", "시리얼·선식", "간식", "베이커리", "양념·소스", "생활·뷰티" });
		lv2.put("지속가능한 상품", new String[]{ "친환경", "ASC/MSC/GAP", "공정무역/동물복지" });
		lv2.put("컬리가 만든 상품", new String[]{ "Kurly`s", "일반 상품" });
		lv2.put("Kurly Only", new String[]{ "농산", "수산", "정육·계란", "간편식", "유제품", "가공식품", "건강식품", "리빙·펫" });
	}

	public void initCategory() {
		int cnt = categoryMapper.getTotal();	

		if (cnt == 0) {
			for (Entry<String, String[]> entry : lv0.entrySet()) {
				int i = 1;

				for (String v0 : entry.getValue()) {
					dto.setName(v0);
					dto.setType(entry.getKey());
					dto.setLv(0);
					dto.setIdx(i);
					categoryMapper.addCategory(dto);

					if (lv1.get(v0) != null) {
						int pctno = categoryMapper.getCtno(v0, 0);
						int j = 1;

						for (String v1 : lv1.get(v0)) {
							dto.setName(v1);
							dto.setType(entry.getKey());
							dto.setLv(1);
							dto.setIdx(j);
							dto.setPctno(pctno);
							categoryMapper.addChildCategory(dto);

							if (lv2.get(v1) != null) {
								int ppctno = categoryMapper.getCtno(v1, 1);
								int k = 1;

								for (String v2 : lv2.get(v1)) {
									dto.setName(v2);
									dto.setType(entry.getKey());
									dto.setLv(2);
									dto.setIdx(k);
									dto.setPctno(ppctno);
									categoryMapper.addChildCategory(dto);
									k++;
								}
							}

							j++;
						}
					}

					i++;
				}
			}
		}
	}

}