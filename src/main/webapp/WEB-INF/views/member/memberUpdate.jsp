<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
    <c:import url="../fragments/bootstrap.jsp"></c:import>
    <title>UPDATE</title>
   
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
    <link rel="stylesheet" href="/css/join.css">
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
                <a href="/member/myPage" >내 정보 조회</a>
              </li>
              
               <li>
                <a href="/member/changePassword" >비밀번호 변경</a>
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
      <center><h2><회원 정보 수정></h2></center>
      
	<form action="memberUpdate" method="post">

		 <div class="form-group">
     	 <label for="disabledTextInput">아이디</label>
    	  <input type="text" id="disabledTextInput" name="username" readonly="readonly" class="form-control" value= "${memberVO.username}"/>
   		 </div>
		
		 <div class="form-group">
      		<label for="Input">이름</label>
      		<input type="text" id="name"  name="name" maxlength="5" class="form-control" value= "${memberVO.name}">
      		 <div class="form-group" id= nameResult></div>
 		  </div>
 		  
 		  <div class="form-group">
      		<label for="Input">닉네임</label>
      		<input type="text" id="nickname" name="nickname" class="form-control" value="${memberVO.nickname}">
 		  </div>
 		  
 		  <div class="form-group">
      		<label for="Input">핸드폰</label>
      		<input id="phone" name="phone" class="form-control" value="${memberVO.phone}" type="tell" onKeyup="inputPhoneNumber(this);" onkeypress='handlerNum();' minlength="13" maxlength="13" >
      		<div class="form-group" id= phoneResult></div>
 		  </div>
 		  
 		  <div class="form-group">
      		<label for="Input">E-mail</label>
      		<input type="text" id="email" name="email" class="form-control" value="${memberVO.email}">
      		<div class="form-group" id= emailResult></div>
 		  </div><br>

		<center><button class="btn btn-info">Update</button></center>
	</form>
	
        <div class="page-content-wrapper-inner">
          <div class="content-viewport">
            <div class="row">
              <div class="col-12 py-5">
                <p class="text-gray">
           
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
    
    <script type="text/javascript">
    let name = document.getElementById("name");
    let phone = document.getElementById("phone");
    let email = document.getElementById("email");
    
    let phoneCheckResult = false;
    
    name.addEventListener("blur", function(){
		
    	let message  = "이름은 한글로만 수정 가능합니다.";
    	let c = "r3";
    		
    	nameResult.innerHTML=message;
    	nameResult.setAttribute("class", c);
    	
    });
    
    $("#name").keyup(function(event){

    	if (!(event.keyCode >=37 && event.keyCode<=40)) {

    		var inputVal = $(this).val();

    		$(this).val(inputVal.replace(/[a-z0-9]/gi,''));

    	}

    });
    
    function inputPhoneNumber(obj) {
    	
        var number = obj.value.replace(/[^0-9]/g, "");
        var phone = "";
        
        if(number.length < 4) {
            return number;
        } else if(number.length < 7) {
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3);
        } else if(number.length < 11) {
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3, 3);
            phone += "-";
            phone += number.substr(6);
        } else {
            phone += number.substr(0, 3);
            phone += "-";
            phone += number.substr(3, 4);
            phone += "-";
            phone += number.substr(7);
            
        }

        obj.value = phone;
    }
    
    $( "#phone").on("blur keyup", function() {
		$(phone).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
	});


function  handlerNum(){
 E = window.event;
 if(E.keyCode >47 && E.keyCode <58){   
  if(E.keyCode == 48){
   if(document.eduReg.ATTENDANT.value == "" ) E.returnValue=false;
   else return;
   }else return;
 }else{
  E.returnValue=false;
 }
}

phone.addEventListener("blur", function(){
	let message  = "폰 번호는 숫자만 입력가능합니다.";
	let c = "r3";
	
	let phone = $("#phone").val();
	let phoneTrim = $.trim(phone);
	
	if(phoneTrim.length==13){
		message = "올바르게 수정되었습니다.";
		c = "r2";
		phoneCheckResult=true;
	} else {
		message = "010-0000-0000 형식으로 수정하세요";
		c = "r1";
		phoneCheckResult = false;
	}
	
	let phoneResult = document.getElementById("phoneResult");
	phoneResult.innerHTML=message;
	phoneResult.setAttribute("class", c);
	
});


$("#email").keyup(function(event){

	if (!(event.keyCode >=37 && event.keyCode<=40)) {

	var inputVal = $(this).val();

	$(this).val(inputVal.replace(/[^a-z0-9@.]/gi,''));

	}

	});
    
    
email.addEventListener("blur", function(){
	
	let message  = "E-mail은 @/. 가 포함된 형식으로 수정하세요";
	let c = "r3";
		
	emailResult.innerHTML=message;
	emailResult.setAttribute("class", c);
	
});    
    
    </script>


</body>
</html>