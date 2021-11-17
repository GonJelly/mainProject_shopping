<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  

<div id="ad_main_banner">
	<ul class="bjqs">	 	
	  <li><img width="775" height="145" src="${contextPath}/resources/image/main_banner1.jpg"></li>
		<li><img width="775" height="145" src="${contextPath}/resources/image/main_banner2.jpg"></li>
		<li><img width="775" height="145" src="${contextPath}/resources/image/main_banner3.jpg"></li> 
	</ul>
</div>
<div class="main_book">
   <c:set  var="goods_count" value="0" />
	<h3>빅사이즈</h3>
	<c:forEach var="item" items="${goodsMap.bigsize }">
	   <c:set  var="goods_count" value="${goods_count+1 }" />
		<div class="book">
			<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
			<img class="link"  src="${contextPath}/resources/image/1px.gif"> 
			</a>
				<img width="152" height="194" 
				     src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">

			<div class="title">${item.goods_title }</div>
			<div class="price">
		  	   <fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
		  	   <fmt:formatNumber  value="${item.goods_price*0.9}" type="number" var="goods_sales_price" />
		          <h5>${goods_price}원</h5> <span><h6>${goods_sales_price}원</h6></span>
			</div>
		</div>
	   <c:if test="${goods_count==10   }">
         <div class="book">
           <font size=20> <a href="#">more</a></font>
         </div>
     </c:if>
  </c:forEach>
</div>
<div class="clear"></div>
<div id="ad_sub_banner">
	<img width="770" height="117" src="${contextPath}/resources/image/sub_banner1.jpg">
</div>
<div class="main_book" >
<c:set  var="goods_count" value="0" />
	<h3>상의</h3>
	<c:forEach var="item" items="${goodsMap.top }" >
	   <c:set  var="goods_count" value="${goods_count+1 }" />
		<div class="book">
		  <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
	       <img class="link"  src="${contextPath}/resources/image/1px.gif"> 
	      </a>
		 <img width="152" height="194" 
				src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
		<div class="title">${item.goods_title }</div>
		<div class="price">
		  	   <fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
		  	   <fmt:formatNumber  value="${item.goods_sales_price}" type="number" var="goods_sales_price" />
		       <h5>${goods_price}원</h5> <span><h6>${goods_sales_price}원</h6></span>
		  </div>
	</div>
	 <c:if test="${goods_count==15   }">
     <div class="book">
       <font size=20> <a href="#">more</a></font>
     </div>
   </c:if>
	</c:forEach>
</div>

<div class="clear"></div>
<div id="ad_sub_banner">
	<img width="770" height="117" src="${contextPath}/resources/image/sub_banner2.jpg">
</div>


<div class="main_book" >
<c:set  var="goods_count" value="0" />
	<h3>신발</h3>
	<c:forEach var="item" items="${goodsMap.shoes }" >
	   <c:set  var="goods_count" value="${goods_count+1 }" />
		<div class="book">
		  <a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
	       <img class="link"  src="${contextPath}/resources/image/1px.gif"> 
	      </a>
		 <img width="152" height="194" 
				src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
		<div class="title">${item.goods_title }</div>
		<div class="price">
		  	   <fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
		  	   <fmt:formatNumber  value="${item.goods_sales_price}" type="number" var="goods_sales_price" />
		          <h5>${goods_price}원</h5> <span><h6>${goods_sales_price}원</h6></span>
		  </div>
	</div>
	 <c:if test="${goods_count==15   }">
     <div class="book">
       <font size=20> <a href="#">more</a></font>
     </div>
   </c:if>
	</c:forEach>
</div>
