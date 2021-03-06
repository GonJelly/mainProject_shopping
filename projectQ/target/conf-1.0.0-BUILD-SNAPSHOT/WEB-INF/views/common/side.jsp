<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
	
<nav>
<ul>
<c:choose>
<c:when test="${side_menu=='admin_mode' }">
   <li>
		<H3>주요기능</H3>
		<ul>
			<li><a href="${contextPath}/admin/goods/adminGoodsMain.do">상품관리</a></li>
			<li><a href="${contextPath}/admin/order/adminOrderMain.do">주문관리</a></li>
			<li><a href="${contextPath}/admin/member/adminMemberMain.do">회원관리</a></li>
			<li><a href="#">배송관리</a></li>
			<li><a href="#">게시판관리</a></li>
		</ul>
	</li>
</c:when>
<c:when test="${side_menu=='my_page' }">
	<li>
		<h3>주문내역</h3>
		<ul>
			<li><a href="${contextPath}/mypage/listMyOrderHistory.do">주문내역/배송 조회</a></li>
			<li><a href="#">반품/교환 신청 및 조회</a></li>
			<li><a href="#">취소 주문 내역</a></li>
			<li><a href="#">세금 계산서</a></li>
		</ul>
	</li>
	<li>
		<h3>정보내역</h3>
		<ul>
			<li><a href="${contextPath}/mypage/myDetailInfo.do">회원정보관리</a></li>
			<li><a href="#">나의 주소록</a></li>
			<li><a href="#">개인정보 동의내역</a></li>
			<li><a href="#">회원탈퇴</a></li>
		</ul>
	</li>
</c:when>
<c:otherwise>
	<li>
		<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;빅사이즈</h3>
		<ul>
			<li><a href="${contextPath}/goods/goodsList.do?goods_sort=모자">모자</a></li>
			<li><a href="${contextPath}/goods/goodsList.do?goods_sort=상의" >상의</a></li>
			<li><a href="${contextPath}/goods/goodsList.do?goods_sort=바지" >하의</a></li>
			<li><a href="${contextPath}/goods/goodsList.do?goods_sort=액세서리">악세사리</a></li>
			<li><a href="${contextPath}/goods/goodsList.do?goods_sort=신발">신발</a></li>
			<li><a href="${contextPath}/goods/goodsList.do?goods_sort=점퍼">점퍼</a></li>
		</ul>
	</li>
	<li>
		<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;베스트</h3>
		<ul>
			<li><a href="#">세일상품</a></li>
			<li><a href="#">New신상품</a></li>
			<li><a href="#">가방</a></li>
			<li><a href="#">홈트용품</a></li>
		</ul>
	</li>
 </c:otherwise>
</c:choose>	
</ul>
</nav>
<div class="clear"></div>
<div id="banner">
	<a href="#"><img width="190" height="163" src="${contextPath}/resources/image/n-pay.jpg"> </a>
</div>
<DIV id="notice">
	<H2><a href="${contextPath}/article/articleMain.do">문의사항</a>
	<A href="${contextPath}/article/articleMain.do" style="float:right;"> <IMG  src="${contextPath}/resources/image/btn_more_see.jpg">  </A>
	</H2>
	<UL>
	<c:forEach  var="item" items="${articleList}" begin="1" end="7" step="1">
		<li><a href="${contextPath}/article/articleDetail.do?article_id=${item.article_id}">${item.article_title}</a></li>
	</c:forEach>
	</ul>
</div>


<div id="banner">
	<a href="#"><img width="190" height="362" src="${contextPath}/resources/image/side_banner1.jpg"></a>
</div>
<div id="banner">
	<a href="#"><img width="190" height="104" src="${contextPath}/resources/image/call_center_logo.jpg"></a>
</div>
<div id="banner">
	<a href="#"><img width="190" height="79" src="${contextPath}/resources/image/QnA_logo.jpg"></a>
</div>
</html>