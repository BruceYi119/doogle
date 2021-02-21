package kr.co.doogle.category;

import java.util.ArrayList;
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
	private ArrayList<Integer> lv = new ArrayList();

	{
		type.put("p", "상품");
		type.put("pp", "상품제안");
		type.put("q", "자주하는질문");
		type.put("qq", "1:1문의");
		type.put("f", "파일");

		lv.add(0);
		lv.add(1);
		lv.add(2);
	}

	public void initCategory() {
		String sql = "insert into category(ctno, name, lv, type) values(s_category.nextval, #{dto.name}, #{dto.lv}, #{dto.type})";
		for (Entry<String, String> entry : type.entrySet()) {
			dto.setName(entry.getValue());
			dto.setType(entry.getKey());
			dto.setLv(0);
			categoryMapper.addCategory(sql, dto);
		}
	}

}