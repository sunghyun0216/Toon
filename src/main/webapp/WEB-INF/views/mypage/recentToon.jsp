<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
    <c:import url="../fragments/bootstrap.jsp"></c:import>
    <title>Recent Toon</title>
   
     <link rel="stylesheet" href="/css/header.css">
     <!-- plugins:css -->
    <link rel="stylesheet" href="../assets/vendors/iconfonts/mdi/css/materialdesignicons.css">
    <!-- endinject -->
    <!-- vendor css for this page -->
    <!-- End vendor css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="/css/mypage/style.css">
    <!-- Layout style -->
    <link rel="shortcut icon" href="../asssets/images/favicon.ico" />
</head>
<body>
	<c:import url="../fragments/header.jsp"></c:import>	

    <!-- partial -->
    <div class="page-body">
      <!-- partial:partials/_sidebar.html -->
      <div class="sidebar">
        <div class="user-profile">
          <div class="display-avatar animated-avatar">
            <c:if test="${memberVO.joinFileVO.fileName eq null}"><img width=180px height=200px alt="" src="/images/member.jpg"></c:if>
			<c:if test="${memberVO.joinFileVO.fileName ne null}"><img width=180px height=200px alt="" src="/upload/member/${memberVO.joinFileVO.fileName}"></c:if>
          </div>
          <div class="info-wrapper">
            <p class="user-name">${memberVO.name}님</p>
            <h6 class="display-income">${memberVO.point}point</h6>
          </div>
        </div>
        <ul class="navigation-menu">
          <li class="nav-category-divider">MAIN</li>
          <li>
            <a href="/member/myPage">
              <h4><span class="link-title">내정보 수정</span></h4>
              <i class="mdi mdi-gauge link-icon"></i>
            </a>
          </li>
         
          <li>
            <a href="#ui-elements" data-toggle="collapse" aria-expanded="false">
              <h4><span class="link-title">웹툰</span></h4>
              <i class="mdi mdi-bullseye link-icon"></i>
            </a>
            <ul class="collapse navigation-submenu" id="ui-elements">
              <li>
                <a href="/mypage/recentToon/?username=${memberVO.username}">최근 본 웹툰</a>
              </li>
              
              <li>
                <a href="/mypage/favoriteToon/?username=${memberVO.username}">관심 웹툰</a>
              </li>
              <li>
                <a href="/mypage/useToon/?username=${memberVO.username}">소장 웹툰</a>
              </li>
            </ul>
          </li>
          <li>
            <a href="#sample-pages" data-toggle="collapse" aria-expanded="false">
              <h4><span class="link-title">댓글</span></h4>
              <i class="mdi mdi-flask link-icon"></i>
            </a>
            <ul class="collapse navigation-submenu" id="sample-pages">
              <li>
                <a href="pages/sample-pages/login_1.html" target="_blank">내 댓글 조회</a>
              </li>
              
            </ul>
          </li>
          <li>
            <a href="pages/forms/form-elements.html">
             <h4> <span class="link-title">충전하기</span></h4>
              <i class="mdi mdi-clipboard-outline link-icon"></i>
            </a>
          </li>
          <li>
            <a href="pages/charts/chartjs.html">
              <h4><span class="link-title">작가등록</span></h4>
              <i class="mdi mdi-chart-donut link-icon"></i>
            </a>
          </li>
 
        </ul>
        
      </div>
      <!-- partial -->
      <div class="page-content-wrapper">
           <div class="container">	

		<h2>최근본웹툰</h2>

		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th></th>
					<th>웹툰 이름</th>
					<th>에피소드 이름</th>
					<th>작가 이름</th>
					<th>최근 본 날짜</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach items="${list}" var="list" >
				<tr>
					<td><img width=50px height=50px src= ${list.eachEpVO.epSumImg}></td>
					
					<td>${list.toonVO.toonTitle}</td>
					<td>${list.eachEpVO.epTitle}</td>
					<td>${list.memberVO.nickname}</td>
					<td>${list.viewDate}</td>
				</tr>
			</c:forEach>
			
			</tbody>

		</table>
	</div>
           
  	
			<ul class="pagination">

				<c:if test="${pager.pre}">
					<li class="page-item"><a class="page-link p" href="#"
						title="${pager.startNum-1}">이전</a></li>
				</c:if>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item"><a class="page-link p" href="#" 
					title="${i}">${i}</a></li>
				</c:forEach>

				<c:if test="${pager.next}">
					<li class="page-item"><a class="page-link p" href="#"
					 title="${pager.lastNum+1}">다음</a></li>
				</c:if>
			</ul>
  			
  			<div class="input-group mt-3 mb-3">
				<form id="frm" action="./#" class="form-inline">
					<input type="hidden" name="curPage" value="1" id="curPage">
					<div class="input-group-prepend">
						<select class="form-control" name="kind" id="kind">
							<option class="sel">공지종류</option>
							<option class="sel">제목</option>
						</select>
					</div>
					&nbsp;&nbsp; <input type="text" class="form-control" name="search" id="search" value="${pager.search}" placeholder="입력하세요">
					&nbsp;&nbsp;
					<div class="input-group-append">
						<button class="btn btn-secondary" type="submit">검색</button>
					</div>
				</form>
			</div>
	

	</p>
        <div class="page-content-wrapper-inner">
          <div class="content-viewport">
            <div class="row">
              <div class="col-12 py-5">
                <p class="text-gray">
           
              </div>
            </div>
      </div>
      </div>
    </div>
    <script src="../assets/vendors/js/core.js"></script>
    <script src="../assets/vendors/apexcharts/apexcharts.min.js"></script>
    <script src="../assets/vendors/chartjs/Chart.min.js"></script>
    <script src="../assets/js/charts/chartjs.addon.js"></script>
    <script src="../assets/js/template.js"></script>
    <script src="../assets/js/dashboard.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript" src="../js/mypage.js"></script>
    
    	<script type="text/javascript">
// 	let kind= '${pager.kind}';//Title, Writer, Contents
// 	$(".sel").each(function() {
// 		let t = $(this).text();//Title, Writer, Contents
// 		if(t == kind){
// 			$(this).prop("selected", true);
// 		}
// 	});
	
// 	$(".p").click(function () {
// 		let curPage = $(this).attr("title");
// 		$("#curPage").val(curPage);
// 		let search= '${pager.search}';
// 		$("#frm").submit();

// 	});
	
	</script>
	
	
</body>
</html>