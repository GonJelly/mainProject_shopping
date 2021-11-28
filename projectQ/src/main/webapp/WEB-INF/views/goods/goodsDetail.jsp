<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" 	isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="goods"  value="${goodsMap.goodsVO}"  />
<c:set var="imageList"  value="${goodsMap.imageList }"  />
<c:set var="article" value="${goodsMap.articleList}" />

 <%
     //치환 변수 선언합니다.
      pageContext.setAttribute("crcn", "\r\n"); //개행문자
      pageContext.setAttribute("br", "<br/>"); //br 태그
%>  
<html>
<head>
<style>
#layer {
	z-index: 2;
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
}

#popup {
	z-index: 3;
	position: fixed;
	text-align: center;
	left: 50%;
	top: 45%;
	width: 300px;
	height: 200px;
	background-color: #ccffff;
	border: 3px solid #87cb42;
}

#close {
	z-index: 4;
	float: right;
}
</style>
<script type="text/javascript">
	function add_cart(goods_id) {

		var _order_goods_qty = document.getElementById("order_goods_qty").options[document.getElementById("order_goods_qty").selectedIndex].text;
		var order_goods_qty = Number(_order_goods_qty);
		
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/cart/addGoodsInCart.do",
			data : {
				goods_id:goods_id,
				order_goods_qty:order_goods_qty
			},
			success : function(data, textStatus) {
				//alert(data);
			//	$('#message').append(data);
				if(data.trim()=='add_success'){
					imagePopup('open', '.layer01');
				
				}else if(data.trim()=='already_existed'){
					alert("이미 카트에 등록된 상품입니다.");	
				}else if(data.trim()=='alertLogin'){
					alert("로그인이 필요합니다.");
					location.href="${contextPath}/member/loginForm.do";
				}
				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
			}
		}); //end ajax	
	}

	function imagePopup(type) {
		if (type == 'open') {
			// 팝업창을 연다.
			jQuery('#layer').attr('style', 'visibility:visible');

			// 페이지를 가리기위한 레이어 영역의 높이를 페이지 전체의 높이와 같게 한다.
			jQuery('#layer').height(jQuery(document).height());
		}

		else if (type == 'close') {

			// 팝업창을 닫는다.
			jQuery('#layer').attr('style', 'visibility:hidden');
		}
	}
	
	function btn_delete(_article_id){
		
		$.ajax({
			type : "get",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/article/removeArticle.do",
			data : {article_id:_article_id},
			success : function(data, textStatus) {
				alert("정상적으로 삭제하였습니다." + data);
				location.href="${contextPath}/article/articleMain.do";
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax	
	}
	
function fn_order_each_goods(goods_id,goods_title,goods_sales_price,fileName){
	var _isLogOn=document.getElementById("isLogOn");
	var isLogOn=_isLogOn.value;
	
	 if(isLogOn=="false" || isLogOn=='' ){
		alert("로그인 후 주문이 가능합니다!!!");
	} 
	
	
		var total_price,final_total_price;
		var order_goods_qty=document.getElementById("order_goods_qty");
		
		var formObj=document.createElement("form");
		var i_goods_id = document.createElement("input"); 
    var i_goods_title = document.createElement("input");
    var i_goods_sales_price=document.createElement("input");
    var i_fileName=document.createElement("input");
    var i_order_goods_qty=document.createElement("input");
    
    i_goods_id.name="goods_id";
    i_goods_title.name="goods_title";
    i_goods_sales_price.name="goods_sales_price";
    i_fileName.name="goods_fileName";
    i_order_goods_qty.name="order_goods_qty";
    
    i_goods_id.value=goods_id;
    i_order_goods_qty.value=order_goods_qty.value;
    i_goods_title.value=goods_title;
    i_goods_sales_price.value=goods_sales_price;
    i_fileName.value=fileName;
    
    formObj.appendChild(i_goods_id);
    formObj.appendChild(i_goods_title);
    formObj.appendChild(i_goods_sales_price);
    formObj.appendChild(i_fileName);
    formObj.appendChild(i_order_goods_qty);

    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${contextPath}/order/orderEachGoods.do";
    formObj.submit();
	}
	
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
	<hgroup>
		<h1>상품상세</h1>
		<h2>${goods.goods_sort } &gt;</h2>
		<h3>${goods.goods_title }</h3>
		<%-- <h4>${goods.goods_writer} &nbsp; 저| ${goods.goods_publisher}</h4> --%>
	</hgroup>
	<div id="goods_image">
		<figure>
			<img alt="HTML5 &amp; CSS3"
				src="${contextPath}/thumbnails.do?goods_id=${goods.goods_id}&fileName=${goods.goods_fileName}">
		</figure>
	</div>
	<div id="detail_table">
		<table>
			<tbody>
				<tr>
					<td class="fixed">정가</td>
					<td class="active"><span >
					   <fmt:formatNumber  value="${goods.goods_price}" type="number" var="goods_price" />
				         ${goods_price}원
					</span></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed">판매가</td>
					<td class="active"><span >
					   <fmt:formatNumber  value="${goods.goods_price*0.9}" type="number" var="discounted_price" />
				         ${discounted_price}원(10%할인)</span></td>
				</tr>
				<tr>
					<td class="fixed">포인트적립</td>
					<td class="active">${goods.goods_point}P(10%적립)</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed">포인트 추가적립</td>
					<td class="fixed_sub">만원이상 구매시 1,000P, 5만원이상 구매시 2,000P추가적립 편의점 배송 이용시 300P 추가적립</td>
				</tr>
				<tr>
					<td class="fixed">발행일</td>
					<td class="fixed_sub">
					   <c:set var="pub_date" value="${goods.goods_published_date}" />
					   <c:set var="arr" value="${fn:split(pub_date,' ')}" />
					   <c:out value="${arr[0]}" />
					</td>
				</tr>
				<%-- 
				<tr>
					<td class="fixed">페이지 수</td>
					<td class="fixed">${goods.goods_total_page}쪽</td>
				</tr>
				 --%>
				<%-- 
				<tr class="dot_line">
					<td class="fixed">ISBN</td>
					<td class="fixed">${goods.goods_isbn}</td>
				</tr>
				 --%>
				<tr>
					<td class="fixed">배송료</td>
					<td class="fixed_sub"><strong>무료</strong></td>
				</tr>
				<tr>
					<td class="fixed">배송안내</td>
					<td class="fixed_sub"><strong>[당일배송]</strong> 당일배송 서비스 시작!<br> <strong>[휴일배송]</strong>
						휴일에도 배송받는 FREE</TD>
				</tr>
				<tr>
					<td class="fixed">도착예정일</td>
					<td class="fixed_sub">지금 주문 시 내일 도착 예정</td>
				</tr>
				<tr>
					<td class="fixed">수량</td>
					<td class="fixed_sub">
			      <select style="width: 60px;" id="order_goods_qty">
					    <option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
			     </select>
					 </td>
				</tr>
			</tbody>
		</table>
		<ul>
			<li><a class="buy" href="javascript:fn_order_each_goods('${goods.goods_id }','${goods.goods_title }','${goods.goods_sales_price}','${goods.goods_fileName}');">구매하기 </a></li>
			<li><a class="cart" href="javascript:add_cart('${goods.goods_id }')">장바구니</a></li>
			<li><a class="wish" href="#">위시리스트</a></li>
		</ul>
	</div>
	<div class="clear"></div>
	<!-- 내용 들어 가는 곳 -->
	<div class="container">
		<ul class="tabs">
			<li><a href="#tab1">상품소개</a></li>
			<li><a href="#tab2">리뷰</a></li>
			<li><a href="#tab3">QnA</a></li>
			<li><a href="#tab4">주문정보</a></li>
		</ul>
		<div class="tab_container">
			<div class="tab_content" id="tab1">
				<p>${fn:replace(goods.goods_intro,crcn,br)}</p>
				<c:forEach var="image" items="${imageList }">
					<img 
						src="${contextPath}/download.do?goods_id=${goods.goods_id}&fileName=${image.fileName}">
				</c:forEach>
			</div>
<%-- 			<div class="tab_content" id="tab2">
				<h4>저자소개</h4>
				<p>
				<div class="writer">저자 : ${goods.goods_writer}</div>
				 <p>${fn:replace(goods.goods_writer_intro,crcn,br) }</p> 
				
			</div>
			<div class="tab_content" id="tab3">
				<h4>책목차</h4>
				<p>${fn:replace(goods.goods_contents_order,crcn,br)}</p> 
			</div>
			<div class="tab_content" id="tab4">
				<h4>출판사서평</h4>
				 <p>${fn:replace(goods.goods_publisher_comment ,crcn,br)}</p> 
			</div>
			<div class="tab_content" id="tab5">
				<h4>추천사</h4>
				<p>${fn:replace(goods.goods_recommendation,crcn,br) }</p>
			</div> 
--%>
			<div class="tab_content" id="tab2">
			
			</div>
			<div class="tab_content" id="tab3">
				<div class="detail_QnA" >
					<c:if test="${isLogOn == true || isLogOn != ''}">
						<div class="g_btn">
							<input type="button" value="글쓰기" onclick="frm_article()" />
	
						</div>
					</c:if>
					<table>
						<tr class="head">
							<td style="width:60px;">글종류</td>
							<td class="fiexd_title">제목</td>
							<td class="fiexd_writer">작성자</td>
							<td class="fiexd_date">작성일시</td>
							<c:if test="${memberInfo.member_id == 'admin'}">
							<td style="width:30px;">삭제</td>
							</c:if>
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
								<c:forEach var="item" items="${article}" begin="1" end="10">
									<tr>
										<td><span id="sort">${item.article_sort}</span></td>
										<td><a href="${contextPath}/article/articleDetail.do?article_id=${item.article_id}">${item.article_title}</a></td>
										<td>${item.member_id}</td>
										<td>${item.article_creDate}</td>
										<c:if test="${memberInfo.member_id == 'admin'}">
											<td><input type="button" value="삭제" onclick="btn_delete('${item.article_id}')"></td>
										</c:if>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
			<div class="tab_content" id="tab4">
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<div id="layer" style="visibility: hidden">
		<!-- visibility:hidden 으로 설정하여 해당 div안의 모든것들을 가려둔다. -->
		<div id="popup">
			<!-- 팝업창 닫기 버튼 -->
			<a href="javascript:" onClick="javascript:imagePopup('close', '.layer01');"> <img
				src="${contextPath}/resources/image/close.png" id="close" />
			</a> <br /> <font size="12" id="contents">장바구니에 담았습니다.</font><br>
<form   action='${contextPath}/cart/myCartList.do'  >				
		<input  type="submit" value="장바구니 보기">
</form>			
</body>
</html>
<input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn}"/>