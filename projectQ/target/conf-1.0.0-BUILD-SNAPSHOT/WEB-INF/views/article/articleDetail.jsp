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
<script>

	$('#article_sort').

	function modified_btn(){
	
		var selector = document.getElementById("article_sort");
		
		if(selector.options[selector.selectedIndex].text == '공지사항'){
			
			var i_option = document.createElement("option");
			i_option.text = "1:1문의";
			
			selelct.add(i_option);
		}
	
		document.getElementById("article_title").disabled = false;
		document.getElementById("article_intro").disabled = false;
		
		
	}

	function back_btn(){
		var frmObject  = document.frmArticle;
		
		frmObject.method="get";
		frmObject.action="${contextPath}/article/articleMain.do";
		frmObject.submit();
	}
</script>
</head>
<body>
<h3>상세내용</h3>
<form name="frmArticle" method="post" action="${contextPath}/article/modifiedArticle.do">	
	<div class="detail_table" style="width:650px;">
		<table>
			<tr>
				<td>문의사항 종류</td>
				<td>
				<select name="article_sort" id="article_sort">
					<option>${article.article_sort}</option>
					
					
				</select>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" value="${article.member_id}" name="member_id" id="member_id" disabled></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" value="${article.article_title }" name="article_title" id="article_title" size="30"  disabled></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="10" name="article_intro" id="article_intro" disabled>${article.article_intro}</textarea></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><input type="date" value="${article.article_creDate}" name="article_creDate" id="article_credate" /></td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td colspan="2">
				<c:if test="${memberInfo.member_id == article.member_id || memberInfo.member_id == 'admin'}" >
					<input type="button" value="수정하기" onclick="modified_btn()" />
					<input type="button" value="삭제하기" />
				</c:if>
					<input type="button" value=돌아가기 onclick="back_btn()" />
				</td>
			</tr>
		</table>
	</div>
</form>
</body>
</html>