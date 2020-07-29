<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>:::LOGIN:::</title>
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
	height: 1000px;
	background-color: black;
}

.main {
	height: 100%;
	text-decoration-color: green;
	position: relative;
	background-color: black;
}

.main>input {
	width: 100%;
	height: 100%;
}

.p_text {
	font-family: 'Permanent Marker', cursive;
	color: #E6E6E6;
	position: absolute;
	top: -50px;
	left: 100px;
	font-size: 150px;
	font-weight: bold;
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
	width: 100%;
	height: 100%;
}

.loginframe {
	background-color: #E6E6E6;
	position: absolute;
	top: 70%;
	left: 10px;
	right: 100px;
	width: 60%;
	height: 300px;
	opacity: 100%;
}

.input {
	width: 70%;
	height: 80%;
	float: left;
}

.input>div>input {
	margin-top: 40px;
	height: 70%;
	width: 70%;
}

.input>div {
	height: 50%;
}

.id {
	top: 20px;
	left: 33px;
}

.pw {
	top: 80%;
	bottom: 11px;
	left: 33px;
}

.button1 {
	width: 30%;
	height: 100%;
	float: left;
}

.button1>button {
	height: 40%;
	width: 50%;
	position: relative;
	top: 10%;
	right: 30%;
	font-weight: bold;
	background-color: black;
	color: white;
	font-size: 15px;
	border-radius: 10%;
}

.button1>input.loginbtn {
  
	height: 40%;
	width: 50%;
	position: relative;
	top: 10%;
	right: 30%;
	cursor:pointer;
	background-color: black;
	color: white;
	font-size: 15px;
	font-weight: bold;
	border-radius: 10%;
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


.body {
	padding: 0px;
	margin: 0px;
}
</style>
<script>

function check(f){

	var u_id=f.u_id.value.trim();
	var u_pwd=f.u_pwd.value.trim();
	
	

	if( u_id == '' ){
		alert("ID를 입력해주세요");
		return;
	}
	if( u_pwd == '' ){
		alert("PW를 입력해주세요"); 
		return;
	}
	
	var url = "login_check.do";
	var param = "u_id="+encodeURIComponent(u_id)+"&u_pwd="+encodeURIComponent(u_pwd);
	sendRequest(url, param, resultFn, "POST");
	
	f.submit();
}

function resultFn() {
	
	if( xhr.readyState == 4 && xhr.status == 200 ){
		var data = xhr.responseText;
		var json = eval(data);
		
		
		if( json[0].result=="0" ) {
			alert("아이디가 존재하지 않습니다.");
			
			return;	
		} else if( json[0].result=="1"){ 
			
			alert("비밀번호가 일치하지 않습니다");
			return;
			
		} else{
			alert("로그인 성공");
			location.href="login.do?u_id=" + json[1].userId;
		}
	}
	
}

function movejoin(f){
	
	f.action = "movejoin.do";
	f.submit();
	
}



</script>
</head>
<body>
	<div class="wrapper">
			<div class="ment">
				<p class="p_text">
					LoginPage<br> ˙ᵕ˙
				</p>
			</div>

			<form method="post">
			<div class="loginframe">
				<div class="input">
					<div class="id">
						<input type=text name="u_id" placeholder="ID를 입력하세요.">
					</div>
					<div class="pw">
						<input type=password name="u_pwd" placeholder="PW를 입력하세요.">
					</div>
				</div>

				<div class="button1">
					 <input type="button" class="loginbtn" value="Login" onClick="check(this.form);">
					 <button onClick="movejoin(this.form)">Join</button>
				</div>
			</div>
	</form>
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
			
			<!-- <li style="cursor:pointer" class="mypage">
				<a href="updateform.do"> My Page</a>
			</li>
			 -->
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
         				 <div class="menu">
			         <div>
					 <a href="updateform.do?u_id=${sessionScope.Success_id}">Modify information</a>
			         </div>
			         </div>
	         		</c:if>    
         		</div>
			</li>
		</ul>
	</div>

</body>
</html>