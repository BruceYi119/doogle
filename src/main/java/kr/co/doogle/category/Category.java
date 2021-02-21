package kr.co.doogle.category;

import java.util.HashMap;

public class Category {

	private HashMap<String, String> type = new HashMap();

	{
		type.put("p", "상품");
		type.put("pp", "상품제안");
		type.put("p", "자주하는질문");
		type.put("qq", "1:1문의");
		type.put("f", "파일");
	}

}