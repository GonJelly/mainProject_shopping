<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
</head>
<body>
<h3>문의사항 작성</h3>
<form name="frmArticle" method="post" action="${contextPath}/article/addArticle.do">
	<div class="detail_table" style="width:650px;">
		<table>
			<tr>
				<td>문의사항 종류</td>
				<td>
				<select name="article_sort">
					<option selected>1:1문의</option>
					<option>QnA</option>
					<option>공지사항</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" value="${memberInfo.member_id}" name="member_id" id="member_id" disabled></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="article_title" id="article_title" size="30"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="10" name="article_intro" name="article_intro" id="article_intro" ></textarea></td>
			</tr>
			<tr>
				<td>
				<td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="작성완료">
					<input type="reset" value="초기화">
				</td>
			</tr>
		</table>
	</div>
</form>
</body>
</html>