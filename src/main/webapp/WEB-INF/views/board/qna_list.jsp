<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<%-- <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/style.css"> --%>

	<style type="text/css">
		
  @import url('https://fonts.googleapis.com/css?family=Roboto+Slab&display=swap');
  @import url('https://fonts.googleapis.com/css?family=Permanent+Marker&display=swap');
	
	 *{
         box-sizing: border-box;
      }
      
      div{
         margin: auto;
         text-align: center;
      }	
      
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
      
      .c_text{
         color: #E6E6E6;
         top: 50px;
         left: 30px;
         font-size: 30px;
         font-weight: bold;
         font-family: 'Permanent Marker', cursive;
      }
      
      .q_text{
      	 color: #E6E6E6;
         top: 0px;
         left:100%;
         font-size: 30px;
         font-weight: bold;
         font-family: 'Permanent Marker', cursive;
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
      
       .menu{
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
      
      
	  .td_a{
	  	color:white;
	  	font-weight: bold;
	  }
	  
	  .td_a_1{
	  	color:white;
	  }
	  
	  .td_b_1{
	  	color:white;
	  }
	  
	  .td_c_1{
	  	color:white;
	  }
	  
	  .secret{
	  	color:red;
	  }
	</style>
	
	<script type="text/javascript">
		function check(idx, page, pwd){
			var password =  prompt("PASSWD 입력","");
			
			if(password == ""){
				alert("비밀번호를 입력하세요.");
				return;
			}else if(password != pwd){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}
			
			
			if(page == null){
				page=1;
			}
			
			location.href="qna_view.do?idx="+idx+"&page="+page;
		}	
	</script>
	
</head>

<body>
<div class="wrapper">
 <div class="main">
 
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
			
		<!-- 	<li style="cursor:pointer" class="mypage">
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
         				<a href="logout.do" class="logout">LOGOUT</a> 
         		     <div class="menu">
					 <a href="updateform.do?u_id=${sessionScope.Success_id}">Modify information</a>
			         </div>
	         		</c:if>    
         		</div>
        		
			</li>
		</ul>
	</div>
	 
	 
	 <br><br><br><br><br><br><br><br>
	 	 
	 
	<table width="700" align="center">
	<table width="700" align="center">
		<tr>
			<td>
				<!-- 타이틀 영역 -->
				<table height="50">
					<tr>
						 <div class="contents">
						<td><a href="list.do" class="c_text">Community</a></td> 
						<td> &nbsp;</td>
						<td><a href="qna.do" class="q_text">Q&A</a></td>
						</div>
					</tr>
				</table>
				<!-- 타이틀 영역 -->
			</td>
		</tr>
		
		<!-- 게시판 리스트 시작 -->
		<tr>
			<td>
				<table width="690">
					
					<tr>
						<td width="50" class="td_a">번호</td>
						<td width="2" class="td_a">
							<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
						</td>
						 
						<td width="300" class="td_a">제목</td>
						<td width="2" class="td_a">
							<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
						</td>
						
						<td width="90" class="td_a">작성자</td>
						<td width="2" class="td_a">
							<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
						</td>
						
						<td width="90" class="td_a">작성일</td>
						<td width="2" class="td_a">
							<img src="${ pageContext.request.contextPath }/resources/img/line_1.gif">
						</td>
						
						<td width="60" class="td_a">조회수</td>
					</tr>
					
					
					<c:if test="${list ne null }">
					<c:forEach var="vo" items="${ list }">
					
					<c:if test="${vo.depth eq 0 }">
					<c:if test="${vo.del_info ne -1 }">
			<tr>    
			
				<td align="center" class="td_a_1">${ vo.idx }</td>
				<td class="td_b_1"><img src="${ pageContext.request.contextPath }/resources/img/line_1.gif"></td>
				<td class="td_b_1 left">
					
					
					<!-- 일반게시글은 클릭 가능 -->
					<c:if test="${vo.del_info ne -1 }">
						<!-- <a href="view.do?idx=${vo.idx}&page=${ empty param.page ? 1 : param.page}" class="num"> -->
							<a href="qna_view.do?idx=${vo.idx}&page=${ empty param.page ? 1 : param.page}" class="num">
							
							<c:if test="${vo.ch ne 1 }">
							${ vo.subject }<!-- 제목 -->
							</c:if>
							
							<c:if test="${vo.ch eq 1 }">
								<a href="#" onclick="check('${vo.idx}','${param.page}','${vo.pwd}');" class="secret">비밀글</a> 
							</c:if>

							<c:if test="${vo.del_info eq 1 }">
								<a style="color:#ffff33">re</a>
							</c:if>
							
							<!-- </a> -->
	
						</a>
					</c:if>
					
				</td>
				
				
				
				<td class="td_b_1"><img src="${ pageContext.request.contextPath }/resources/img/line_1.gif"></td>	
				
				<td class="td_b_1" align="center">${vo.name}</td>
				
				<td class="td_b_1"><img src="${ pageContext.request.contextPath }/resources/img/line_1.gif"></td>
				
				<td class="td_b_1" align="center">${vo.regdate}</td>
				
				<td class="td_b_1"><img src="${ pageContext.request.contextPath }/resources/img/line_1.gif"></td>
				
				<td class="td_c_1" align="center">${vo.readhit}</td>
			</tr>
			</c:if>
			</c:if>
		</c:forEach>
		</c:if>
		<!-- 게시판 리스트 끝 -->
					
				<c:if test="${ empty list }">
					<tr>
						<td align="center" colspan="11" 
						    width="100%" height="50"
						 	style="border:2px solid #767676">
							현재 등록된 글이 없습니다
						</td>
					</tr>
				</c:if>
					
				</table>
			</td>
		</tr>
		
		<tr>
			<td height="8"></td>
		</tr>
		
		<tr>
			<td class="f11" align="center">
				${pageMenu}
			</td>
		</tr>
		
		<tr>
			<td height="5"></td>
		</tr>
		
		<!-- 게시글 작성  -->
		<tr>
			<td align="right">
				<a href="insert_form.do?idx=${idx }">[등록]</a>
			</td>
		</tr> 
		
	</table>
</div>
</div>	
</body>

</html>










































