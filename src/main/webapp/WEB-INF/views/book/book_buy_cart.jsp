<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	function check(value){
		
		var tablea = document.getElementById("tablea");
		var tableb = document.getElementById("tableb");
		
		if(value == 1){
			tableb.style.display='none';
			tablea.style.display='block';
		}
		if(value == 2){
			tableb.style.display='block';
			tablea.style.display='none';
		}
	}
	function pay(value){
		
		var tablec = document.getElementById("tablec");
		var tabled = document.getElementById("tabled");
		var tablee = document.getElementById("tablee");
		
		if(value == 1){
			tabled.style.display='none';
			tablee.style.display='none';
			tablec.style.display='block';
		}
		if(value == 2){
			tablec.style.display='none';
			tablee.style.display='none';
			tabled.style.display='block';
		}
		if(value == 3){
			tabled.style.display='none';
			tablec.style.display='none';
			tablee.style.display='block';
		}
	}
	
	function paid(){
		
		var c = document.getElementById("c");
		var d = document.getElementById("d");
		var e = document.getElementById("e");

		var card = document.getElementById("card");
		var card1 = document.getElementById("card1");
		var card2 = document.getElementById("card2");
		
		if(c.checked == true){
			location.href ="paid.do";
		}else if(d.checked == true){
			card.style.display="block";
			card1.style.display="block";
			card2.style.display="block";
		}else if(e.checked == true){
			location.href='api.do';
		}
	}
	
	function divClose() {
		var card = document.getElementById("card");
		var card1 = document.getElementById("card1");
		var card2 = document.getElementById("card2");
		
		card.style.display="none";
		card1.style.display="none";
		card2.style.display="none";
	}
	
	 
	
</script>
<link href="${ pageContext.request.contextPath }/resources/css/book_buy.css" rel="stylesheet" type="text/css" />

</head>
<body>

	<jsp:include page="navi.jsp" />
	<div class="main margin">
		<h2>주문 / 결제</h2>

		<!-- 구매할 책 정보 -->
		<div class="book_info">
			<table border="1">
				<tr>
					<th>상품 정보</th>
					<th>배송비</th>
					<th>금액</th>
					<th>수량</th>
					<th>총 금액</th>
				</tr>
				<c:forEach var="vo" items="${list }">
					<tr>
						<th>${vo.b_name }</th>
						<th>2500</th>
						<th><fmt:formatNumber value="${vo.b_price}" /></th>
						<th>${vo.c_cnt }</th>
						<th><fmt:formatNumber value="${vo.b_price * vo.c_cnt}" /></th>
					</tr>
				</c:forEach>
			</table>
		</div>
		<!-- 구매할 책 정보 -->

		<hr>

		<h2>배송지 정보</h2>

		<!-- 배송지 정보 -->
		<div class="deliver_info">
			배송지 선택 : <input type="radio" name="delivery" id="a" checked="checked" onchange="check(1);">기본 배송지 
					  <input type="radio" name="delivery" id="b" onchange="check(2);">신규 배송지

			<table id="tablea">
				<tr>
					<td><input name="name" value="${vo_l.u_name }"></td>
				</tr>

				<tr>
					<td><input name="tel" value="${vo_l.u_tel }"></td>
				</tr>

				<tr>
					<td><input name="addr" value="${vo_l.u_addr }"></td>
				</tr>

				<tr>
					<td><input name="request" value="요청사항 입력"></td>
				</tr>
			</table>

			<table id="tableb">
				<tr>
					<td><input name="name" value="이름을 입력하세요"></td>
				</tr>

				<tr>
					<td><input name="tel" value="전화번호를 입력하세요"></td>
				</tr>

				<tr>
					<td><input name="addr" value="주소를 입력하세요"></td>
				</tr>

				<tr>
					<td><input name="request" value="요청사항 입력"></td>
				</tr>
			</table>
		</div>
		<!-- 배송지 정보 -->

		<hr>

		<h2>결제 방법</h2>

		<!-- 결제수단 -->
		<div class="pay_info">
			<div class="radio">
				<input type="radio" name="pay" value="c" id="c" checked="checked" onchange="pay(1);">무통장 입금 
				<input type="radio" name="pay" value="d" id="d" onchange="pay(2);">카드결제 
				<input type="radio" name="pay" value="e" id="e" onchange="pay(3);">카카오페이
			</div>
			
			<div id="tablec">
				입금자명 : <input name="name2"> <br> 
				입금은행 : <select name="bank">
					<option value="">::: 은행을 선택해주세요 :::</option>
					<option value="1">국민은행 : 284001-04-005264</option>
					<option value="2">우리은행 : 284001-04-005264</option>
					<option value="3">농협은행 : 284001-04-005264</option>
				</select>
			</div>

			<div id="tabled">카드결제</div>

			<div id="tablee">카카오 페이</div>
		</div>
		<!-- 결제 수단 -->

		<div id="paid" class="margin">
			<input type="button" value="결제하기" onclick="paid();">
		</div>
		
		<div id="card">
			<div id="card1"></div>
			<div id="card2">
				<div style="cursor:pointer" onclick="divClose();">X</div>
				<p>
					카드 : <select name="card">
							<option value="">::: 카드를 선택해주세요 :::</option>
							<option value="1">삼성카드</option>
							<option value="2">국민카드</option>
							<option value="3">우리카드</option>
						</select><br>
					카드 번호 : <input name="num1"> - <input name="num2"> - <input name="num3"> - <input name="num4"> <br>
					cvc 번호 : <input name="cvc"> <br>
					비밀번호 : <input name="pwd"> <br>
				</p>
				<input type="button" value="결제완료하기" id="card_paid" onclick="location.href='paid.do';">
			</div>
		</div>
	</div>


</body>
</html>