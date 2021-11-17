<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<meta charset="utf-8">
<head>
<script type="text/javascript">
	var cnt = 0;
	function fn_addFile() {
		if (cnt == 0) {
			$("#d_file").append(
					"<br>" + "<input  type='file' name='main_image'  />");
		} else {
			$("#d_file")
					.append(
							"<br>"
									+ "<input  type='file' name='detail_image"+cnt+"' />");
		}

		cnt++;
	}
</script>
</head>

<BODY>
	<form action="${contextPath}/admin/goods/addNewGoods.do" method="post"
		enctype="multipart/form-data">
		<h1>새상품 등록창</h1>
		<div class="tab_container">

			<!-- 내용 들어 가는 곳 -->
			<div class="tab_container" id="container">
				<ul class="tabs">
					<li><a href="#tab1">상품정보</a></li>
					<li><a href="#tab2">상품소개</a></li>
					<li><a href="#tab3">상품이미지</a></li>
					
				</ul>
				<div class="tab_container">
					<div class="tab_content" id="tab1">
						<table>
							<tr>
								<td width=200>제품분류</td>
								<td width=500><select name="goods_sort">
										<option value="" selected>
										<option value="">
								</select></td>
							</tr>
							<tr>
								<td>제품이름</td>
								<td><input name="goods_title" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>배급사</td>
								<td><input name="goods_publisher" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>제품정가</td>
								<td><input name="goods_price" type="text" size="40" /></td>
							</tr>

							<tr>
								<td>제품판매가격</td>
								<td><input name="goods_sales_price" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>제품 구매 포인트</td>
								<td><input name="goods_point" type="text" size="40" /></td>
							</tr>

							<tr>
								<td>제품출시일</td>
								<td><input name="goods_published_date" type="date"
									size="40" /></td>
							</tr>

							<tr>
								<td>제품색상</td>
								<td><select name="goods_color">
										<option value="카키">카키</option>
										<option value="화이트">화이트</option>
										<option value="블랙" selected>블랙</option>
										<option value="그레이">그레이</option>
										<option value="네이비">네이비</option>
										<option value="보라색">보라색</option>
										<option value="오렌지">오렌지</option>
										<option value="블루">블루</option>
										<option value="갈색">갈색</option>
								</select></td>
							</tr>
							<tr>
								<td>제품 배송비</td>
								<td><input name="goods_delivery_price" type="text"
									size="40" /></td>
							</tr>
							<tr>
								<td>제품 도착 예정일</td>
								<td><input name="goods_delivery_date" type="date" size="40" /></td>
							</tr>
							<tr>
								<td>제품종류</td>
								<td><select name="goods_status">
										<option value="bigsize" selected>빅사이즈</option>
										<option value="top">상의</option>
										<option value="bottom">하의</option>
										<option value="shoes">신발</option>
								</select></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
						</table>
					</div>
					
					<div class="tab_content" id="tab2">
						<H4>제품소개</H4>
						<table>
							<tr>
								<td>제품소개</td>
								<td><textarea rows="100" cols="80" name="goods_intro"></textarea></td>
							</tr>
						</table>
					</div>
					
					<div class="tab_content" id="tab3">
						<h4>상품이미지</h4>
						<table>
							<tr>
								<td align="right">이미지파일 첨부</td>

								<td align="left"><input type="button" value="파일 추가"
									onClick="fn_addFile()" /></td>
								<td>
									<div id="d_file"></div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<center>
				<table>
					<tr>
						<td align=center><input type="submit" value="상품 등록하기">
						</td>
					</tr>
				</table>
			</center>
		</div>
	</form>