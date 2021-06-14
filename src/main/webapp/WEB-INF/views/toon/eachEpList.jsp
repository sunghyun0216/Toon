<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../fragments/bootstrap.jsp"></c:import>
<title>Insert title here</title>
<link rel="stylesheet" href="../css/header.css">
</head>
<body>
<c:import url="../fragments/header.jsp"></c:import>
	
	<!-- 리스트 -->

		<table cellpadding="0" cellspacing="0" class="viewList">
		<%-- <caption><span class="blind">회차별 목록</span></caption> --%>
		<col width="99"><col width="*"><col width="141"><col width="76">
		<thead>
		<tr>
			<th scope="col">이미지</th>
			<th scope="col">제목</th>
			<th scope="col">별점</th>
			<th scope="col">등록일</th>
		</tr>			
		</thead>
		
		<tbody>
		<c:forEach items="${epVO}" var="epVO">
			<tr>
				<td class="imgalign">
					<a href="/toon/eachEpSelect?toonNum=${epVO.toonNum}&epNum=${epVO.eachEpNum}" onclick="nclk_v2(event,'lst.img','${epVO.toonNum}','${epVO.eachEpNum}')">
					<img alt="${epVO.epSumImg}" 
						src="${pageContext.request.contextPath}/resources/uploaded/toon/eachEp/${epVO.epSumImg}"
						title="${epVO.eachEpNum}화" alt="${epVO.eachEpNum}화" width="71" height="41" 
						onERROR="this.src='https://ssl.pstatic.net/static/comic/images/migration/common/non71_41.gif'">
						<span class="mask"></span>
					</a>
				</td>
				<td class="title">
				<a href="/toon/eachEpList?toonNum=${epVO.toonNum}&epNum=${epVO.eachEpNum}" onclick="nclk_v2(event,'lst.title','${epVO.toonNum}','${epVO.eachEpNum}')">
				${epVO.eachEpNum}화</a>
				</td>
				<td>
					<div class="rating_type">
						<span class="star"><em style="width:${epVO.toonVO.ratingSum}/${epVO.toonVO.ratingPerson}*10%">평점</em></span>
						<strong>${epVO.toonVO.ratingSum}/${epVO.toonVO.ratingPerson}</strong>
					</div>
				</td>
				<td class="num"><span>${epVO.epDate}</span></td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
		
		<div class="container">
		 	<ul class="pagination">
	  
	  		<c:if test="${pager.pre}">	
	   		 <li class="page-item"><a class="page-link p" href="#" title="${pager.startNum-1}">Previous</a></li>
	   		</c:if>
	   
	  		 <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
	   
	   		 <li class="page-item"><a class="page-link p" href="#" title="${i}">${i}</a></li>
	   		</c:forEach>
	   
	   		 <c:if test="${pager.next}">
	   		 <li class="page-item"><a class="page-link p" href="#" title="${pager.lastNum+1}">Next</a></li>
	   		 </c:if>
	 		 </ul>
		</div>



</body>
</html>