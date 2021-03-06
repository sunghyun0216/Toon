
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<!--CSS관련 부트 스트랩  -->
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Purchase Ticket Page</title>
 <!-- Bootstrap CSS 5.0 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body>
<div class="container">

<a href="javascript:history.back();">뒤로가기</a>

  <div class="row justify-content-md-center">
    <div class="col"></div>
    <!-- col2시작 -->
    <div class="col-6">
    	<div class="card" style="width: 54rem;">
		  <div class="card-body">
		    <h3 class="card-title">소장권 구입하기</h3>
		    <P class="text-end fs-4">현재 포인트</P>
		    <p id="textpoint" class="text-end fs-2"> P </p>
		    <P class="text-end fs-6">현재 가진 소장권 갯수</P>
		    <p id="textnowstock" class="text-end fs-4"> 개 </p>
		    <P class="text-end fs-5">앞으로 가질 소장권 갯수</P>
		    <p id="textifStock" class="text-end fs-3 fw-bolder"> 개 </p>
		</div>
    	<form id="ticketBox" action="${pageContext.request.contextPath}/point/getToonTicket" method="post">
    		<div class="card">
    		
<!--     		<label> 사용자 username </label> -->
    		<input id="username" name="username" value="${info.username}" hidden="hidden"readonly="readonly"/>
    		
<!--     		<label> 사용자 보유 point </label> -->
    		<input type="number" id="curpoint" name="curpoint" value="${info.point}" hidden="hidden" readonly="readonly" disabled="disabled"/>
    		
<!--     		<label > 구입하려는 ToonNum </label> -->
    		<input type="number" id="toonNum" name="toonNum" value="${info.toonNum}" hidden="hidden" readonly="readonly"/>
    		
<!--     		<label > ToonNum으로 조회한 웹툰 타이틀 </label> //전송 X -->
    		<input type="text" id="toonTitle" name="toonTitle" value="${info.toonTitle}" hidden="hidden" readonly="readonly" disabled="disabled"/>
    		
<!--     		<label> 현재 가지고 있는 웹툰 소장권 갯수 </label> -->
    		<input type="number" id="curstock" name="curstock" value="${ticketBox.stock}" hidden="hidden" readonly="readonly" disabled="disabled"/>
    		
<!--     		<label> 충전할 소장권 갯수 </label> -->
    		<input id="stock" name="stock" value="0" readonly="readonly" hidden="hidden"/>
    		
<!--     		<label> 포인트 사용 뒤 보유할 소장권 갯수 </label> -->
    		<input  type="number" id="ifstock" name="ifstock" value=""hidden="hidden"  readonly="readonly" disabled="disabled"/>
    		
    		
<!--     		<label> contents에 담길 내용</label> -->
    		<input id="contents" name="contents" value="" readonly="readonly" hidden="hidden"/>
    		
<!--     		<label> sort</label> -->
    		<input id="sort" name="sort" value="1" readonly="readonly" hidden="hidden"/>
    		
<!--     		<label> isAlready </label> -->
    		<input type="number" id="isAlready" name="isAlready" value="${isAlready}" readonly="readonly" hidden="hidden"/>
    		
<!--     		<label> 티켓 사용 성공할 경우 가는 페이지 URL</label> -->
    		<input id="nextsuccess" name="nextsuccess" value="" readonly="readonly" disabled="disabled" hidden="hidden"/>
    		</div>
    		
    		<!-- 구입할 소장권 갯수 선택 -->
    		<div class="charge-select-area list-group list-group-flush card">
			 <ul>
		    	<li class="list-group-item">
		    		<div class="form-check card-body">
			  	 		<input class="form-check-input" id="case1" type="radio" name="point" value="200">
			  	  		<label class="form-check-label" for="case1"> 1개 :200P</label>
					</div>
		    	</li>
		    	<li class="list-group-item">
		    		<div class="form-check card-body">
			  	 		<input class="form-check-input" id="case6" type="radio" name="point" value="1000">
			  	  		<label class="form-check-label" for="case6"> 5개 :200P</label>
					</div>
		    	</li>
		    	<li class="list-group-item">
		    		<div class="form-check card-body">
				  	  <input class="form-check-input" id="case2" type="radio" name="point" value="2000">
				  	  <label class="form-check-label" for="case2">10개 : 2000P</label>
					</div>
				</li>
		    	<li class="list-group-item">
		    		<div class="form-check card-body">
					  <input class="form-check-input" id="case3" type="radio" name="point" value="4000">
				  	  <label class="form-check-label" for="case3">20개 : 4000P</label>
				</div>
		    	</li>
		    	<li class="list-group-item">
		    		<div class="form-check card-body">
					  <input class="form-check-input" id="case4" type="radio" name="point" value="6000">
				  	  <label class="form-check-label" for="case4">30개 : 6000P</label>
					</div>
		    	</li>
		    </ul><!--END CHARGE CHECKBOX -->
    		<!-- 결제 버튼 -->
    		<button class="btn btn-success" type="submit" id="getTicketButton">소장권 구매하기</button>
    		</div>
    		</div>
    	</form>
    </div><!-- 2col 끝 -->
    <div class="col"></div><!-- 3번째 col END-->
  </div><!-- container끝 -->
</div>

<script type="text/javascript" src="../../js/pay/getTicket.js"></script>

</body>
</html>