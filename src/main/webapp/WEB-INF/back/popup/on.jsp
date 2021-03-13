<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<input type="hidden" name=puno value="${dto.puno}"/>
<table class="table product-mod">
	<tbody>
		<tr>
			<td class="pop_con">${dto.content}</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td class="text-center" align="center">
				<button type="button" class="btn btn-success" onclick="window.close();">닫기</button>
			</td>
		</tr>
	</tfoot>
</table>
