<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="articleQnA" value="${articleMap.QnA}" />
<c:set var="articleNotice" value="${articleMap.Notice}" />
<c:set var="articleOneAndOne" value="${articleMap.OneAndOne}" />

     <%
     //치환 변수 선언합니다.
      pageContext.setAttribute("crcn", "\r\n"); //개행문자
      pageContext.setAttribute("br", "<br/>"); //br 태그
	 %>
<html>
<head>
<script>
	function frm_article(){
		var formObj=document.createElement("form");
		
		document.body.appendChild(formObj);
	    formObj.method="post";
	    formObj.action="${contextPath}/article/articleForm.do";
	    formObj.submit();
	}
</script>
</head>
<body>
<div class="container">
		<ul class="tabs">
			<li><a href="#tab1">QnA</a></li>
			<li><a href="#tab2">공지사항</a></li>
			<li><a href="#tab3">1:1문의</a></li>
		</ul>
		<div class="tab_container">
			<div class="tab_content" id="tab1">
				<div class="detail_QnA" >
					<c:if test="${isLogOn == true}">
						<div class="g_btn">
							<input type="button" value="글쓰기" onclick="frm_article()" />
						</div>
					</c:if>
					<table>
						<tr class="head">
							<td style="width:65px;">글종류</td>
							<td class="fiexd_title">제목</td>
							<td class="fiexd_writer">작성자</td>
							<td class="fiexd_date">작성일시</td>
							<c:if test="${memberInfo.member_id == 'admin'}">
								<td style="width:30px;">삭제</td>
							</c:if>
						</tr>
						<c:choose>
							<c:when test="${empty articleQnA}">
								<tr>
									<td colspan="4">
										<p>조회된 QnA가 없습니다.</p>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="item1" items="${articleQnA}" begin="1" end="15">
									<tr>
										<td><span id="sort">${item1.article_sort}</span></td>
										<td><a href="${contextPath}/article/articleDetail.do?article_id=${item1.article_id}">${item1.article_title}</a></td>
										<td>${item1.member_id}</td>
										<td>${item1.article_creDate}</td>
										<c:if test="${memberInfo.member_id == 'admin'}">
											<td><input type="button" value="삭제" onclick="btn_delete()"></td>
										</c:if>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
			<div class="tab_content" id="tab2">
				<div class="detail_QnA" >
					<c:if test="${isLogOn == true}">
						<div class="g_btn">
							<input type="button" value="글쓰기" onclick="frm_article()" />
						</div>
					</c:if>
					<table>
						<tr class="head">
							<td style="width:70px;">글종류</td>
							<td class="fiexd_title">제목</td>
							<td class="fiexd_writer">작성자</td>
							<td class="fiexd_date">작성일시</td>
							<c:if test="${memberInfo.member_id == 'admin'}">
								<td style="width:30px;">삭제</td>
							</c:if>
						</tr>
						<c:choose>
							<c:when test="${empty articleNotice}">
								<tr>
									<td colspan="4">
										<p>조회된 공지사항이없습니다.</p>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="item2" items="${articleNotice}" begin="1" end="15">
									<tr>
										<td><span id="sort">${item2.article_sort}</span></td>
										<td><a href="${contextPath}/article/articleDetail.do?article_id=${item2.article_id}">${item2.article_title}</a></td>
										<td>${item2.member_id}</td>
										<td>${item2.article_creDate}</td>
										<c:if test="${memberInfo.member_id == 'admin'}">
											<td><input type="button" value="삭제" onclick="btn_delete()"></td>
										</c:if>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
			<div class="tab_content" id="tab3">
				<div class="detail_QnA" >
					<c:if test="${isLogOn == true}">
						<div class="g_btn">
							<input type="button" value="글쓰기" onclick="frm_article()" />
						</div>
					</c:if>
					<table>
						<tr class="head">
							<td style="width:65px;">글종류</td>
							<td class="fiexd_title">제목</td>
							<td class="fiexd_writer">작성자</td>
							<td class="fiexd_date">작성일시</td>
							<c:if test="${memberInfo.member_id == 'admin'}">
								<td style="width:30px;">삭제</td>
							</c:if>
						</tr>
						<c:choose>
							<c:when test="${empty articleOneAndOne}">
								<tr>
									<td colspan="4">
										<p>조회된 문의사항이 없습니다.</p>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="item3" items="${articleOneAndOne}" begin="1" end="15">
									<tr>
										<td><span id="sort">${item3.article_sort}</span></td>
										<td><a href="${contextPath}/article/articleDetail.do?article_id=${item3.article_id}">${item3.article_title}</a></td>
										<td>${item3.member_id}</td>
										<td>${item3.article_creDate}</td>
										<c:if test="${memberInfo.member_id == 'admin'}">
											<td><input type="button" value="삭제" onclick="btn_delete()"></td>
										</c:if>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
		</div>
</div>
</body>
</html>