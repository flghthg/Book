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

.main>updateinput {
	width: 100%;
	height: 100%;
}
.height{

top:10px;

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

.a>div>div>updateinput {
	width: 100%;
	height: 100%;
}

.updateframe {
   background-color:#D5D5D5;
   position: absolute;
   top: 43%;
   left: 20px;
   right: 100px;
   width: 50%;
   height: 600px;
   opacity: 100%;
   border-radius: 10%;
   
}


.updateinput {
   width: 200px;
   height: 50px; 
   float: center;
   position: absolute;
   left:135px;
   top:-25px;
}
.updateinput>div{
   width: 200px;
   margin: 38px;/*텍스트상자간 폭  */
} 
.updateinput>div>input {
   height: 50px;
    width: 500px; /*텍스트상자크기  */
    margin-top:5px;
    margin-bottom:2px; 
   /*  background-color:black; */
}

#user_id{

background-color:#E6E6E6;

}


.updateinput>div {
   height: 50px;
    width: 500px;
    font-size: 20px;
	font-weight: bold;
	color:dimgray;
    font-family: 'Permanent Marker', cursive;
    /* background-color:black; */
}

 .updatebtn {
	width: 500px;
	height:500px;
	float: center;
}

.updatebtn>input {
	height: 40px;
	width: 140px;
	position: relative;
	top: 110%;
	right: 3px;
	left:3px;
	font-weight: bold;
	background-color: gray;
	color: white;
	font-size: 15px;
	border-radius: 10%;
}


      .navi{
         width: 99.3%;
         height: 60px;
         position: fixed;
         top: 0px;
         left: 10px;
         
         
         opacity: 50%;
      }
      
      .navi>ul{
         margin-top: 2px;
         padding: 0px;
      }
      
      .navi>ul>li{
         height: 60px;
         float: left;
         list-style: none;
         width: 25%;
         background-color: #848484;   
      }
      
      .navi>ul>li>a{
         color: white;
         text-decoration: none;
         display: block;
         width: 100%;
         line-height: 60px;
         font-weight: bold;
      }
      
      .logout{
      
        color: white;
         text-decoration: none;
         display: block;
         width: 100%;
         line-height: 60px;
         font-weight: bold;
      
      }
      
   
      .menu{
         width: 100%;
         height: 150px;
      }
      .menu>div>a {
	  text-decoration: none;
	  color: white;
	  line-height:37px;
	   font-weight:normal;
     }
      
      .menu>div:hover{
         background-color: black;
      }
      .menu>div{
         width: 100%;
         height: 25%;
         background-color: dimgray;
         opacity: 0%;
      }
      .store:hover>div>div{
         opacity: 100%;
      }
      
      .navi>ul>li:hover{
         background-color: black;
         
      }
      
      .view:hover>div>div{
         opacity: 100%;
      }
      
      .login:hover>div>div{
         opacity: 100%;
      }
      
      .login a{line-height:60px;
      			font-weight: bold;}

.body {
	padding: 0px;
	margin: 0px;
	position: relative;
}
</style>
<script>
function modify(f){
	
	var u_id=f.user_id.value.trim();
	var u_name= f.user_name.value.trim();
	var u_tel=f.user_tel.value.trim();
	var u_email = f.user_email.value.trim();
	var u_addr= f.user_addr.value.trim();
	var u_pwd= f.user_pwd.value.trim();
	
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
			f.user_email.focus();
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
			f.user_pwd.focus();
			return;
		}
	
	var url="modify_form.do";
	var param="u_id="+encodeURIComponent(u_id)+"&u_name="+encodeURIComponent(u_name)+"&u_tel="+encodeURIComponent(u_tel)+"&u_email="+encodeURIComponent(u_email)+"&u_addr="+encodeURIComponent(u_addr)+"&u_pwd="+encodeURIComponent(u_pwd);  
	sendRequest(url, param, resultFn, "POST");
	
	
}

function resultFn(){
	
	if( xhr.readyState == 4 && xhr.status == 200 ){
		var data = xhr.responseText;
		var updatecheck_json = eval(data); 
		 /*  alert(data); */
		if(updatecheck_json[0].success == 1){
			alert("회원정보수정성공");
			return location.href='main.do';
		}else{
			
		alert("회원정보수정 실패")
		return;
		}
	
	}
}


</script>
</head>
<body>
	<form>
		<div class="wrapper">
           <div class="height">
			<p class="p_text">UpdateInfoPage</p>
			<div class="updateframe">
				<div class="updateinput">
					<div class="id">
				    ID <input type=text name="user_id" id="user_id" value="${vo.u_id}" readonly=true  > 
				 </div>
				<div class="name">
				NAME<input type=text name="user_name" value="${vo.u_name}">
				</div>	
				<div class="tel">
					TEL<input type=text name="user_tel" value="${vo.u_tel}">
				</div>
				<div class="email">
				E-MAIL<input type=text name="user_email" value="${vo.u_email}">
				</div>
				<div class="address">
				ADDRESS<input type=text name="user_addr" value="${vo.u_addr}">
				</div>
				<div class="password">
					PWD<input type=password name="user_pwd" value="${vo.u_pwd}">
				</div>	
				</div>
				
				<div class="updatebtn">
				<input type="button" value="정보수정하기" onClick="modify(this.form)">
				</div>
		
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
         				<a href="logout.do" class="logout">LOGOUT</a> 
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