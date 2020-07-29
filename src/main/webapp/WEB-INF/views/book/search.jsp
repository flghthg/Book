<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
	
		function search(f){
			var in_name=document.getElementById("in_name").value.trim();
			var b_name = new Array();
			
			if(in_name==''){
				alert("도서명을 입력하세요");
				return;
			}
			
			location.href="search.do?in_name="+in_name;
			
			/* for(var i=0;i<100;i++){
				b_name[i]=document.getElementsByName("b_name")[i];
			}					
			 for(var i=0;i<100;i++){
				if(in_name == b_name[i].value.trim()){
					
				}
			}	 */
			
			/*   for(var i=0;i<100;i++){ 
				if( in_name != b_name[i].value.trim()){//실제 이름과 비교해준다.
					alert("해당 도서가 존재하지 않습니다.");
				 	return; 
				} 
			 }  */
			  
		
			
			//f.action="search.do";//컨트롤러로 받은 이름을 보내서 컨트롤러에서 도서목록디비에 저장되어있는모든정보를 가지고와서 받은 이름이랑 같은 이름의 도서가 있을경우 도서보여지는 리스트를 호출해 해당도서만 보여지게끔 해준다.
			//f.submit();
		}
	</script>
	
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
         height: 3200px;
      	background-color:black;
      	opacity: 80%;
      }
      
      .close{
      color:black;
      	background-color:white;
      	opacity:100%;
      	 position: absolute;
         right:10%;
      }
      
      .in{
      	position:absolute;
      	width:40%;
      	left:30%;
      	height:6%;
      	top:430px;
      	opacity:100%;
      	border: 3px solid gray;
      	border-radius: 24px;
      }
      
      .bt{
      	position:absolute;
      	left:68%;
      	width:3%; 
      	height:6%;
      	top:430px;
      	border-radius: 53px;
      	 display:inline-block;
      	 font-size:20px;
      	 margin-left:-10px;
      	background-color: transparent !important;
      	border-color: transparent;
    	border: none;
   	 	color: #FFFFFF;
      } 
      
      .p{
      	position:absolute;
      	left:50%;
      	top:230px;
      	}
      	 .main{
         height: 30%;
         text-decoration-color: green;
         position: relative;
         background-color: black;
      }
      
       .p_text{
          color: #E6E6E6;
         position: absolute;
         top: 190px;
         left: 100px;
         font-size: 250px;
         font-weight: bold;
      }
      
      
      .navi{
         width: 99.3%;
         height: 60px;
         position: fixed;
         top: 0px;
         left: 10px;
         text-align:center;
         
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
         width: 20%;
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
      
       .menu{
         width: 100%;
         height: 150px;
         line-height:37px;
      }
      .menu>div>a{
         text-decoration: none;
         color: white;
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
      			font-weight: bold;
      			text-decoration:none;
      			color:#fff;}
      

      
      a{color:white;
      	text-decoration:none;}
	  a:hover{color:yellow;}
	  	
		.contents{
         height: 30%;
      }	
		.contents>div{
         width: 30%;
         height: 100%;
         float: left;
         background-color: black;
         position: relative;
      }
		
	.wrapper{
         height: 1000px;
         background-color:black;
      }
      
      .main{
         height: 30%; 
         text-decoration-color: green;
         position: relative;
         background-color: black;
      }
      
      .main>input{
          width: 100%;
         height: 100%;
      }
      
      input[type='button']:hover{
      		color:blue;
			background-color:#ff0033;
		}
      </style>
	
</head>
<body>

	  <div class="wrapper">

     <div class="main">
     <div class="navi">
		<ul>
			<li class="mainview" onclick="location.href='main.do'">
				<a>HOME</a>
				<div class="home"></div>
			</li>
			
			<li class="store">
				<a>BOOK STORE</a>
				<div class="menu">
					<div>
						<a href="booklist.do">Book List</a>
					</div>
				</div>
			</li>
			
			<li class="mypage">
				<a href="updateform.do"> My Page</a>
			</li>
			
			<li class="view">
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
			
			<li class="login">
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
     
</div>

   <p class="p_text">book</p>
        
      
	  		<!-- <input type="button" value="X" class="close" onclick="location.href='mainview.do'">-->
	  		
	  		<form action="">
	  		<c:forEach var="list" items="${list}">
		  		<input type="hidden" name="b_name" value="${list.b_name }">
		  	</c:forEach>
		  	
		  		<input class="in" id="in_name" placeholder="도서명입력">
		  		<input class="bt" type="button" value="🔍" onclick="search(this.form);"><!-- location.href='search.do?name=in_name' -->
	  		
	  		</form>
	  		
	  </div>
</body>
</html>