<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- BootStrap -->    
<!--     <link rel="icon" href="images/favicon.png" type="image/png">  위에 로고-->
    <c:import url="../fragments/bootstrap.jsp"></c:import>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    
    <!-- plugins:css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/iconfonts/mdi/css/materialdesignicons.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage/style.css">
	<!-- Layout style -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/asssets/images/favicon.ico" />
    
    <style type="text/css">
     .back {

    	border-style: solid;
    	border-color: #98DFFF;
     }
     #frm {
     	background-color: #F7F7F7;
     	border-style: solid;
     	border-color: #b4b4b4;
     	border-radius: 15px 15px 15px 15px;
     }
  
    
    </style>

<title>작품 등록</title>

<style type="text/css">
#sample {
	display: none;
}
</style>

</head>
<body>
<c:import url="../fragments/header.jsp"></c:import>
<div class="row">
  	<div class="col-2">
  		<c:import url="./adminNav.jsp"></c:import>
  	</div>


	<div class="container"><br>
	<h2>
			<p>
				<span
					style="border-radius: 15px 15px 15px 15px; border: 3px solid #b4b4b4; padding: 0.5em 0.6em; color: black; background-color: #dcdcdc;">관리자/작품등록</span>
			</p>
		</h2><br>
		<form id="frm" action="./manageToonInsert" method="post" enctype="multipart/form-data">
	
			<div class="form-group">
				<label for="toonTitle">&nbsp;제목</label> <input type="text"
					class="form-control myCheck" id="toonTitle" name="toonTitle">
			</div>
			<div class="form-group">
				<label for="genre">&nbsp;장르</label> <input type="text"
					class="form-control myCheck" id="genre" name="genre">
			</div>
			<div class="form-group">
				<label for="writerID">&nbsp;작성자</label> <input type="text"
					class="form-control myCheck" id="writerID" name="writerID">
			</div>
			
			<div class="form-group">
				<label for="toonSum">&nbsp;요약내용</label>
				<textarea class="form-control myCheck" rows="5" id="toonSum"
					name="toonSum"></textarea>
			</div>
			
			<div class="form-group">
				<label for="toonDay">&nbsp;요일</label> <input type="text"
					class="form-control myCheck" id="toonDay" name="toonDay">
			</div>
			
			<div class="form-group">
				<label for="state">&nbsp;여부</label> <input type="text"
					class="form-control myCheck" id="state" name="state">
			</div>

			<div class="form-group">
				<label for="titleImg">&nbsp;타이틀이미지</label>
				<textarea class="form-control myCheck" rows="5" id="titleImg"
					name="titleImg"></textarea>
			</div>
			
			<div class="form-group">
				<label for="ratingSum">&nbsp;평점</label> <input type="number"
					class="form-control myCheck" id="ratingSum" name="ratingSum">
			</div>
			
			<div class="form-group">
				<label for="ratingPerson">&nbsp;평점(수)</label> <input type="number"
					class="form-control myCheck" id="ratingPerson" name="ratingPerson">
			</div>

			&nbsp;&nbsp;<input type="button" id="btn" value="등록" class="btn btn-secondary">
		</form>
	</div>
	
	<div id="sample">
		<div class="input-group">
			<div class="custom-file">
				<input type="file"  id="inputGroupFile04"
					class="form-control-file border" name="files">
			</div>
			<div class="input-group-append delete">
				<input class="btn btn-outline-secondary" type="button"
					id="inputGroupFileAddon04" value="Delete">
			</div>
		</div>
	</div>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript" src="../js/board/boardInsert.js"></script>

</body>
</html>
