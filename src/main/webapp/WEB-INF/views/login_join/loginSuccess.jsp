<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::WELCOME:::</title>
<!DOCTYPE html>
<html lang="en"> 
<head>
<meta charset="UTF-8">
<title>:::LOGIN:::</title>

<style>

  @import url('https://fonts.googleapis.com/css?family=Roboto+Slab&display=swap');
  @import url('https://fonts.googleapis.com/css?family=Permanent+Marker&display=swap');

   *{
         box-sizing: border-box;
 
      }
      
      div{
         margin: auto;
         text-align: center;
         
      }
      
      .wrapper{
         height: 1000px;
         background-color:black;
      }
      
      .main{
         height: 100%;
         text-decoration-color: green;
         position: relative;
         background-color: black;
      }
      
      .main>input{
          width: 100%;
         height: 100%;
      }
      
         .p_text{
         text-align:center;
          color: #E6E6E6;
         position: absolute;
         top: 0px;
         left: 500px;
         font-size: 150px;
         font-weight: bold;
      
      }
      
      .p_text span{
       font-family: 'Permanent Marker', cursive;
      font-size:100px;
      position:relative; 
      }
      
      .mypagebtn{
     
      height: 50px;
	  width: 450px;
      position:absolute;
      top:70%; left:20%;
      background-color:black;
      font-family: 'Permanent Marker', cursive;
      font-size:30px;
      color:white;
      border:1px solid white;
      border-radius:5px; 
      
      }  
        
      .a{
         width: 80%;
         height: 80%;
         position: relative;
      }
      
      .a>div{
         width: 70%;
         height: 70%;
         
         position: relative;
         top: 280px;
      }
      
      .a>div>div{
         width: 50%;
         height: 50%;         
         float:left;
      }
      
      .a>div>div>input{
         width: 100%;
         height: 100%;
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

     
      .body{
         padding: 0px;
         margin: 0px;
         
      }   


</style>
</head>
<body>
<div class="wrapper">
        
        
         <p class="p_text">…Welcome…<br><span>[  ${sessionScope.Success_id}  ]
         <br> 
         <input type="button"  class="mypagebtn" value="->join shoppingƪ( ˘ ⌣˘ )ʃ " 
         onclick="location.href='booklist.do'">
         </span><br>
         </p>
    
          
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
			</li> -->
			
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
</body>
</html>