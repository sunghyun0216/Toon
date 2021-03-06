<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
    <c:import url="../fragments/bootstrap.jsp"></c:import>
    <title>change password</title>
   
    <link rel="stylesheet" href="/css/header.css">
     <!-- plugins:css -->
    <link rel="stylesheet" href="../assets/vendors/iconfonts/mdi/css/materialdesignicons.css">
    <!-- endinject -->
    <!-- vendor css for this page -->
    <!-- End vendor css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="/css/mypage/style.css">
    <link rel="stylesheet" href="/css/join.css">
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
            <c:if test="${memberVO.joinFileVO.fileName eq null}"><img width=180px height=200px alt="" src="../images/member.jpg"></c:if>
			<c:if test="${memberVO.joinFileVO.fileName ne null}"><img width=180px height=200px alt="" src="../upload/member/${memberVO.joinFileVO.fileName}"></c:if>
          </div>
          <div class="info-wrapper">
            <p class="user-name">${memberVO.name}님</p>
            <h6 class="display-income">${memberVO.point}point</h6>
          </div>
        </div>
        <ul class="navigation-menu">
          <li class="nav-category-divider">MAIN</li>
          
           <li>
            <a href="#sample-pages" data-toggle="collapse" aria-expanded="false">
              <h4><span class="link-title">내 정보</span></h4>
              <i class="mdi mdi-flask link-icon"></i>
            </a>
            <ul class="collapse navigation-submenu" id="sample-pages">
              <li>
                <a href="/member/myPage">내 정보 조회</a>
              </li>
              
               <li>
                <a href="/member/changePassword">비밀번호 변경</a>
              </li>
              
            </ul>
          </li>
         
          <li>
            <a href="#ui-elements" data-toggle="collapse" aria-expanded="false">
              <h4><span class="link-title">웹툰</span></h4>
              <i class="mdi mdi-bullseye link-icon"></i>
            </a>
            <ul class="collapse navigation-submenu" id="ui-elements">
              <li>
                <a href="${pageContext.request.contextPath}../mypage/recentToon/?username=${memberVO.username}">최근 본 웹툰</a>
                
              </li>
              <li>
                <a href="${pageContext.request.contextPath}../mypage/favoriteToon/?username=${memberVO.username}">관심 웹툰</a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}../mypage/useToon/?username=${memberVO.username}">소장 웹툰</a>
              </li>
            </ul>
          </li>
          
          <li>
            <a href="#sales_inquiry" data-toggle="collapse" aria-expanded="false">
             <h4> <span class="link-title">포인트 관리</span></h4> 
              <i class="mdi mdi-clipboard-outline link-icon"></i>
            </a>
             <ul class="collapse navigation-submenu" id="sales_inquiry">
              <li>
                <a href=" ${pageContext.request.contextPath}../mypage2/pointCharge/?username=${memberVO.username}">포인트 충전 내역 조회</a>
           
              </li>
              <li>
                <a href=" ${pageContext.request.contextPath}../mypage2/pointUse/?username=${memberVO.username}">포인트 사용 내역 조회</a>
              </li>
            </ul>
          </li>
          
          <li>
            <a href="#payment_manage" data-toggle="collapse" aria-expanded="false">
             <h4>  <span class="link-title">소장권 관리</span></h4>
              <i class="mdi mdi-clipboard-outline link-icon"></i>
            </a>
             <ul class="collapse navigation-submenu" id="payment_manage">
              <li>
                <a href="${pageContext.request.contextPath}../mypage2/ticketCharge/?username=${memberVO.username}">소장권 구매 내역 조회</a>
              </li>
              <li>
                <a href="${pageContext.request.contextPath}../mypage2/ticketUse/?username=${memberVO.username}">소장권 사용 내역 조회</a>
              </li>
            </ul>
          </li>
          
            <li>
            	<a href="${pageContext.request.contextPath}../mypage/review/?username=${memberVO.username}">
             	<h4> <span class="link-title">내 댓글</span></h4>
            	  <i class="mdi mdi-clipboard-outline link-icon"></i>
            	</a>
          	 </li>
          
          
          <li>
            <a href="${pageContext.request.contextPath}/point/charge">
             <h4> <span class="link-title">충전하기</span></h4>
              <i class="mdi mdi-clipboard-outline link-icon"></i>
            </a>
          </li>
        
        </ul>
        
      </div>
      <!-- partial -->
      <div class="page-content-wrapper">
          <h2><label for="inputPassword6"><비빌번호 변경></label></h2>

	<div class="form-group">
    &nbsp;&nbsp;&nbsp;<label for="inputPassword6">현재 비밀번호</label>
    <input type="password" id="password" name=password class="form-control mx-sm-3" aria-describedby="passwordHelpInline">
    &nbsp;&nbsp;&nbsp; <small class="text-muted"> Must be 8-16 characters long.</small>
    <div class="form-group" id= pwResult></div>
  	</div>
  	
  	<div class="form-group">
     &nbsp;&nbsp;&nbsp;<label for="inputPassword6">변경 비밀번호</label>
    <input type="password" id="newpassword" name=newpassword class="form-control mx-sm-3" aria-describedby="passwordHelpInline">
    <small id="passwordHelpInline" class="text-muted">
   	 &nbsp;&nbsp;&nbsp;  Must be 8-16 characters long.
    </small>
     <div class="form-group" id= pwResult2></div>
  	</div>
  	
  	<div class="form-group">
     &nbsp;&nbsp;&nbsp;<label for="inputPassword6">변경 비밀번호 확인</label>
    <input type="password" id="newpassword2" name=newpassword2 class="form-control mx-sm-3" aria-describedby="passwordHelpInline"> 
    <small id="passwordHelpInline" class="text-muted">
     &nbsp;&nbsp;&nbsp; Must be 8-16 characters long.
    </small>
     <div class="form-group" id= pwResult3>
  	</div>

	
	<sec:authorize access="isAuthenticated()">
		&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-info" role="button" onclick="change()">비밀번호 변경</button><br><br><br>
		
          <h2><label for="inputPassword6"><회원 탈퇴></label></h2>
		
		<div class="form-group">
     	&nbsp;&nbsp;&nbsp;<label for="inputPassword6">현재 비밀번호 입력</label>
		
		<input type="password" id="passwordCheck" name=passwordCheck class="form-control mx-sm-3" aria-describedby="passwordHelpInline"> 
    	<small id="passwordHelpInline" class="text-muted"> &nbsp;&nbsp;&nbsp; Must be 8-16 characters long. </small>
		<div class="form-group" id= pwResult4></div>
		
		<div class="card card-body form-check" >
   	 	 <input class="card-body form-check-input text-start" type="checkbox" id="agree-charge" />
	  	<label class="form-check-label fs-5 text-end" for="agree-charge">탈퇴 후에는 아이디: ${memberVO.username} 으로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.
			<br>게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다. 또한, 툰 아이디를 사용해 다른 서비스에 로그인 할 수 없게 됩니다. 
			<br>안내 사항을 모두 확인하였으며, 이에 동의합니다.
			</label>
   		 </div> <br>
		
		<center><button id="start-charge" class="btn btn-danger" onclick="usernameDelete()" type="button" disabled>탈퇴</button></center>
		
		
	</sec:authorize>
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
    
	<script type="text/javascript" src="../js/changePassword.js"></script>

	
</body>
</html>