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
	top: 0px;
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

.joinframe {
   background-color:#E6E6E6;
   position: absolute;
   top: 45%;
   left: 20px;
   right: 100px;
   width: 50%;
   height: 600px;
   opacity: 100%;
   border-radius: 10%;
   
}


.input {
   width: 200px;
   height: 50px; 
   float: left;
   position: absolute;
   left:30px;
   top:30px;
}
.input>div{
   width: 200px;
   margin: 20px;/*텍스트상자간 폭  */
}
.input>div>input {
   height: 50px;
    width: 500px; /*텍스트상자크기  */
   /*  background-color:black; */
}

.input>div {
   height: 50px;
    width: 500px;
    background-color:black;
}

 .joongbok {

	width: 500px;
	height: 200px;
	float: right;
	
}

.joongbok>input {
	height: 50px;
	width: 150px;
	position: relative;
	top: 25%; 
	right: 15%;
	font-weight: bold;
	background-color: black;
	color: white;
	font-size: 15px;
	border-radius: 10%;
}

.juso {

	width: 500px;
	height: 200px;
	float: right;
	
}


.juso>input{

     height: 50px;
	width: 150px;
	position: relative;
	top: 40%; 
	right: 15%;
	font-weight: bold;
	background-color: black;
	color: white;
	font-size: 15px;
	border-radius: 10%;


}
 
 .joinbtn {
	width: 500px;
	height:500px;
	float: center;
}

.joinbtn>input {
	height: 50px;
	width: 150px;
	position: relative;
	top: 108%;
	left: 35%;
	font-weight: bold;
	background-color: black;
	color: white;
	font-size: 15px;
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
	line-height:37px;
	font-weight:normal;
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
	position: relative;
}
</style>

<script>

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("${pageContext.request.contextPath }/WEB-INF/views/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
		document.form.userAddr.value = roadFullAddr;		
}

function id_check(f){
	/* 
	alert("중복아이디 넘어오는거 확인"); */
	var u_id = f.join_id.value.trim();	
	if(u_id != ""){
	var url = "id_check.do"
	var param= "u_id="+encodeURIComponent(u_id);
	sendRequest(url, param, resultFn1, "POST");
	}
	else{
	  alert("아이디를 입력 후 중복체크해주세요");
	}
	
}

var use_id = false;

function resultFn1(){
	
	if( xhr.readyState == 4 && xhr.status == 200 ){
		var data = xhr.responseText;	
		var idcheck_json = eval(data);
    
	if(idcheck_json[0].result=="0"){
	alert("이미 사용중인 아이디입니다.");
	    return;
		}else{
			alert("사용가능한 아이디입니다.");
			
		    document.getElementById("join_id").readOnly = true;
		    use_id=true;
			return;
		}
		
	}
}

function information_check(f){
	
	var u_id = f.join_id.value.trim();
	var u_name= f.join_name.value.trim();
	var u_tel=f.join_tel.value.trim();
	var u_email = f.join_email.value.trim();
	var u_addr= f.join_addr.value.trim();
	var u_pwd= f.join_pwd.value.trim();
	var check_pwd=f.check_pwd.value.trim();
	
	if(u_id==""){
	  alert("아이디를 입력하세요");
	  return;
	}
	
	 var id_pattern =  /^[0-9a-z]+$/;/*id 정규판별식  */
	 if(!id_pattern.test(u_id)){
		 alert("아이디는 영문과 숫자의 사용만 가능합 니다");
		 f.join_id.focus();
		 return;
		 
	 }
	
	if(!use_id){ //use_id == false
		
		alert("id중복체크후 이용해주세요");
		return;
		
	}		

	
	if(u_name==""){
	
		alert("이름을 입력하세요");
		return;
	 
	}
	if(u_tel==""){
		  alert("휴대폰번호를 입력하세요");
		  return;
			
    }
	if(u_email==""){
		
	alert("이메일을 입력하세요");
		 return;
		}
	

	 var email_pattern= /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

			if(!email_pattern.test(u_email)){
			alert("이메일 형식에 올바르지 않습니다");
			f.join_email.focus();
			return;
			}	
	
	if(u_addr==""){
		  alert("주소를 입력하세요");
		  return;
			
	}
	if(u_pwd==""){
		
		alert("비밀번호를 입력하세요");
		 return;
		}
	
	 var pwd_pattern= /(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
		if(!pwd_pattern.test(u_pwd)){
			alert("비밀번호를 특수문자를 포함한 8자리 이상으로 만드세요");
			f.join_pwd.focus();
			return;
		}

	if(u_pwd==""){
			
			alert("지정비밀번호를 다시 입력하세요.");
		    return;
		}
		
		if (u_pwd!=check_pwd){
		
			alert("지정비밀번호와 일치하지 않습니다.")
		    return;
		}else{
			alert("비밀번호 일치");
			
		
		}
	var url ="information_check.do";
	var param="u_id="+encodeURIComponent(u_id)+"&u_name="+encodeURIComponent(u_name)+"&u_tel="+encodeURIComponent(u_tel)+
	"&u_email="+encodeURIComponent(u_email)+"&u_addr="+encodeURIComponent(u_addr)+"&u_pwd="+encodeURIComponent(u_pwd);  
	sendRequest(url, param, resultFn2, "POST");

}

function resultFn2(){
	if( xhr.readyState == 4 && xhr.status == 200 ){
		var data = xhr.responseText;
		var inputcheck_json = eval(data); 
		 /*  alert(data); */
		if(inputcheck_json[0].success==1){
			alert("회원가입성공");
			return location.href='login_form.do';
		}else{
			
		alert("회원가입 실패")
		return;
		}
	
	}
}
</script>
</head>
<body>
<form>
	<div class="wrapper">

		<p class="p_text">
			JoinFormPage
		</p>

		<div class="Joinframe">
				<div class="input">
		         <div class="id">
				    <input type=text name="join_id" id="join_id" placeholder="ID를 입력하세요."> 
				 </div>
				<div class="name">
				<input type=text name="join_name" placeholder="이름을 입력하세요.">
				</div>	
				<div class="tel">
					<input type=text name="join_tel" placeholder="핸드폰 번호를 입력하세요.">
				</div>
				<!-- <div class="email">
				<input type=text name="join_email" placeholder="이메일을 입력하세요.">
				</div> -->
				<div class="address">
				<input type="text" id="join_addr" class="form-control" placeholder="주소를 입력하세요" />
				</div>
				<div class="email">
				<input type=text name="join_email" placeholder="이메일을 입력하세요.">
				</div>
				<div class="password">
					<input type=password name="join_pwd" placeholder="비밀번호를 입력하세요.">
				</div>
			    <div class="confirmpwd">
			    <input type=password name="check_pwd" placeholder="지정비밀번호를 다시 입력하세요.">
				</div>
			</div>
				<div class ="joongbok">
				 <input type="button" class="joongbok" value="중복확인" onclick="id_check(this.form);"> <br>
				 </div>
				<!--  <div class ="joongbok">
				 <input type="button" class="juso" value="주소찾기" onclick="goPopup()"> <br>
				 </div> -->
				<div class="joinbtn">
				<input type="button" value="회원가입하기" onClick="information_check(this.form)">
				</div>
		
	</div>
	</div>
</form>

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
					 <a href="updateform.do?u_id=${sessionScope.Success_id}">Modify information</a>
			         </div>
	         		</c:if>    
         		</div>
			</li>
		</ul>
	</div>
</body>
</html>