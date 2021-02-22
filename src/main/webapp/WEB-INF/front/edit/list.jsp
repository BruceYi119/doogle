<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h1>리스트</h1>
<c:forEach items="${list}" var="dto">
<div>${dto.con}</div>
</c:forEach>