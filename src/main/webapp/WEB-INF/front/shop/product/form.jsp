<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form action="/shop/product/insert">
	<input name="name" />
	<textarea id="summernote" name="con"></textarea>
	<button type="submit">서브밋</button>
</form>