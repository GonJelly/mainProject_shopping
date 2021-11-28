<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<meta charset="utf-8">
<head>
<script type="text/javascript">
	
	var cnt = 0;
	
	function addfile(){
		$('#bottom_tow').before(
				"<tr id='detail_row"+cnt+"'>" +
				"<td align='right'>상세이미지"+cnt+"</td>"+
				"<td><img id='detailview"+cnt+"' src='#' width='300'></td>" +
				"<td align='left'><input type='file' id='detail_img"+cnt+"' name='detail_image' />"
				+"</td>"
				+ "</tr>"
		);	
		cnt++;
	}
	
	function deletefile(){
		cnt = cnt-1;
		$('#detail_row'+cnt).remove();
	}
	
	$(function(){
		/* 메인이미지 업로드 */
		$('#main_img').change(function(){
			var input = this;
			if(input.files && input.files[0]){
				
				var reader = new FileReader();
				
				reader.onload = function(e){
					$('#mainview').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			} else {
				$('#mainview').attr('src', '#');
			}
		});
		/* 상세이미지 업로드 */
		$('#detail_img').change(function(){
			var input = this;
			if(input.files && input.files[0]){
				
				var reader = new FileReader();
				
				reader.onload = function(e){
					$('#detailview').attr('src',e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			} else {
				$('#detailview').attr('src', '#');
			}
		});
		
	});
	
	function readURL(input){
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
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
										<option value="모자" selected>모자</option>
										<option value="상의">상의</option>
										<option value="바지">바지</option>
										<option value="액세서리">액세서리</option>	
										<option value="신발">신발</option>
										<option value="점퍼">신발</option>
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
										<option value="hat" selected>모자</option>
										<option value="top">상의</option>
										<option value="pants">하의</option>
										<option value="accessory">액세서리</option>
										<option value="shoes">신발</option>
										<option value="shoes">점퍼</option>
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
							<tr id='main_row'>
								<td align="right">메인이미지</td>
								<td><img id="mainview" src="#" width=300></td>
								<td align="left"><input  type='file' id="main_img" name='main_image' /></td>
							</tr>
							
							<tr id="detail_row">
								<td align="right">상세이미지</td>
								<td><img id="detailview" src="#" width="300"></td>
								<td align="left"> <input type="file" id="detail_img" name="detail_image" /></td>
							</tr>

							<tr id="bottom_tow">
								<td>이미지 첨부 추가</td>
								<td>
									<input type="button" value="파일추가" onclick="addfile()" />
									<input type="button" value="삭제" onclick="deletefile()" />
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