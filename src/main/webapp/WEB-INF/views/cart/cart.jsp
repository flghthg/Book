<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

   <script>
      function modify(f) {
         
         var c_cnt= f.c_cnt.value.trim();
         
         //수량이 정수인지 확인
         var num_patt = /^[0-9]+$/;
         if(!num_patt.test(c_cnt)){
            alert("수량은 정수로 입력하세요");
            return;
         }
         f.submit();
         
      }
      
      function del(c_idx) {
         alert(c_idx);
         if(!confirm("정말로 삭제하시겠습니까??")){
            return;
         }
         location.href= "cart_delete.do?c_idx="+c_idx;   
      }
      
      function buy(id) {
         alert(id);
         location.href= "buy2.do?id="+id;
      }
   </script>
   
   <style>
@import
   url('https://fonts.googleapis.com/css?family=Roboto+Slab&display=swap')
   ;

@import
   url('https://fonts.googleapis.com/css?family=Permanent+Marker&display=swap')
   ;

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
/*     
 .infor{
 
 
 text-decoration: none;
	  color: white;
	  line-height:37px;
	   font-weight:normal;
 
 }   */   

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

   
.jang{

   width : 100%;
   height :100%;
   color : white;
   background : black;
   position: absolute;
      
}
.jangmain{
   position: relative;
   margin-top: 8%;
    
}
.button{

      position: relative;
      left: 60%;
}
</style>
</head>
<body>
   <div class = "jang">
   
   
   <div class ="jangmain"  >
   <h2 align="center"> 장바구니 </h2>
   
   <table align ="center" border = "1" width = "65%">
      <tr align ="center">
         <td colspan = "6">장바구니 내용</td>
      </tr>
      
      <tr bgcolor = "white" style="color: black;"> <!-- tr의 배경 색을 따로 쓸수 있는 명령어 -->
      
         <th width="20%">책이름</th>   
         <th>금액</th>
         <th>수량</th>
         <th>총액</th>
         <th>삭제</th>
      </tr>
      <c:forEach var="vo" items = "${list}">
      
         <tr align ="center">
         
            <td>${vo.b_name}</td>
            <td>
            <fmt:formatNumber value="${vo.b_price}"/><br>
   
            </td>
         
         <td>
            <!-- 수량조절 폼 -->
            <form action = "cart_update.do">
               <input type ="hidden" name = "c_idx" value ="${vo.c_idx}">
               <input name ="c_cnt" size ="2" align ="center"
                     value="${vo.c_cnt}">
               <input type ="button" value="수정" onclick="modify(this.form);">    <!-- 서브밋은 그냥 유효성 체크없이 바로 서블릿으로 넘기는 것 -->
            </form>
         </td>
         
         <td><fmt:formatNumber value ="${vo.c_cnt*vo.b_price}"/></td>
         
         <td>
            <input  type = "button" value = "삭제"
                  onclick="del('${vo.c_idx}');">
         </td>
      </tr>
      </c:forEach>
      
      <c:if test = "${empty list}">
      
      <tr>
         <td colspan = "6" align ="center">
            장바구니가 비었습니다.
         </td>
      </tr>
         
      </c:if>
      
      <tr>
         <td colspan = "5" align="right">
            총 결제액
         </td>
         
      </tr>
      
   </table>
   </div>
   
   <div class="button">
      <input type="button" value='홈으로 돌아가기'; onclick="location.href='main.do'">
   </div>
   <div class="button">
      <input type="button" value='구매하기'; onclick="buy('${sessionScope.Success_id}')">
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
         				 <div class="menu">
			    
					 <a href="" onclick="updateform.do?u_id=${sessionScope.Success_id}">Modify information</a>
			       
			         </div>
	         		</c:if>    
         		</div>
         </li>
      </ul>
   </div>

</body>
</html>