<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="article" value="${articleAllList}" />
    
     <%
     //치환 변수 선언합니다.
      pageContext.setAttribute("crcn", "\r\n"); //개행문자
      pageContext.setAttribute("br", "<br/>"); //br 태그
	 %>
<html>
<head>
</head>
<body>
<div class="detail_QnA" >
	<c:if test="${isLogOn == true}">
	<div class="g_btn">
		<c:if test="${memberInfo.member_id == 'admin'}">
			<input type="button" value="삭제하기" onclick="">
		</c:if>
		<input type="button" value="글쓰기" onclick="" />
	</div>
	</c:if>
	<table>
		<tr class="head">
			<td style="width:80px;">글종류</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일시</td>
		</tr>
		<c:choose>
			<c:when test="${empty article} }">
				<tr>
					<td colspan="4">
						<p>조회된 QnA가 없습니다.</p>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="item" items="${article}" begin="1" end="15">
					<tr>
						<td><span>${item.article_sort}<span></td>
						<td class="fiexd_title"><a href="${contextPath}/article/articleDetail.do?article_id=${item.article_id}">${item.article_title}</a></td>
						<td class="fiexd_writer">${item.member_id}</td>
						<td class="fiexd_date">${item.article_creDate}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>
</body>
</html>