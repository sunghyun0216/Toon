<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Required meta tags -->
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- BootStrap -->    
<!--     <link rel="icon" href="images/favicon.png" type="image/png">  위에 로고-->
    <c:import url="../fragments/bootstrap.jsp"></c:import>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
   
    <!-- main css -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    
    <style type="text/css">
     .back {
    	background-image: url('../images/toon-qna1.PNG');
    	background-size : 500px;
    	border-style: solid;
    	border-color: #FFE150;
     }
     .thead {
    	text-align: center;
     	background-color: #FFFF96;
     	border-style: solid;
     	border-color: #FFE150;
     }
     .tbody {
      	text-align: center;
     	background-color: #FAFAD2;
     	border-style: solid;
     	border-color: #FFE150;
     }

  
    
    </style>
<title>WEBTOON QNA PAGE</title>

</head>
<body>
<c:import url="../fragments/header.jsp"></c:import>
        
<div class="back">
<div class="container"><br>
		<h2><p><span style="border-radius: 15px 15px 15px 0; border: 3px solid #FFE150; 
		padding: 0.5em 0.6em; color: black; background-color:#FFFF96; ">질문/답변</span></p></h2><br>
		<table class="table">
			
			<thead class="thead">
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			
			
			<tbody class="tbody">
			<c:forEach items="${qnaList}" var="vo" >
				<tr>
	
					<td><a href="./qnaSelect?boNum=${vo.boNum}">
					
					
					
					<c:catch>
					<c:forEach begin="1" end="${vo.depth}">
					&#x279C;
					</c:forEach>
					</c:catch>
					${vo.qnaTitle}
					</a></td>
					<td>${vo.username}</td>
					<td>${vo.createdDate}</td>
					<td>${vo.qnaHit}</td>
				</tr>
			</c:forEach>
			</tbody>
		
		</table>
	</div>
	
	<div class="container">
	  <ul class="pagination">
	  
	  <c:if test="${pager.pre}">	
	    <li class="page-item"><a class="page-link p" href="#" title="${pager.startNum-1}">이전</a></li>
	   </c:if>
	   
	   <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
	   
	    <li class="page-item"><a class="page-link p" href="#" title="${i}">${i}</a></li>
	   </c:forEach>
	   
	    <c:if test="${pager.next}">
	    <li class="page-item"><a class="page-link p" href="#" title="${pager.lastNum+1}">다음</a></li>
	    </c:if>
	  </ul>
	  
	<div class="input-group mt-3 mb-3">
	<form id="frm" action="./qnaList" class="form-inline">
		<input type="hidden" name="curPage" value="1" id="curPage">
	  <div class="input-group-prepend">
	   <select class="form-control" name="kind" id="kind"> 
	    <option class="sel">제목</option>
	    <option class="sel">작성자</option>
	  </select>
	  </div>
	  <input type="text" class="form-control" name="search" id="search" value="${pager.search}" placeholder="">
	    <div class="input-group-append">
	    <button class="btn btn-warning" type="submit">검색</button>
	  </div>
	 </form> 
	 
	</div> 
	<a href="./qnaInsert" class="btn btn-warning"  role="button">작성</a>
	</div>

<script type="text/javascript">
	let kind= '${pager.kind}';//Title, Writer, Contents
	$(".sel").each(function() {
		let t = $(this).text();//Title, Writer, Contents
		if(t == kind){
			$(this).prop("selected", true);
		}
	});
	
	$(".p").click(function () {
		let curPage = $(this).attr("title");
		$("#curPage").val(curPage);
		let search= '${pager.search}';
		$("#frm").submit();

	});
</script>  
</div>
</body>
</html>