
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>



<meta charset="UTF-8">

<title>Document</title>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<script>
		
function openWin(){  
    window.open("https://www.aladin.co.kr/shop/wproduct.aspx?ItemId=21753305", "네이버새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
}  
		
		var count = 0;
		
        $(function () {
        	
            $("#search").click(function () {
           
            	
          
                $.ajax({
                    method: "GET",
                    url: "https://dapi.kakao.com/v3/search/book?target=title", // 전송 주소
                    data: { query: $("#bookName").val() }, // 보낼 데이터
                    headers: { Authorization: "KakaoAK ed985b3f27d4225229387766423c5f8d" }
                })
                    .done(function (msg) { // 응답이 오면 처리를 하는 코드

		            	if(count == 0){
                    	$(".mytitle").append("<strong>"+msg.documents[0].title+"</strong>");
                        $(".myimg").append("<img src='" + msg.documents[0].thumbnail + "'>");
                        $(".price").append("<strong>" + msg.documents[0].price + "원 </strong>");
		            
		            	var str = "reset";
		                document.getElementById("search").innerHTML = str;
		         
		              
		                document.getElementById("bookName").type="hidden";
		                
		            	}if(count == 1){
		            	location.href="main_insert.do?title="+msg.documents[0].title + "&thumbnail="+msg.documents[0].thumbnail + "&price="+msg.documents[0].price;
		            
				         
		            	}
                    	
                    	count = 1;
                 	
                    	
                    	});
            })
        	
        });
     
      
     
        
        
    </script>






<!--     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">-->
<style>
@import
	url('https://fonts.googleapis.com/css?family=Roboto+Slab&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css?family=Permanent+Marker&display=swap')
	;

* {
	box-sizing: border-box;
}

div {
	margin: auto;
	text-align: center;
}

.wrapper {
	height: 3000px;
}

.main {
	height: 30%;
	text-decoration-color: green;
	position: relative;
	background-color: black;
	padding-bottom: 0px;
}

.searchtitle {
	font-size: 30px;
}

.p_text {
	color: #E6E6E6;
	position: absolute;
	margin-top: 10px;
	left: 100px;
	font-size: 250px;
	font-weight: bold;
}

.search {
	position: absolute;
	width: 90%;
	left: 7%;
	top: 45%;
	background: black;
}

.search>input {
	font-size: 20px;
}

.search>p {
	position: relative;
	font-size: 30px;
	color: white;
	left: 0%;
	top: 50%;
	font-family: 'Permanent Marker', cursive;
}

.search>mytitle {
	font-size: 10px;
}

.contents {
	height: 35%;
	background: black;
}

.contents2 {
	height: 40%;
	background: black;
}

.contents>div {
	width: 50%;
	height: 100%;
	float: left;
	background-color: black;
	position: relative;
}

.contents2>div {
	width: 100%;
	height: 120%;
	float: left;
	background-color: black;
	position: absolute;
}

.year {
	font-size: 60px;
	opacity: 60%;
	color: white;
	font-family: 'Permanent Marker', cursive;
	background-color: black;
	opacity: 80%;
	position: absolute;
	top: 15%;
	left: 30%;
}

.year3 {
	font-size: 60px;
	opacity: 60%;
	color: white;
	font-family: 'Permanent Marker', cursive;
	background-color: black;
	opacity: 80%;
	position: absolute;
	top: 15%;
	left: 35%;
}

.year2 {
	font-size: 60px;
	opacity: 60%;
	color: white;
	font-family: 'Permanent Marker', cursive;
	background-color: black;
	opacity: 80%;
	position: absolute;
	top: 15%;
	left: 40%;
}

.a {
	width: 80%;
	height: 80%;
	position: relative;
}

.a>div {
	width: 70%;
	height: 70%;
	position: relative;
	top: 280px;
}

.a>div>div {
	width: 50%;
	height: 50%;
	float: left;
}

.a>div>div>input {
	width: 80%;
	height: 100%;
}

.album {
	color: gray;
	font-size: 60px;
	font-weight: bolder;
	position: absolute;
	left: 20%;
}

.navi {
	width: 99.3%;
	height: 60px;
	position: fixed;
	top: 0px;
	left: 10px;
	text-align:center;
	opacity: 50%;
}

.navi>ul {
	margin-top: 2px;
	padding: 0px;
}

.navi>ul>li {
	height: 60px;
	float: left;
	list-style: none;
	width: 25%;
	background-color: #848484;
}

.navi>ul>li>a {
	color: white;
	text-decoration: none;
	display: block;
	width: 100%;
	line-height: 60px;
	font-weight: bold;
}

.menu {
	width: 100%;
	height: 150px;
	line-height:37px;
}

.menu>div>a {
	text-decoration: none;
	color: white;
}

.menu>div:hover {
	background-color: black;
}

.menu>div {
	width: 100%;
	height: 25%;
	background-color: dimgray;
	opacity: 0%;
}

.store:hover>div>div {
	opacity: 100%;
}

.navi>ul>li:hover {
	background-color: black;
}

.view:hover>div>div {
	opacity: 100%;
}


.login:hover>div>div{
         opacity: 100%;
      }
      
.login a{line-height:60px;
      		font-weight: bold;
      		text-decoration:none;
      		color:#fff;}



.input {
	width: 70%;
	height: 100%;
	float: left;
}

.input>div {
	height: 50%;
}

.input>div>input {
	height: 70%;
	width: 70%;
}

.id {
	position: relative;
	top: 11px;
	left: 33px;
}

.pw {
	position: relative;
	bottom: 11px;
	left: 33px;
}

.button {
	width: 30%;
	height: 100%;
	float: left;
}

.button>button {
	height: 60%;
	width: 70%;
	position: relative;
	top: 10%;
	left: 0%;
	font-weight: bold;
	background-color: gray;
	color: white;
	font-size: 15px;
	border-radius: 10%;
}

.loginbutton:hover>.login {
	opacity: 100%;
}

.side {
	width: 400px;
	height: 300px;
	position: fixed;
	left: 0px;
	top: 400px;
	color: white;
	transform: translate(-80%);
	transition-duration: 2s
}

.sidebox {
	width: 80%;
	height: 100%;
	float: left;
}

.trigger {
	width: 20%;
	height: 10%;
	float: left;
	transform: translateY(-50%);
	position: relative;
	top: 120px;
}

.sidebox>div {
	width: 100%;
	height: 15.4%;
	font-weight: bold;
	font-size: 18px;
	font-family: 'Roboto Slab', serif;
}

.side:hover {
	transform: translate(0);
}

.pic>div>input {
	padding-top: 15px;
	padding-left: 20px;
}

.pic>div>input:hover {
	opacity: 50%;
}

.pic>div>p {
	color: white;
	opacity: 0%;
}

.nami:hover>p {
	opacity: 100%;
}

.dol:hover>p {
	opacity: 100%;
}

.bong:hover>p {
	opacity: 100%;
}

.agac:hover>p {
	opacity: 100%;
}

.na:hover>p {
	opacity: 100%;
}

.mal:hover>p {
	opacity: 100%;
}

.bu:hover>p {
	opacity: 100%;
}

.ss:hover>p {
	opacity: 100%;
}

.ban:hover>p {
	opacity: 100%;
}

.can:hover>p {
	opacity: 100%;
}

.dan:hover>p {
	opacity: 100%;
}

.ean:hover>p {
	opacity: 100%;
}

.nami>p {
	position: absolute;
	top: 40%;
	left: 7%;
	font-size: 20px;
	opacity: 100%;
}

.dol>p {
	position: absolute;
	top: 40%;
	left: 55%;
	font-size: 20px;
	opacity: 100%;
}

.bong>p {
	position: absolute;
	top: 75%;
	left: 8%;
	font-size: 20px;
	opacity: 100%;
}

.agac>p {
	position: absolute;
	top: 90%;
	left: 55%;
	font-size: 20px;
	opacity: 100%;
}

.na>p {
	position: absolute;
	top: 40%;
	left: 7%;
	font-size: 20px;
	opacity: 100%;
}

.mal>p {
	position: absolute;
	top: 40%;
	left: 55%;
	font-size: 20px;
	opacity: 100%;
}

.bu>p {
	position: absolute;
	top: 90%;
	left: 7%;
	font-size: 20px;
	opacity: 100%;
}

.ss>p {
	position: absolute;
	top: 90%;
	left: 60%;
	font-size: 20px;
	opacity: 100%;
}

.ban>p {
	position: absolute;
	top: 40%;
	left: 7%;
	font-size: 20px;
	opacity: 100%;
}

.can>p {
	position: absolute;
	top: 40%;
	left: 55%;
	font-size: 20px;
	opacity: 100%;
}

.dan>p {
	position: absolute;
	top: 90%;
	left: 5%;
	font-size: 20px;
	opacity: 100%;
}

.ean>p {
	position: absolute;
	top: 90%;
	left: 55%;
	font-size: 20px;
	opacity: 100%;
}

.body {
	padding: 0px;
	margin: 0px;
}

.srlist2 {
	margin-top: 120px; color : white;
	background: black;
	font-size: 20px;
	position: relative;
	width: 100%;
	color: white;
}

.srlist3 {

	background: black;
}

.m_td{position: relative;}

.btn{
	border-style:none;
	background:black;
	color: white;
	position:absolute;
	top:5px;
	
}



.bookname {

	background:black;
  border-style:none;
  background-image : url('${pageContext.request.contextPath }/resources/img/검색창.JPG'); 

  background-position:top right; 

  background-repeat:no-repeat;

  }
  
  .searchb{
      	color: white;
      	font-size: 18px;
      	font-family:'Roboto Slab', serif;
      }
      
      .searchb:hover{
      	color:yellow;
      }
      
</style>
<script
	src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
   

</head>
<body>
	

	<div class="wrapper">
		<div class="main">
			<p class="p_text">book</p>

			<div class="search">
				<p class="searchtitle">Search your book</p>
				<p class="mytitle"></p>
				<p class="myimg"></p>
				<p class="price"></p>
			<table style="width: 50%" align="center";>
			
			<tr>
			<td class="m_td">
				<input class ="bookname" id="bookName" type="text" style="font-size: 15px; height: 55px; width: 400px;"  >
				<button class= "btn" id="search" type="button" style="color: white;"  ><img src="${pageContext.request.contextPath }/resources/img/검색.jpg"></button>
			</td>
			<td>
				
			</td>
			</tr>
				</table>
			</div>



		</div>
		<div class="contents">
			<div class="a left">
				<h class=album>#bestseller</h>
				<h class=year>Mystery/Novel</h>
				<div class="pic left_in">
				
					<div class="nami">
						<input type=image
							src="${pageContext.request.contextPath }/resources/img/나미야잡화점.JPG",>
						<p>나미야잡화점</p>							
					</div>
					
					<div class="dol">
						<input type=image
							src="${pageContext.request.contextPath }/resources/img/돌이킬.jpg">
						<p>돌이킬 수 없는 약속</p>
					</div>
					<div class="bong">
						<input type=image
							src="${pageContext.request.contextPath }/resources/img/봉제인형살인사건.jpg">
						<p>봉제인형살인사건</p>
					</div>
					<div class="agac">
						<input type=image
							src="${pageContext.request.contextPath }/resources/img/아가씨와딸.jpg">
						<p>아가씨와 딸</p>
					</div>

				</div>

			</div>

			<div class="a right">

				<h class=year>Life skills</h>

				<div class="pic right_in">

					<div class="na">
						<input type=image
							src="${pageContext.request.contextPath }/resources/img/나는몰랐기때문이다.jpg">
						<p>나는 몰랐기 때문이다</p>
					</div>
					<div class="mal">
						<input type=image
							src="${pageContext.request.contextPath }/resources/img/말투의편집.jpg">
						<p>말투의 편집</p>
					</div>
					<div class="bu">
						<input type=image
							src="${pageContext.request.contextPath }/resources/img/부의열차에올라타는법.jpg">
						<p>부의 열차에 올라타는법</p>
					</div>
					<div class="ss">
						<input type=image
							src="${pageContext.request.contextPath }/resources/img/승리하는습관.jpg">
						<p>승리하는 습관</p>
					</div>

				</div>

			</div>
		</div>

		<div class="contents">
			<div class="a left">
				<h class=year>humanities</h>
				<div class="pic left_in">

					<div class="ban">
						<input type=image
							src="${pageContext.request.contextPath }/resources/img/색의 인문학.jpg">
						<p>색의 인문학</p>
					</div>
					<div class="can">
						<input type=image
							src="${pageContext.request.contextPath }/resources/img/순례자의 인문학.jpg">
						<p>순례자의 인문학</p>
					</div>
					<div class="dan">
						<input type=image
							src="${pageContext.request.contextPath }/resources/img/하루 한마디 인문학 질문의 기적.jpg">
						<p>하루 한마디 인문학 질문의 기적</p>
					</div>
					<div class="ean">
						<input type=image
							src="${pageContext.request.contextPath }/resources/img/반야심경.jpg">
						<p>반야심경</p>
					</div>

				</div>
			</div>


			<div class="a right" >

				<h class=year3> Comics</h>

				<div class="pic right_in">

					<div class="ban">
						<input type=image
							src="${pageContext.request.contextPath }/resources/img/V 마그넷 오프너.JPG">
						<p>V 마그넷 오프너</p>
					</div>
					<div class="can">
						<input type=image
							src="${pageContext.request.contextPath }/resources/img/나답게 살고 있습니다..JPG">
						<p>나답게 살고 있습니다.</p>
					</div>
					<div class="dan">
						<input type=image
							src="${pageContext.request.contextPath }/resources/img/날씨의아이.JPG">
						<p>날씨의 아이</p>
					</div>
					<div class="ean">
						<input type=image
							src="${pageContext.request.contextPath }/resources/img/빨강 머리 앤.JPG">
						<p>빨강머리앤</p>
					</div>

				</div>

			</div>
		</div>

		<div class="contents2" >
			<div class="a left">
				<h class=album></h>
				<h class=year2>Search History</h>

				<div class="srlist2" style="border: 5px solid white;">

						<c:if test="${ empty list }">
							<li id="none" style="color: white;">
								검색 기록이 없습니다
							</li>
						</c:if>
					<c:forEach var="vo" items="${ list }">
						<div class="srlist3">
							<img src="${vo.thumbnail}"><br> ${vo.title}<br>
							${vo.price}원<br> 
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>


<div class="navi">
		<ul>
			<li style="cursor:pointer" class="mainview" onclick="location.href='main.do'">
				<a>HOME</a>
				<div class="home"></div>
			</li>
			
			<li style="cursor:pointer" class="store">
				<a>BOOK STORE</a>
				<div class="menu">
					<div>
						<a href="booklist.do">Book List</a>
					</div>
				</div>
			</li>
			
			
			
			<li style="cursor:pointer" class="view">
				<a>REVIEWS</a>
				<div class="menu">
					<div>
						<a href="list.do">Community</a>
					</div>
					<div>
						<a href="qna.do">Q&A</a>
					</div>
				</div>
			</li>
			
			<li style="cursor:pointer" class="login">
        		<div class="menu">
        			<c:if test="${sessionScope.Success_id eq null}">
         				<a href="login_form.do" onclick="location.href='login_form.do'">LOGIN</a> 
     		    	</c:if>
        			<c:if test="${sessionScope.Success_id ne null}">
         				<a href="logout.do">LOGOUT</a> 
	         		</c:if>    
         		</div>
			</li>
		</ul>
	</div>


	<div class="side">
		<div class="sidebox">
		 <div><a class="searchb" href="search_form.do" method="post">도서검색🔍</a></div>
		 
			<div class="profile">Developer</div>
			<div>만든이</div>
			<div>예솔 서영</div>
			<div>민경 승준</div>
			<div>도서 판매 웹사이트</div>
		</div>

		<div class="trigger">▷</div>
	</div>
</body>
</html>