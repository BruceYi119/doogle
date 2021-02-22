<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form action="/test/add">
	<input type="text" name="tno" />
	<textarea id="summernote" name="con"></textarea>
	<button type="submit">서브밋</button>
</form>