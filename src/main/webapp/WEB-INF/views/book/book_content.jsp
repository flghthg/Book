<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

   <script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
   
   <script type="text/javascript">
   
   function su(){
      var f = document.form;
      var su = document.getElementById("cnt").value;
      f.count.value = su;
      //alert(f.count.value);
      
   }
   
   function sale(f, idx, id){
      
      if(f.count.value == 0){
         alert("수량을 선택해주세요");
         return;
      }else{
         if(${sessionScope.Success_id eq null}){
            alert("먼저 로그인을 해주세요/");
            f.action = "login_form.do";
            f.submit();
         }else{
            location.href = "buy.do?idx="+idx+"&cnt="+ f.count.value+"&id="+id;
         }
      }
   }
   
      
   
   function addCart(p_idx, m_idx) {
      if(${sessionScope.Success_id eq null}){
         alert("먼저 로그인을 해주세요/");
          location.href="login_form.do";
         }else{
          var url = "cart_insert.do?p_idx="+p_idx+"&m_idx="+m_idx;
        
          sendRequest(url, null, resultFn, "GET");
         } 
   }
      
   function resultFn(){
      
      
      if( xhr.readyState == 4 && xhr.status == 200 ){
         var data = xhr.responseText;
         var json = eval(data);
         
         if( json[0].result == 'yes' ){
            alert("장바구니에 담았습니다");
            
            if(!confirm("장바구니로 이동하시겠습니까?")){
               return;
            }
            location.href="cart_list.do?m_idx="+json[1].m_idx;
         }else{
            alert("해당 상품은 이미 장바구니에 담겨져 있습니다");   
            location.href="cart_list.do?m_idx="+json[1].m_idx;
         }
      }
      
   }
      
   function text(f){
      
      //유효성 체크 로그인이 안되어있을경우 로그인창을띄워줌.
      if(${sessionScope.Success_id eq null}){
      alert("먼저 로그인을 해주세요");
       location.href="login_form.do";
      }
      
   } 
         var s1=1;var s2=1;var s3=1;var s4=1;var s5=1; var star=0;
      
      function star1(){
          var star1=document.getElementById("star1");
          var star2=document.getElementById("star2");
          var star3=document.getElementById("star3");
          var star4=document.getElementById("star4");
          var star5=document.getElementById("star5");
         var content=document.getElementById("content");
         
         if( 1 == (s1%2) ){
            star1.style.color="yellow";
            star2.style.color="white";
            star3.style.color="white";
            star4.style.color="white";
            star5.style.color="white";
            content.value="별로에요";
            s1++;
            star=1;
         }else if(1 != (s1%2) ) {
            star1.style.color="white";
            star2.style.color="white";
            star3.style.color="white";
            star4.style.color="white";
            star5.style.color="white";
            content.value="";
            s1++;star=0;
         }
         /*location.href="star.do?star="+1; +"&s="+s1 */
      }
      
      function star2(){
          var star1=document.getElementById("star1");
          var star2=document.getElementById("star2");
          var star3=document.getElementById("star3");
          var star4=document.getElementById("star4");
          var star5=document.getElementById("star5");
          var content=document.getElementById("content");
          
          if( 1 == (s2%2) ){
             star1.style.color="yellow";
               star2.style.color="yellow";
               star3.style.color="white";
               star4.style.color="white";
               star5.style.color="white";
               content.value="그다지 추천하지않아요";
               s2++;  
               star=2;
         }else if(1 != (s2%2) ) {
            star1.style.color="white";
            star2.style.color="white"; 
            star3.style.color="white";
            star4.style.color="white";
            star5.style.color="white"; 
               content.value="";
               s2++;star=0;
         }
         /* location.href="star.do?star="+2; +"&s="+s2 */
      }
      
      function star3(){
          var star1=document.getElementById("star1");
          var star2=document.getElementById("star2");
          var star3=document.getElementById("star3");
          var star4=document.getElementById("star4");
          var star5=document.getElementById("star5");
          var content=document.getElementById("content");
          
          if( 1 == (s3%2) ){
             star1.style.color="yellow";
               star2.style.color="yellow";
               star3.style.color="yellow";
               star4.style.color="white";
               star5.style.color="white";
               content.value="그냥그래요";
               s3++;
               star=3;
         }else if(1 != (s3%2) ) {
            star1.style.color="white";
            star2.style.color="white";
            star3.style.color="white";
            star4.style.color="white";
            star5.style.color="white"; 
               content.value="";
               s3++;star=0;
         }
          /*location.href="star.do?star="+3; +"&s="+s3 */
      }
      
      function star4(){
          var star1=document.getElementById("star1");
          var star2=document.getElementById("star2");
          var star3=document.getElementById("star3");
          var star4=document.getElementById("star4");
          var star5=document.getElementById("star5");
          var content=document.getElementById("content");
          
          if( 1 == (s4%2) ){
             star1.style.color="yellow";
               star2.style.color="yellow";
               star3.style.color="yellow";
               star4.style.color="yellow";
               star5.style.color="white";
               content.value="추천합니다";
               s4++;
               star=4;
         }else if(1 != (s4%2) ) {
            star1.style.color="white";
            star2.style.color="white";
            star3.style.color="white";
            star4.style.color="white";
             star5.style.color="white"; 
               content.value="";
               s4++;star=0;
         }
          /* location.href="star.do?star="+4;+"&s="+s4 */
      }
      
      function star5(){
          var star1=document.getElementById("star1");
          var star2=document.getElementById("star2");
          var star3=document.getElementById("star3");
          var star4=document.getElementById("star4");
          var star5=document.getElementById("star5");
          var content=document.getElementById("content");
          
          if( 1 == (s5%2) ){
               star1.style.color="yellow";
               star2.style.color="yellow";
               star3.style.color="yellow";
               star4.style.color="yellow";
               star5.style.color="yellow";
               content.value="인생도서!추천합니다";
               s5++;
               star=5;
         }else if(1 != (s5%2) ) {
               star1.style.color="white";
               star2.style.color="white";
               star3.style.color="white";
               star4.style.color="white";
               star5.style.color="white";
               content.value="";
               s5++;
               star=0;
         }
          /*location.href="star.do?star="+5; +"&s="+s5 */
      }
      
      function review(r_book,name){
         var r_content=document.getElementById("content").value;
         
         //유효성체크
         if(r_content == ""){
            alert("감상평을 입력하세요");
            return;
         }
         if(star == 0){
            alert("별점을 체크해주세요");
            return;
         }
         
         if(${sessionScope.Success_id eq null}){
            alert("먼저 로그인을 해주세요");
             location.href="login_form.do";
             return;
         }
         
         
         location.href="review.do?name="+name+"&r_book="+r_book+"&r_content="+r_content+"&star="+star;
      }
      
   </script>
   <link
   href="${ pageContext.request.contextPath }/resources/css/book_content.css"
   rel="stylesheet" type="text/css" />
   <style type="text/css">
   
   .bt{
         position:absolute;
         left:80%;
         width:8%; 
         height:13%;
          font-size:20px;
          margin-left:-10px;
         border-color: transparent;
          color: wihte;
      } 
      
      a{
         color:white;
         font-size:30px;
      }
     
     .star{
        position:absolute;
        width:9%;
        height:16%;
        border-radius: 100px;
        display:inline-block;
         font-size:18px;
         border-color: transparent;
         border: none;
          color: #353535;
          /* font-weight: bold; */
        background-color:lightgray;
        left:20%;
     }
     
     .starfloat{
        position:absolute;
        /* height:10%; */
        left:55%;
        font-weight: bold;
     }
     
     .stardiv{
        position:relative;
        left:262px; 
        top:33px;
     }
     
     .td{
        position:absolute;
        left:50%;
     }
     
     .a{
        font-size:20px;
     }
   
   </style>
   
   <link href="${ pageContext.request.contextPath }/resources/css/book_content.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="navi.jsp"/>
   <form name="form">

      <input type="hidden" name="count">


   <div class="main margin">
      <div id="content1">
         <ul class="one clearfix">
            <li><img src="${ pageContext.request.contextPath }/resources/img/${ vo.b_image_l }"></li>
            <li>
               <ul class="two">
                  <li>장르 : ${vo.category }</li>
                  <li>제목 : ${vo.b_name }</li>
                  <li>출판사 : ${vo.b_company }</li>
                  <li>가격 :<fmt:formatNumber value="${vo.b_price}" /></li>
                  <li>
                     수량 : <select id="cnt" name="cnt" onchange="su();">
                           <option value="0">수량을 선택해주세요</option>
                           <option value="1">1</option>
                           <option value="2">2</option>
                           <option value="3">3</option>
                           <option value="4">4</option>
                           <option value="5">5</option>
                     </select>
                  </li>
                  <li align="center">
               <input type="button" value="구매" onclick="sale(this.form,'${vo.idx}','${sessionScope.Success_id}');" /> 
               <input type="button"value="장바구니에 담기" onclick="addCart('${vo.idx}', '${vo_l.idx}');" /></li>
               </ul>
            </li>
            
         </ul>
      </div>
      
      </form>
      <hr>
      
      <div id="content2">
         ${ vo.b_content }
      </div>
      <br>
      <hr>
         <br> 
             <button class="star" disabled>구매자<br/>평점</button>
            
            <div class="stardiv"  >
               <c:forEach begin="1" end="${sta }" step="1" varStatus="status">
               <a style="color:#C97CA3">★</a> 
               </c:forEach>
               <c:forEach begin="1" end="${5-sta }" step="1" varStatus="status">
               <a style="color:white">★</a>
               </c:forEach>
            </div>
            
            <a style="color:white" class="starfloat">${star }</a>
            
          <br><br><br><br>
      <ul> 
         
         <li style="color:white">구매자리뷰</li>
         
      
         <a id="star1" onclick="star1();">★</a>
         <a id="star2" onclick="star2();">★</a>
         <a id="star3"  onclick="star3();">★</a>
         <a id="star4" onclick="star4();">★</a>
         <a id="star5" onclick="star5();">★</a>
      
      
      
         <li><textarea id="content" rows="5" cols="90" onclick="text();"></textarea>
             <input class="bt" type="button" value="등록" onclick="review('${vo.b_name}','${sessionScope.Success_id}');"></li>
         
      </ul>
      <br>
      <hr>
      <br>
      <c:if test="${not empty rlist }">
      <c:forEach var="r" items="${rlist }">
      <table>
      
         <tr >   
            <td rowspan="2">
            <c:forEach begin="1" end="${r.star }" step="1" varStatus="status">
            <a class="a" style="color:yellow">★</a> 
            </c:forEach>
            <c:forEach begin="1" end="${5-r.star }" step="1" varStatus="status">
            <a class="a" style="color:white">★</a>
            </c:forEach>
            </td>
            
            <td style="color:white">&nbsp;&nbsp; ${r.r_content}<%--  ${ }로 위에 textarea에서 쓴 50자평을 가지고와서 보여줌--%></td>
            
         </tr>

         <tr>
            <td style="color:white">&nbsp;&nbsp; ${r.name}<!-- 세션에서 끌어온 이름 --></td>
            <td style="color:white" class="td">${r.regdate}</td>
         </tr>
      
      
      </table>
      <br>
      </c:forEach>   
      </c:if>
   </div>   
      
</body>
</html>